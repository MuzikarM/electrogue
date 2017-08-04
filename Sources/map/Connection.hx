package map;


class Connection{

	public var a(default, null):Point;
	public var b(default, null):Point;

	public function new(a:Point, b:Point){
		this.a = a;
		this.b = b;
	}


	public function render(g:Graphics){
		g.drawLine(a.pos.x, a.pos.y, b.pos.x, a.pos.y, 2);
		g.fillRect(b.pos.x-2, a.pos.y-2, 4, 4);
		g.drawLine(b.pos.x, a.pos.y, b.pos.x, b.pos.y, 2);
	}

}