package love.joystick;

import haxe.extern.Rest;
import lua.Table;
import lua.UserData;

@:native("love.joystick")
extern class JoystickModule {
	public static function getGamepadMappingString(guid:String):String;

	public static function getJoystickCount():Float;

	public static function getJoysticks():Table<Dynamic, Dynamic>;

	@:overload(function(mappings:String):Void {})
	public static function loadGamepadMappings(filename:String):Void;

	@:overload(function():String {})
	public static function saveGamepadMappings(filename:String):String;

	@:overload(function(guid:String, axis:GamepadAxis, inputtype:JoystickInputType, inputindex:Float, ?hatdir:JoystickHat):Bool {})
	public static function setGamepadMapping(guid:String, button:GamepadButton, inputtype:JoystickInputType, inputindex:Float, ?hatdir:JoystickHat):Bool;
}
