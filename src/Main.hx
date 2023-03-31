import love.graphics.Quad;
import love.graphics.Image;
import lua.Table;
import lua.lib.luv.Idle;
import love.graphics.GraphicsModule;
import love.Love;

class Game {
	var idle:Image;
	var ground:Image;
	var idleQuad:Quad;
	var groundQuad:Quad;
	var player:Player;

	public function new() {}

	public function load(args:Table<Dynamic, Dynamic>, options:Table<Dynamic, Dynamic>) {
		player = new Player();
		player.load(args, options);
		ground = GraphicsModule.newImage("assets/sprites/ground.png");
		groundQuad = GraphicsModule.newQuad(16, 0, 16, 16, ground);
	}

	public function update(dt:Float) {
		player.update(dt);
	}

	public function draw() {
		player.draw();
		GraphicsModule.scale(1, 1);
		GraphicsModule.draw(ground, groundQuad, 100, 120);
	}

	public function keypressed(key:Dynamic, scancode:Dynamic, isrepeat:Dynamic) {
		player.keypressed(key, scancode, isrepeat);
	}
}

class Main {
	static function main() {
		var game = new Game();
		Love.load = game.load.bind();
		Love.draw = game.draw.bind();
		Love.update = game.update.bind();
		Love.keypressed = game.keypressed.bind();
	}
}
