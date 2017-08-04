package utils;

import kha.math.Random;
import kha.math.Vector2;

class MathUtils{

	public static var RANDOM:Random = new Random(Std.int(Math.random()*100000));

	public static inline function minVector(a:Vector2, b:Vector2){
		return new Vector2(Math.min(a.x, b.x), Math.min(a.y, b.y));
	}

	public static inline function maxVector(a:Vector2, b:Vector2){
		return new Vector2(Math.max(a.x, b.x), Math.max(a.y, b.y));
	}

}