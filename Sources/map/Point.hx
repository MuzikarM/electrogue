package map;

import kha.math.Vector2;
import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Point{

	public var pos(default, null):Vector2;

	public function new(x:Float = 0, y:Float = 0){
		pos = new Vector2(x,y);
	}

	public function render(g:Graphics){
		g.fillCircle(pos.x, pos.y, 5);
	}

}