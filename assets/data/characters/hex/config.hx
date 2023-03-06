function loadAnimations()
{
	addByPrefix('idle', 'Dad idle dance', 24);
	addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
	addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
	addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
	addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

	addOffset("idle", 0, 0);
	addOffset("singRIGHT", -39, 27);
	addOffset("singDOWN", -47, -40);
	addOffset("singUP", 29, 42);
	addOffset("singLEFT", 40, 7);

	playAnim('idle');
	set('antialiasing', true);
	setBarColor([10, 240, 252]);
	setOffsets(0, 0);
}
