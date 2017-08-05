package entities;

class Entity{

	public var pos(default, null):Vector2;

	public function shouldRender(){
		return true;
	}

	public function new(x:Float = 0, y:Float = 0){
		pos = new Vector2(x,y);
	}


	//TODO create bounds for objects
	public function getBounds():differ.shapes.Shape{
		return null;
	}

	public function update(dt:Float){

	}

	public function render(g:Graphics){

	}

}