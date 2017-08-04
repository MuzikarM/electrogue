package map;

import utils.MathUtils;

class Connection{

	var a:Point;
	var b:Point;

	var min:Vector2;
	var max:Vector2;

	public function new(a:Point, b:Point){
		this.a = a;
		this.b = b;

		min = MathUtils.minVector(a.pos, b.pos);
		max = MathUtils.maxVector(a.pos, b.pos);
	}



	public function render(g:Graphics){
		//g.fillRect(a.pos.x, a.pos.y-1, Math.abs(max.x - min.x), 3);
		//g.fillRect(b.pos.x-1, a.pos.y, 3, Math.abs(max.y - min.y));
		g.drawLine(a.pos.x, a.pos.y, b.pos.x, a.pos.y, 2);
		g.fillRect(b.pos.x-2, a.pos.y-2, 4, 4);
		g.drawLine(b.pos.x, a.pos.y, b.pos.x, b.pos.y, 2);
	}

}