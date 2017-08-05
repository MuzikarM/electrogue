package utils;

import kha.math.Random;
import kha.math.Vector2;

class MathUtils{

	public static var RANDOM:Random = new Random(Std.int(Math.random()*100000));

	public static function clamp(min:Float, max:Float, amount:Float){
		return Math.min(max, Math.max(min, amount));
	}

	public static function isCloseEnough(a:Vector2, b:Vector2):Bool{
		return Std.int(a.x) == Std.int(b.x) && Std.int(a.y) == Std.int(b.y);
	}

	public static inline function sqr(a:Float):Float{
		return a * a;
	}

	public static function distance(a:Vector2, b:Vector2):Float{
		return sqr(a.x - b.x) + sqr(a.y - b.y);
	}

	public static function getDistanceSqrt(a:Vector2, b:Vector2):Float{
		return Math.sqrt(distance(a,b));
	}

	public static function findClosestPoint(points:Array<map.Point>, player:entities.Player):map.Point{
		var closest = points[0];
		var cldist = distance(closest.pos, player.pos);
		for (point in points){
			var dist = distance(player.pos, point.pos);
			if (dist < cldist){
				cldist = dist;
				closest = point;
			}
		}
		return closest;
	}

}