package entities;

import utils.Controls;
import utils.MathUtils;


using kha.graphics2.GraphicsExtension;

class Player extends Entity{

	var controls:Controls;
	var speed:Float = 5;


	public function new(x:Float = 0, y:Float = 0){
		super(x,y);
		controls = new Controls();
	}

	public override function update(){
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
		pos.x = MathUtils.clamp(25, 512, pos.x);
		pos.y = MathUtils.clamp(25, 512, pos.y);
	}

	public override function render(g:Graphics){
		g.color = 0xff00ff00;
		g.fillCircle(pos.x, pos.y, 7);
		g.color = 0xffffffff;
	}

}