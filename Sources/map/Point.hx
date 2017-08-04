package map;

import kha.math.Vector2;
import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Point{

	public var pos(default, null):Vector2;
	public var left(default, null):Connection;
	public var right(default, null):Connection;
	public var up(default, null):Connection;
	public var down(default, null):Connection;

	public function new(x:Float = 0, y:Float = 0){
		pos = new Vector2(x,y);
	}

	public function onConnection(other:Point, c:Connection){
		if (pos.x < other.pos.x){
			right = c;
		}
		if (pos.x > other.pos.x){
			left = c;
		}
	}

	public function onConnected(other:Point, c:Connection){
		if (pos.y > other.pos.y){
			up = c;
		}
		if (pos.y < other.pos.y){
			down = c;
		}
	}

	public function render(g:Graphics){
		g.fillCircle(pos.x, pos.y, 5);
	}

}