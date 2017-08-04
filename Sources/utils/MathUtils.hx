package utils;

import kha.math.Random;
import kha.math.Vector2;

class MathUtils{

	public static var RANDOM:Random = new Random(Std.int(Math.random()*100000));

	public static function clamp(min:Float, max:Float, amount:Float){
		return Math.min(max, Math.max(min, amount));
	}

}