package sourceCode.classes.dr.customClasses
{

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormatAlign;
	import flash.display.Sprite;

	import flash.net.URLRequest;
	import flash.display.Loader;
	import sourceCode.classes.dr.customClasses.ButtonFactory;

	public class GameMenu extends Sprite
	{
		public static const MenuButtonClick:String = "click"

		public function GameMenu()
		{
			//var getBackGround:URLRequest;
			//var backGround:Loader = new Loader();
			//getBackGround = new URLRequest("assets/gameMenuBackground640x480.jpg");
			//backGround.load(getBackGround);
			var backGround:Bitmap = new Bitmap(new gameMenuBackground640x480(0,0))
			addChild(backGround);

			var newGameButton:ButtonFactory = new ButtonFactory();
			newGameButton.createButton(1,270,320,"newGameText1");

			var loadGameButton:ButtonFactory = new ButtonFactory();
			loadGameButton.createButton(2,270,355,"creditsText1");

			//var OptionButton:ButtonFactory = new ButtonFactory();
			//OptionButton.createButton(3,270,360,"optionText1");

			var InstructionButton:ButtonFactory = new ButtonFactory();
			InstructionButton.createButton(4,270,390,"instructionText1");

			addChild(newGameButton);
			addChild(loadGameButton);
			//addChild(OptionButton);
			addChild(InstructionButton);

		}
	}
}