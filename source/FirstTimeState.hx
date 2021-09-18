package;

import lime.app.Application;
import openfl.Lib;
import flixel.addons.transition.TransitionData;
import flixel.addons.transition.Transition;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import MainVariables._variables;
import Discord.DiscordClient;

using StringTools;

class FirstTimeState extends MusicBeatState
{
	var nextMsg:Bool = false;
	var text:FlxText;
	var frakits:FlxSprite;
	var glitch:FlxSprite;

	public static var leftState:Bool = false;

	override function create()
	{

		
		DiscordClient.changePresence("birthday wishes", null);
		
		frakits = new FlxSprite(-40, 300).loadGraphic(Paths.image('frakits', 'week7'));
		frakits.antialiasing = true;
		frakits.updateHitbox();
		frakits.scale.set(0.6, 0.6);
		glitch = new FlxSprite(30, 50).loadGraphic(Paths.image('glitch', 'week7'));
		glitch.antialiasing = true;
		glitch.updateHitbox();
		text = new FlxText(200, 0, 1000,
			"\n\nur ugly lol"
			+ "\n\n\n\n\n\nsuck my nuts",
			32);
		text.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		add(text);
		add(frakits);
		add(glitch);

		super.create();
	}

	override function update(elapsed:Float)
	{
		var no:Bool = false;

		if (FlxG.keys.justPressed.ENTER)
		{
			_variables.firstTime = false;
			leftState = true;
			MainVariables.Save();
			FlxG.switchState(new TitleState());
		}

		super.update(elapsed);
	}
}
