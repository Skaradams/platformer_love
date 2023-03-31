import haxe.Log;
import love.graphics.Quad;
import love.graphics.Image;
import lua.Table;
import lua.lib.luv.Idle;
import love.graphics.GraphicsModule;
import love.keyboard.KeyboardModule;
import love.Love;

class Player {
	var idle:Image;
	var idleQuad:Quad;
	var x:Float;
	var y:Float;
	var speed:Float = 50;
	var acceleration:Float = 370;
	var accelerationRate:Float = 0;
	var jump:Bool = false;

	public function new() {}

	public function load(args:Table<Dynamic, Dynamic>, options:Table<Dynamic, Dynamic>) {
		x = 100;
		y = 50;
		GraphicsModule.setDefaultFilter(Nearest, Nearest);
		idle = GraphicsModule.newImage("assets/sprites/idle.png");
		idleQuad = GraphicsModule.newQuad(0, 0, 16, 16, idle);
	}

	public function update(dt:Float) {
		if (jump) {
			y -= 100 * dt;
		}

		if (y < (120 - 16)) {
			accelerationRate += acceleration * dt;
			y += accelerationRate * dt;
		} else {
			y = 120 - 16;
			accelerationRate = 0;
			jump = false;
		}

		if (KeyboardModule.isDown("left")) {
			x -= speed * dt;
		}
		if (KeyboardModule.isDown("right")) {
			x += speed * dt;
		}
	}

	public function keypressed(key:String, scancode:Int, isrepeat:Bool) {
		if (key == "space") {
			if (y == 120 - 16) {
				jump = true;
			}
		}
	}

	public function draw() {
		GraphicsModule.scale(4, 4);
		GraphicsModule.draw(idle, idleQuad, lua.Math.floor(x), lua.Math.floor(y));
	}
}
