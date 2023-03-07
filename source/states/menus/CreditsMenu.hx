package states.menus;

import base.dependency.FeatherDeps.ScriptHandler;
import haxe.Json;
import sys.io.File;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import sys.FileSystem;
import objects.fonts.Alphabet;
import states.*;
import states.menu.*;

using StringTools;

/*
* THIS IS VERY WORK IN PROGRESS
*/
typedef Credits = {
    // Credit
    var name:String;
    var quote:String;
    var profession:String;
    var description:String;
    var color:String;
    
    // Social Links
    var ytLink:String;
    var twitterLink:String;
    var gbLink:String;
    var gjLink:String;
    var gitLink:String;
    var scLink:String;
}

class CreditsMenu extends MusicBeatState
{
    public var hasLinkYT:Bool = false;
    public var hasLinkTwit:Bool = false;
    public var hasLinkGB:Bool = false;
    public var hasLinkGJ:Bool = false;
    public var hasLinkGit:Bool = false;
    public var hasLinkSC:Bool = false;
    
    public var moverCooldown:Float = 0;
    public var verticalSelection:Int = 0;

    public var nameTxt:FlxText;
    public var quoteTxt:FlxText;
    public var profTxt:FlxText;
    public var descTxt:FlxText;
    
    var colorBGTween:FlxTween;
    var iconTween:FlxTween;
    
    public var ytIcon:FlxSprite;
    public var twitIcon:FlxSprite;
    public var gbIcon:FlxSprite;
    public var gjIcon:FlxSprite;
    public var gitIcon:FlxSprite;
    public var scIcon:FlxSprite;
    
    var infoBox:FlxSprite;
    var iconBox:FlxSprite;
    
    var upArrow:FlxSprite;
    var downArrow:FlxSprite;
    
    public var iconList:Array<FlxSprite> = [];
    public var personList:Array<Credits> = [];
    var bg:FlxSprite;
    
    override function create()
    {
    	// placeholder
    	super.create();
	
        bg = new FlxSprite(-80);
        bg.loadGraphic(Paths.image('menus/base/menuDesat'));
        bg.scrollFactor.set(0, 0.18);
        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.updateHitbox();
        bg.screenCenter();
        bg.antialiasing = true;
        add(bg);

        var list:Array<String> = CoolUtil.coolTextFile(Paths.txt('data/creditList'));
		for (person in list) {
			if (FileSystem.exists(Paths.getPath('data/credits/${person.replace(' ', '_')}.json', TEXT))) {
				var icon:FlxSprite = new FlxSprite();
				if (FileSystem.exists(Paths.getPath('images/menus/base/credits/icons/${person.replace(' ', '_')}.png', IMAGE)))
					icon.loadGraphic(Paths.image('menus/base/credits/${person.replace(' ', '_')}'));
				else icon.loadGraphic(Paths.image('menus/base/credits/placeholder'));
				icon.setGraphicSize(Std.int(icon.width * (3 / 5)));
				icon.updateHitbox();
				icon.antialiasing = true;
				iconList.push(icon);
				add(icon);
			
				var rawJson = File.getContent(Paths.getPath('data/credits/${person.replace(' ', '_')}.json', TEXT));
				var credits:Credits = cast Json.parse(rawJson).info;
				credits.name = person;
				personList.push(credits);
			}
        }

        for (i in 0...iconList.length)
			iconList[i].alpha = 0.3;
		iconList[verticalSelection].alpha = 1;

        var point:Int = 200;

        var upPointer:FlxSprite = new FlxSprite();
		upPointer.frames = Paths.getSparrowAtlas('menus/base/storymenu/campaign_menu_UI_assets');
		upPointer.animation.addByPrefix('idle', 'arrow push left', 0, false);
        upPointer.animation.play('idle');
        upPointer.animation.curAnim.curFrame = 1;
        upPointer.angle = 90;
        upPointer.y = 32;
		upPointer.x = point - upPointer.width / 2;

		var downPointer:FlxSprite = new FlxSprite();
		downPointer.frames = Paths.getSparrowAtlas('menus/base/storymenu/campaign_menu_UI_assets');
		downPointer.animation.addByPrefix('idle', 'arrow push left', 0, false);
		downPointer.animation.play('idle');
		downPointer.animation.curAnim.curFrame = 1;
		downPointer.angle = -90;
		downPointer.y = 550;
		downPointer.x = point - downPointer.width / 2;

        add(upPointer);
        add(downPointer);

        CoolUtil.lerpSnap = true;

        nameTxt = new FlxText(0, 0, 0, 'null');
		nameTxt.setFormat(Paths.font('vcr'), 32, 0xFFFFFFFF, ForeverTools.setTextAlign('left'), FlxTextBorderStyle.OUTLINE, 0xFF000000);
        nameTxt.y = 32;
        add(nameTxt);

		profTxt = new FlxText(0, 0, 485 - 32, 'doing absolutely nothing');
		profTxt.setFormat(Paths.font('vcr'), 24, 0xFFFFFFFF, ForeverTools.setTextAlign('left'), FlxTextBorderStyle.OUTLINE, 0xFF000000);
		profTxt.autoSize = false;
		profTxt.alignment = FlxTextAlign.CENTER;
		add(profTxt);

		quoteTxt = new FlxText(0, 0, 485 - 32, 'I\'m gonna fucking kill you');
		quoteTxt.setFormat(Paths.font('vcr'), 16, 0xFFFFFFFF, ForeverTools.setTextAlign('left'), FlxTextBorderStyle.OUTLINE, 0xFF000000);
		quoteTxt.autoSize = false;
		quoteTxt.alignment = FlxTextAlign.CENTER;
		add(quoteTxt);

		descTxt = new FlxText(0, 0, 485 - 32, "idk what else to say other than this person did literally nothing.");
		descTxt.setFormat(Paths.font('vcr'), 20, 0xFFFFFFFF, ForeverTools.setTextAlign('left'), FlxTextBorderStyle.OUTLINE, 0xFF000000);
		descTxt.x = 384 + 16;
		add(descTxt);

        updateText();
    }
    
    override function update(elapsed:Float)
    {
    	if ((Controls.getPressEvent("back")))
        {
            FlxG.sound.play(Paths.sound('base/menus/cancelMenu'));
            Main.switchState(this, new MainMenu());
        }

        var newSelection:Int = verticalSelection;
        var up = Controls.getPressEvent("ui_up");
		var down = Controls.getPressEvent("ui_down");
		var left = Controls.getPressEvent("ui_left");
		var right = Controls.getPressEvent("ui_right");
		// direction up
		var directionVertical:Int = (up ? -2 : 0) + (down ? 2 : 0);
		var directionHorizontal:Int = (left ? -1 : 0) + (right ? 1 : 0);

        if (Math.abs(directionVertical) > 0)
            {
                if (moverCooldown <= 0)
                {
                    newSelection += directionVertical;
                    var even:Int = ((newSelection % 2) == 0 ? 1 : 0);
    
                    if (newSelection < 0)
                        newSelection = (iconList.length - 1) - even;
                    if (newSelection > iconList.length - 1)
                        newSelection = newSelection % 2;
                    
                    moverCooldown += FlxG.updateFramerate / 4;
                }
                else
                    moverCooldown--;
            }
            else if (Math.abs(directionHorizontal) > 0)
            {
                if (moverCooldown <= 0)
                {
                    newSelection += directionHorizontal;
    
                    if (newSelection < 0)
                        newSelection = iconList.length - 1;
                    if (newSelection > iconList.length - 1)
                        newSelection = 0;
                    
                    moverCooldown += FlxG.updateFramerate / 4;
                }
                else
                    moverCooldown--;
            }
            else
                moverCooldown = 0;
            updateVerticalSelection(newSelection, iconList.length - 1);

            var step:Int = 0;
            var j:Int = 0;
            //
            var constant:Float = 150;
            constant *= (11 / 12);
            var fakeElapsed:Float = CoolUtil.clamp(elapsed, 0, 1);
            for (i in 0...iconList.length) {
                var iconX = (125 + (step * constant) - (iconList[i].width / 2));
                var iconY = (125 + (constant * (j - Math.floor(verticalSelection / 2) + 0.5)) - (iconList[i].height / 2) + ((constant / 2) * step));
                iconList[i].x = iconX;
                iconList[i].y = CoolUtil.fakeLerp(iconList[i].y, iconY, fakeElapsed / (1 / 15));
                step++;
                if (step > 1)
                {
                    step = 0;
                    j++;
                }
            }
            CoolUtil.lerpSnap = false;
    }

    function updateVerticalSelection(newSelection:Int, limiter:Int = 1)
    {
        if (verticalSelection != newSelection)
        {
            verticalSelection = newSelection;
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.5);

            for (i in 0...iconList.length)
                iconList[i].alpha = 0.3;
            iconList[verticalSelection].alpha = 1;

            updateText();
        }

    }
    
    function updateText() {
        nameTxt.text = personList[verticalSelection].name;
        nameTxt.x = 384 + ((485 / 2) - (nameTxt.width / 2));
        profTxt.text = personList[verticalSelection].profession;
        profTxt.x = 384 + ((485 / 2) - (profTxt.width / 2));
        profTxt.y = nameTxt.y + nameTxt.height;

        quoteTxt.text = "\"" + personList[verticalSelection].quote + "\"";
        quoteTxt.x = 384 + ((485 / 2) - (quoteTxt.width / 2));
        quoteTxt.y = profTxt.y + profTxt.height + 8;

        descTxt.text = "\"" + personList[verticalSelection].description + "\"";
        descTxt.y = quoteTxt.y + quoteTxt.height + 16;
    }
}











