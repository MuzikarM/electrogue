package entities;

import utils.Controls;
import utils.MathUtils;


using kha.graphics2.GraphicsExtension;

class Player extends Entity{

	var maxFreeTime:Float = 5;

	var controls:Controls;
	var speed:Float = 5;
	var state:State;

	public function new(point:map.Point){
		super(point.pos.x, point.pos.y);
		state = NODE(point);
		controls = new Controls();
	}

	public override function update(dt:Float){
		switch(state){
			case(FREE(tl, prev)):{
				if (controls.left){
					pos.x -= speed;
				}
				if (controls.right){
					pos.x += speed;
				}
				if (controls.up){
					pos.y -= speed;
				}
				if (controls.down){
					pos.y += speed;
				}
				tl -= dt;
				if (tl <= 0){
					state = prev;
				} else {
					state = FREE(tl, prev);
				}
				pos.x = MathUtils.clamp(25, 512, pos.x);
				pos.y = MathUtils.clamp(25, 512, pos.y);
			}
			case(NODE(n)):{
				function check(b:Bool, val:map.Connection, p:map.Point){
					if (b && val != null){
						state = CONNECTION(val, p);
					}
				}
				if (controls.space){
					state = FREE(maxFreeTime, state);
				}
				check(controls.left, n.left, n);
				check(controls.right, n.right, n);
				check(controls.up, n.up, n);
				check(controls.down, n.down, n);
			}
			case(CONNECTION(c, p)):{
				if (controls.space){
					state = FREE(maxFreeTime, state);
				}
				trace("Player in on connection");
				pos = c.move(pos, p, 2);
				var other = c.getOther(p);
				if (MathUtils.isCloseEnough(pos, other.pos)){
					trace("changing state to node");
					state = NODE(other);
				}
			}
		}
		
	}

	public override function render(g:Graphics){
		g.color = 0xff00ff00;
		g.fillCircle(pos.x, pos.y, 7);
		g.color = 0xffffffff;
	}

}


enum State{
	FREE(timeleft:Float, prevState:State);
	NODE(point:map.Point);
	CONNECTION(connection:map.Connection, prev:map.Point);
}