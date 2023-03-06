/*
* A love letter to both OG FNF Players & The devs behind the Vs Hex Mod
* R.A.M. Remix by: Choma41
* Original Track by: YingYang48
* Assets taken from the Vs Hex Mod
* Stage File, Scripting & Charting by: DEMOLITIONDON96 (me)
*
* Check out everyone credited above, and...
* Thank you for playing!
*/

// Normal
var stageFront:FNFSprite;
var bg:FNFSprite;

// Sunset
var stageFrontSun:FNFSprite;
var bgSun:FNFSprite;

// Night
var stageFrontNight:FNFSprite;
var bgNight:FNFSprite;

// Cool Flashing Effects
var flashThing:FlxSprite;
var flashBG:FlxSprite;

var blackBG:FlxSprite; // fixes the issue with the stage assets overlapping one another being revealed

function onCreate()
{
	spawnGirlfriend(true);
	PlayState.defaultCamZoom = 0.9;
	PlayState.cameraSpeed = 1;

	bg = new FNFSprite(-600, -200).loadGraphic(Paths.image('stageback', 'data/stages/basketballCourt/images'));
	bg.scale.set(1.15, 1);
	bg.antialiasing = true;
	bg.scrollFactor.set(0.9, 0.9);
	bg.active = false;
	add(bg);

	stageFront = new FNFSprite(-850, 600).loadGraphic(Paths.image('stagefront', 'data/stages/basketballCourt/images'));
	stageFront.setGraphicSize(Std.int(stageFront.width * 1.25));
	stageFront.updateHitbox();
	stageFront.antialiasing = true;
	stageFront.scrollFactor.set(0.9, 0.9);
	stageFront.active = false;
	add(stageFront);

	bgSun = new FNFSprite(-600, -200).loadGraphic(Paths.image('stageback-s', 'data/stages/basketballCourt/images'));
	bgSun.scale.set(1.15, 1);
	bgSun.antialiasing = true;
	bgSun.alpha = 0;
	bgSun.scrollFactor.set(0.9, 0.9);
	bgSun.active = false;
	add(bgSun);

	stageFrontSun = new FNFSprite(-850, 600).loadGraphic(Paths.image('stagefront-s', 'data/stages/basketballCourt/images'));
	stageFrontSun.setGraphicSize(Std.int(stageFrontSun.width * 1.25));
	stageFrontSun.updateHitbox();
	stageFrontSun.antialiasing = true;
	stageFrontSun.alpha = 0;
	stageFrontSun.scrollFactor.set(0.9, 0.9);
	stageFrontSun.active = false;
	add(stageFrontSun);

	bgNight = new FNFSprite(-600, -200).loadGraphic(Paths.image('stageback-n', 'data/stages/basketballCourt/images'));
	bgNight.scale.set(1.15, 1);
	bgNight.antialiasing = true;
	bgNight.alpha = 0;
	bgNight.scrollFactor.set(0.9, 0.9);
	bgNight.active = false;
	add(bgNight);

	stageFrontNight = new FNFSprite(-850, 600).loadGraphic(Paths.image('stagefront-n', 'data/stages/basketballCourt/images'));
	stageFrontNight.setGraphicSize(Std.int(stageFrontNight.width * 1.25));
	stageFrontNight.updateHitbox();
	stageFrontNight.antialiasing = true;
	stageFrontNight.alpha = 0;
	stageFrontNight.scrollFactor.set(0.9, 0.9);
	stageFrontNight.active = false;
	add(stageFrontNight);

	blackBG = new FlxSprite(-800, -200).makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFF000000);
	blackBG.alpha = 0;
	blackBG.active = false;
	add(blackBG);	

	flashBG = new FlxSprite(-800, -200).makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFFFFFFFF);
	flashBG.alpha = 0;
	flashBG.blend = ForeverTools.returnBlendMode("add");
	flashBG.active = false;
	add(flashBG);	

	flashThing = new FlxSprite(-800, -200).makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFFFFFFFF);
	flashThing.alpha = 0;
	flashThing.blend = ForeverTools.returnBlendMode("add");
	flashThing.active = false;
	foreground.add(flashThing);
}

function onBeat(curBeat:Int, boyfriend:Character, gf:Character, dad:Character)
{
	/*
	* R.A.M. Modchart (Absolute peak)
	* 
	* don't you dare fucking steal this, i swear to god-
	*/
	if (curBeat == 1)
	{
		FlxTween.tween(blackBG, {alpha: 0.7}, 5, {ease: FlxEase.quartInOut});
		FlxTween.tween(PlayState.camHUD, {alpha: 0}, 0.8, {ease: FlxEase.quartInOut});
		for (i in PlayState.strumHUD)
			FlxTween.tween(i, {alpha: 0}, 0.8, {ease: FlxEase.quartInOut});
	}

	if (curBeat == 7)
		FlxTween.tween(PlayState, {defaultCamZoom: 1.5}, 3, {ease: FlxEase.quartInOut});

	if (curBeat == 15)
	{
		FlxTween.tween(blackBG, {alpha: 0}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(PlayState, {defaultCamZoom: 0.9}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(PlayState.camHUD, {alpha: 1}, 0.3, {ease: FlxEase.sineOut});
		for (i in PlayState.strumHUD)
			FlxTween.tween(i, {alpha: 1}, 0.3, {ease: FlxEase.sineOut});
	}

	if (curBeat == 16 || curBeat == 80)
	{
		flashThing.alpha = 1;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		new FlxTimer().start(0.78, function(tmr:FlxTimer){
			flashThing.alpha = 0.5;
			FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		});
	}

	if (curBeat == 88 || curBeat == 144)
	{
		flashThing.alpha = 1;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
	}

	if (curBeat == 23 || curBeat == 31 || curBeat == 39 || curBeat == 87 || curBeat == 144)
	{
		flashBG.alpha = 0.6;
		FlxTween.tween(flashBG, {alpha: 0}, 0.8, {ease: FlxEase.sineOut});
	}

	if (curBeat == 20 || curBeat == 28 || curBeat == 36 || curBeat == 44 || curBeat == 84)
	{
		PlayState.defaultCamZoom = 1.1;
		flashThing.alpha = 0.5;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		new FlxTimer().start(0.78, function(tmr:FlxTimer){
			flashThing.alpha = 0.5;
			FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		});
	}

	if (curBeat == 46)
	{
		flashBG.alpha = 0.8;
		FlxTween.tween(flashBG, {alpha: 0}, 0.15, {ease: FlxEase.sineOut});
		new FlxTimer().start(0.3, function(tmr:FlxTimer){
			flashBG.alpha = 0.5;
			new FlxTimer().start(0.05, function (tmr:FlxTimer){
				flashBG.alpha = 0.1;
				new FlxTimer().start(0.05, function (tmr:FlxTimer){
					flashBG.alpha = 0.6;
					new FlxTimer().start(0.05, function (tmr:FlxTimer){
						flashBG.alpha = 0.3;
						new FlxTimer().start(0.1, function (tmr:FlxTimer){
							flashBG.alpha = 0.7;
							new FlxTimer().start(0.1, function (tmr:FlxTimer){
								flashBG.alpha = 0.2;
								new FlxTimer().start(0.1, function (tmr:FlxTimer){
									flashBG.alpha = 0.5;
									FlxTween.tween(flashBG, {alpha: 0}, 0.15, {ease: FlxEase.sineOut});
								});
							});
						});
					});
				});
			});
		});
	}

	if (curBeat == 24 || curBeat == 32 || curBeat == 40)
	{
		PlayState.defaultCamZoom = 0.9;
		flashThing.alpha = 0.5;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		new FlxTimer().start(0.78, function(tmr:FlxTimer){
			flashThing.alpha = 0.5;
			FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		});
	}

	if (curBeat == 48)
	{
		PlayState.defaultCamZoom = 0.9;
		flashThing.alpha = 0.3;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
	}

	if (curBeat == 49 || curBeat == 51 || curBeat == 53 || curBeat == 55 || curBeat == 57 || curBeat == 59 || curBeat == 61 || curBeat == 63 || curBeat == 65 || curBeat == 67 ||
		curBeat == 69 || curBeat == 71 || curBeat == 73 || curBeat == 75 || curBeat == 77 || curBeat == 79 || curBeat == 89 || curBeat == 91 || curBeat == 93 || curBeat == 95 ||
		curBeat == 97 || curBeat == 99 || curBeat == 101 || curBeat == 103 || curBeat == 105 || curBeat == 107 || curBeat == 109 || curBeat == 111)
	{
		flashBG.alpha = 0.65;
		FlxTween.tween(flashBG, {alpha: 0}, 0.2);
	}

	if (curBeat >= 144 && curBeat <= 240)
	{
		flashBG.alpha = 0.65;
		FlxTween.tween(flashBG, {alpha: 0}, 0.2);
		for (i in PlayState.strumHUD)
			{
				FlxTween.tween(i, {y: i.y - 20}, 0.25, {ease: FlxEase.sineInOut});
				new FlxTimer().start(0.25, function (tmr:FlxTimer){
					FlxTween.tween(i, {y: i.y + 20}, 0.25, {ease: FlxEase.sineInOut});
				});
			}
	}

	if (curBeat == 50 || curBeat == 56 || curBeat == 66 || curBeat == 74 || curBeat == 147 || curBeat == 150 || curBeat == 163 || curBeat == 166 ||
		curBeat == 232)
		PlayState.defaultCamZoom = 1.2;

	if (curBeat == 51 || curBeat == 58 || curBeat == 62 || curBeat == 67 || curBeat == 78 || curBeat == 102 || curBeat == 155 || curBeat == 171 ||
		curBeat == 238)
		PlayState.defaultCamZoom = 1.3;

	if (curBeat == 52 || curBeat == 54 || curBeat == 60 || curBeat == 64 || curBeat == 68 || curBeat == 76 || curBeat == 80 || 
		curBeat == 88 || curBeat == 104 || curBeat == 140 || curBeat == 148 || curBeat == 152 || curBeat == 156 || curBeat == 164 ||
		curBeat == 168 || curBeat == 172 || curBeat == 216 || curBeat == 240)
		PlayState.defaultCamZoom = 0.9;

	if (curBeat == 53 || curBeat == 61 || curBeat == 71 || curBeat == 77 || curBeat == 96 || curBeat == 112 || curBeat == 146 || curBeat == 162)
		PlayState.defaultCamZoom = 1.1;

	if (curBeat == 111)
		PlayState.defaultCamZoom = 1.4;

	if (curBeat == 145 || curBeat == 161 || curBeat == 224)
		PlayState.defaultCamZoom = 1;

	if (curBeat == 112)
	{	
		flashThing.alpha = 0.3;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		flashBG.alpha = 0.8;
		FlxTween.tween(flashBG, {alpha: 0}, 0.2, {ease: FlxEase.sineOut});
		FlxTween.tween(blackBG, {alpha: 0.8}, 3, {ease: FlxEase.quartInOut});
	}

	if (curBeat == 140)
	{
		flashThing.alpha = 0.4;
		FlxTween.tween(flashThing, {alpha: 0}, 0.5);
		flashBG.alpha = 0.8;
		FlxTween.tween(flashBG, {alpha: 0}, 0.2, {ease: FlxEase.sineOut});
		FlxTween.tween(blackBG, {alpha: 0}, 0.5, {ease: FlxEase.sineInOut});
		FlxTween.tween(bgSun, {alpha: 1}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(stageFrontSun, {alpha: 1}, 0.5, {ease: FlxEase.sineOut});
	}

	if (curBeat == 176)
		FlxTween.tween(blackBG, {alpha: 0.85}, 0.5, {ease: FlxEase.sineOut});

	if (curBeat == 207)
	{
		FlxTween.tween(blackBG, {alpha: 0}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(bgNight, {alpha: 1}, 0.5, {ease: FlxEase.sineOut});
		FlxTween.tween(stageFrontNight, {alpha: 1}, 0.5, {ease: FlxEase.sineOut});
	}

	if (curBeat == 208)
		PlayState.defaultCamZoom = 0.8;

	if (curBeat == 240)
	{
		FlxTween.tween(PlayState.camHUD, {alpha: 0}, 0.6, {ease: FlxEase.sineOut});
		for (i in PlayState.strumHUD)
			FlxTween.tween(i, {alpha: 0}, 0.6, {ease: FlxEase.sineOut});
	}

	if (curBeat == 250)
		{
			FlxTween.tween(PlayState.camHUD, {alpha: 1}, 0.6, {ease: FlxEase.sineOut});
			for (i in PlayState.strumHUD)
				FlxTween.tween(i, {alpha: 1}, 0.6, {ease: FlxEase.sineOut});
		}

	if (curBeat == 254)
	{
		PlayState.camGame.alpha = 0;
		PlayState.camHUD.alpha = 0;
		for (i in PlayState.strumHUD)
			i.alpha = 0;
	}
}

// Character Setup
function charStagePos(boyfriend:Character, gf:Character, dad:Character)
{
	boyfriend.setPosition(790, 450);
	dad.setPosition(100, 80);
	gf.setPosition(320, 100);
}