package map;

import utils.MathUtils;
import entities.Entity;
import entities.Player;

class Level{

	static inline var MIN_POINTS:Int = 10;
	static inline var MAX_POINTS:Int = 50;

	var width:Float;
	var height:Float;

	var points:Array<Point>;
	var connections:Array<Connection>;
	var entities:Array<Entity>;

	public function new(w:Float = 512, h:Float = 512){
		width = w;
		height = h;
		entities = [];
		populateLevel();
	}

	private function populateLevel(){
		this.points = generatePoints();
		this.connections = connectPoints();

		var point = points[MathUtils.RANDOM.GetIn(0, points.length-1)];
		entities.push(new Player(point.pos.x, point.pos.y));

		trace('Generated map with total of ${points.length} points');
	}

	private function generatePoints():Array<Point>{
		return [
			for (i in 0...MathUtils.RANDOM.GetIn(MIN_POINTS, MAX_POINTS)){
				new Point(MathUtils.RANDOM.GetFloatIn(20, width), MathUtils.RANDOM.GetFloatIn(20, height));
			} 
		];
	}

	private function connectPoints():Array<Connection>{
		return [
			for (i in 0...points.length-1){
				new Connection(points[i], points[i+1]);
			}
		];
	}

	public function update(){
		for (entity in entities){
			entity.update();
		}
	}

	public function render(g:Graphics){
		g.color = 0xffff0000;
		for (c in connections){
			c.render(g);
		}
		g.color = 0xffffffff;
		for (point in points){
			point.render(g);
		}
		for (entity in entities){
			if (entity.shouldRender()){
				entity.render(g);
			}
		}
	}

}