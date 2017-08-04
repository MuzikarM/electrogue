package utils;

import kha.Key;

class Controls{

	public var left(default, null):Bool;
	public var right(default, null):Bool;
	public var up(default, null):Bool;
	public var down(default, null):Bool;
	public var space(default, null):Bool;
	
	public function new(){
		kha.input.Keyboard.get().notify(keyDown, keyUp);
	}

	function keyDown(k:Key, s:String){
		switch(k){
			case(UP):
				up = true;
			case(DOWN):
				down = true;
			case(LEFT):
				left = true;
			case(RIGHT):
				right = true;
			default:
				//no-op
		}
		switch(s.toLowerCase()){
			case("w"):
				up = true;
			case("s"):
				down = true;
			case("a"):
				left = true;
			case("d"):
				right = true;
			case(" "):
				space = true;
			default:
				//no-op
		}
	}

	function keyUp(k:Key, s:String){
		switch(k){
			case(UP):
				up = false;
			case(DOWN):
				down = false;
			case(LEFT):
				left = false;
			case(RIGHT):
				right = false;
			default:
				//no-op
		}
		switch(s.toLowerCase()){
			case("w"):
				up = false;
			case("s"):
				down = false;
			case("a"):
				left = false;
			case("d"):
				right = false;
			case(" "):
				space = false;
			default:
				//no-op
		}
	}


}