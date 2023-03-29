import love.graphics.GraphicsModule;
import love.Love;

class Main {
	static function main() {
		Love.draw = draw.bind();
	}

	static function draw() {
		GraphicsModule.print("Hello World!");
	}
}
