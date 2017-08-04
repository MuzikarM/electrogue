package map;

import utils.MathUtils;

class Level{

	static inline var MIN_POINTS:Int = 10;
	static inline var MAX_POINTS:Int = 50;

	var width:Float;
	var height:Float;

	var points:Array<Point>;
	var connections:Array<Connection>;

	public function new(w:Float = 512, h:Float = 512){
		width = w;
		height = h;
		populateLevel();
		/*points = [
			new Point(140, 70),
			new Point(70, 250),
			new Point(315, 85),
			new Point(250, 140)
		];
		connections = [
			new Connection(points[0], points[3]),
			new Connection(points[2], points[0]),
			new Connection(points[1], points[2])
		];*/
	}

	private function populateLevel(){
		this.points = generatePoints();
		this.connections = connectPoints();

		trace('Generated map with total of ${points.length} points');
	}

	private function generatePoints():Array<Point>{
		return [
			for (i in 0...MathUtils.RANDOM.GetIn(MIN_POINTS, MAX_POINTS)){
				new Point(MathUtils.RANDOM.GetFloatIn(10, width), MathUtils.RANDOM.GetFloatIn(10, height));
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

	public function render(g:Graphics){
		for (point in points){
			point.render(g);
		}
		for (c in connections){
			c.render(g);
		}
	}

}