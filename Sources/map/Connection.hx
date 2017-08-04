package map;

import utils.MathUtils;

class Connection{

	public var a(default, null):Point;
	public var b(default, null):Point;

	public function new(a:Point, b:Point){
		this.a = a;
		this.b = b;
		
		a.onConnection(b, this);
		b.onConnected(a, this);
	}

	public function move(pos:kha.math.Vector2, from:Point, speed:Float){
		var c = new kha.math.Vector2(pos.x, pos.y);
		if (from == a){
			if (Std.int(c.x) == (Std.int(b.pos.x))){
				if (a.pos.y > b.pos.y){
					c.y = MathUtils.clamp(b.pos.y, a.pos.y, c.y - speed);
				}
				else {
					c.y = MathUtils.clamp(a.pos.y, b.pos.y, c.y + speed);
				}
			} else {
				if (a.pos.x > b.pos.x){
					c.x = MathUtils.clamp(b.pos.x, a.pos.x, c.x - speed);
				} else {
					c.x = MathUtils.clamp(a.pos.x, b.pos.x, c.x + speed);
				}
			}
		} else {
			if (Std.int(c.y) == Std.int(a.pos.y)){
				if (a.pos.x > b.pos.x){
					c.x = MathUtils.clamp(b.pos.x, a.pos.x, c.x + speed);
				} else {
					c.x = MathUtils.clamp(a.pos.x, b.pos.x, c.x - speed);
				}
			} else {
				if (a.pos.y > b.pos.y){
					c.y = MathUtils.clamp(b.pos.y, a.pos.y, c.y + speed);
				} else {
					c.y = MathUtils.clamp(a.pos.y, b.pos.y, c.y - speed);
				}
			}
		}
		return c;
	}

	public function getOther(point:Point){
		if (point == a)
			return b;
		return a;
	}

	public function render(g:Graphics){
		g.drawLine(a.pos.x, a.pos.y, b.pos.x, a.pos.y, 2);
		g.fillRect(b.pos.x-2, a.pos.y-2, 4, 4);
		g.drawLine(b.pos.x, a.pos.y, b.pos.x, b.pos.y, 2);
	}

}