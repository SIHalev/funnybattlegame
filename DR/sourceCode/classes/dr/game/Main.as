package sourceCode.classes.dr.game
{
	import flash.geom.Point;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import sourceCode.classes.dr.customClasses.StateMachine;
	import sourceCode.classes.dr.customClasses.States;
	import sourceCode.classes.dr.customClasses.GameMenu;
	import sourceCode.classes.dr.game.Game;
	
	// Must import needed classes even if the parent have them (doh)
	public class Main extends StateMachine
	{
		public function Main()
		{
			init();
		}
		override public function init():void
		{
			menu = new GameMenu();
			frameRate = 30;
			switchState(States.GameMenu_);
			startTimer();
		}
	}
}