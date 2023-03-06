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

typedef Credits = {
    // Credit
    var name:String;
    var quote:String;
    var profession:String;
    var description:String;
    
    // Social Links (WIP)
    var ytLink:String;
    var twitterLink:String;
    var gbLink:String;
    var gjLink:String;
    var gitLink:String;
    var scLink:String;
}

class CreditsMenu extends MusicBeatState
{
    public var hasLink:Array<Bool> = [false, false, false, false, false, false];
    
    public var verticalSelection:Int = 0;

    public var nameTxt:FlxText;
	public var quoteTxt:FlxText;
    public var profTxt:FlxText;
    public var descTxt:FlxText;
    
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
    
    public static var hardcodedCreditList:Array<Credits> = [
        {
            name: "DEMOLITIONDON96",
            quote: "Wait, this isn't Funkin.avi...",
            profession: "Programmer/Charter",
            description: "Charted the remix & programmed the visuals.",
            ytLink: "",
            twitterLink: "",
            gbLink: "",
            gjLink: "",
            gitLink: "",
            scLink: null
        },
        {
            name: "Choma41",
            quote: "",
            profession: "Musician",
            description: "Made the dope ass remix used in this mod.",
            ytLink: "",
            twitterLink: "",
            gbLink: null,
            gjLink: null,
            gitLink: null,
            scLink: ""
        },
        {
            name: "YingYang48",
            quote: "",
            profession: "Musician/Owner of Hex",
            description: "They created the original song + mod itself, HEX SUPREMACY!",
            ytLink: "",
            twitterLink: "",
            gbLink: "",
            gjLink: "",
            gitLink: null,
            scLink: ""
        },
        {
            name: "BeastlyGhost",
            quote: "",
            profession: "Programmer",
            description: "Created the engine used for this mod.",
            ytLink: "",
            twitterLink: "",
            gbLink: "",
            gjLink: "",
            gitLink: "",
            scLink: null
        }
    
    ];
    
    public var iconList:Array<FlxSprite> = [];
	public var personList:Array<Credits> = [];
    var bg:FlxSprite;
    
    // work in progress
}











