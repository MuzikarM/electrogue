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

}