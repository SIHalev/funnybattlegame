package sourceCode.classes.dr.customClasses
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	import sourceCode.classes.dr.customClasses.States;
	import sourceCode.classes.dr.customClasses.GameMenu;
	import sourceCode.classes.dr.game.Game;
	//import sourceCode.classes.dr.customClasses.myButtonEvent;
		
	public class StateMachine extends MovieClip {
		public static const NULL:int = 999;
		public var stateFunction:Function;
		public var currentSystemState:int;
		public var nextSystemState:int;
		public var lastSystemState:int;
		public var appBackBitmapData:BitmapData;
		public var appBackBitmap:Bitmap;;
		public var frameRate:int;
		public var timerPeriod:Number;
		public var gameTimer:Timer;
		public var counter:int = 0;
		
		public var gameInstructionsImg:Bitmap = new Bitmap(new gameInstructions640x480(0,0));
		public var gameOptionsImg:Bitmap = new Bitmap(new gameOptions640x480(0,0));
		public var gameOverImg:Bitmap = new Bitmap(new gameOver640x480(0,0));
		public var gameWonImg:Bitmap = new Bitmap(new gameWon640x480(0,0));
		public var gameCreditsImg:Bitmap = new Bitmap(new gameCredits640x480(0,0));
		//
		public var game:Game; // game class
		public var menu:GameMenu; //menu class
		
		public function StateMachine()
		{
			
			// I had try make stateMachine like that, but it's not a state machine it's only listeners,
			// that's why i will leav the constructor empty.
			/*//addEventListener /lookEvent / executeEvent /  useCapture / priority / useWeakRefference - Garbage Colector
			game.addEventListener(SwitchState.NewGame, newGameListener, false, 0, false); 
			game.addEventListener(SwitchState.GameOver, gameOverListener, false, 0, false);
			game.addEventListener(SwitchState.GamePlay, gamePlayListener, false, 0, false);
			game.addEventListener(SwitchState.GamePaused, gamePausedListener, false, 0, false);
			game.addEventListener(SwitchState.GameMenu, gameMenuListener, false, 0, false);
			game.addEventListener(SwitchState.GameInstructions, gameInstructions, false, 0, false);
			game.addEventListener(SwitchState.SaveGame, saveGame, false, 0, false);
			game.addEventListener(SwitchState.LoadGame, loadGame, false, 0, false);
			game.addEventListener(SwitchState.GameOptions, gameOptions, false, 0, false);
			//Menu have ref to  instruction,save,load,options
			//Level in
			//Wait
		*/
		}
		
		public function init():void
		{
			//override by Main
		}
		
		public function startTimer():void
		{
			timerPeriod = 1000 / frameRate;
			gameTimer = new Timer(timerPeriod);
			gameTimer.addEventListener(TimerEvent.TIMER, runGame);
			gameTimer.start();
		}
		public function runGame(e:TimerEvent):void
		{
			//Main sets the first state
			stateFunction();
			e.updateAfterEvent();
		}
		//states ....
		public function switchState(stateval:int):void
		{
			lastSystemState = currentSystemState;
			currentSystemState = stateval;
			nextSystemState = NULL ;
			switch (stateval)
			{
				case States.GameOver_ :
					stateFunction = gameOver;
					break;
				case States.GameWon_:
					stateFunction = gameWon;
					break;
				case States.NewGame_ :
					stateFunction = newGame;
					break;
				case States.GamePlay_ :
					stateFunction = gamePlay;
					break;
				case States.GameMenu_ :
					stateFunction = gameMenu;
					break;
				case States.GameInstructions_ :
					stateFunction = gameInstructions;
					break;
				case States.GameOptions_ :
					stateFunction = gameOptions;
					break;
				case States.GameCredits_ :
					stateFunction = gameCredits;
					break;
				case States.GameWait_ :
					stateFunction = gameWait;
					break;		
				
					/*case States.SaveGame_ :
					stateFunction = saveGame;
					break;
					
					case States.LoadGame_ :
					stateFunction = loadGame;
					break;
					
					case States.GamePaused_ :
					//stateFunction = gamePaused ;
					break;
					
					case States.GameLevelIn_ :
					stateFunction = gameLevelIn;
					break;*/
			}
		}
		/*public function mouseClickListener(e:MouseEvent):void
		{
			if(nextSystemState != NULL)
			{
				trace("click");
				switchState(nextSystemState);
			}
		}*/
		public function gameOver():void
		{
			Mouse.show();
			nextSystemState = States.GameMenu_;
			//trace(counter);
			//addEventListener(MouseEvent.CLICK,exitGameOver);
			 // i must remove this listener
			 counter++;
			 gameOverImg.alpha = (100-counter)/100;
			 if(counter>=100)
			 {
				 
				if(this.contains(gameOverImg))
				{
					   removeChild(gameOverImg);
				}
				if(nextSystemState != NULL)
				{
					switchState(nextSystemState);
				}
				counter = 0;
			 }
			
		}
		public function gameWon():void
		{
			Mouse.show();
			nextSystemState = States.GameMenu_;
			//trace(counter);
			//addEventListener(MouseEvent.CLICK,exitGameOver);
			 // i must remove this listener
			 counter++;
			 gameWonImg.alpha = (200-counter)/100;
			 if(counter>=200)
			 {
				if(this.contains(gameWonImg))
				{
					removeChild(gameWonImg);
				}
				if(nextSystemState != NULL)
				{
					switchState(nextSystemState);
				}
				counter = 0;
			 }
		}
		
		public function newGame():void
		{
			game = new Game();
			menu.removeEventListener(myButtonEvent.ID_Listener, buttonClick);
			removeChild(menu);
			//game.newGame();
			
			addChild(game);
			
			//game = new Game();
			game.newGame();
			game.addEventListener(Game.GameOver, gameOverListener, false, 0, true);  
			game.addEventListener(Game.ExitGame, exitGameListener, false, 0, true);
			game.addEventListener(Game.GameWon, gameWonListener, false, 0, true);
			// save game lis
			//game.addEventListener(Game.GamePaused, gamePausedListener, false, 0, true);
			//game.addEventListener(Game.MuteSound, muteSoundListener, false, 0, true);
			switchState(States.GamePlay_);
		}
		public function gameLevelIn():void
		{
			//addChild(gameLevelIn);
		}
		public function gamePlay():void
		{
			game.runGame();
		}
		/*public function gamePaused():void
		{
			// do something
		}*/
		
		
		public function gameInstructions():void
		{
			
			//removeChild(menu);
			
			addChild(gameInstructionsImg);
			nextSystemState = States.GameMenu_;
			menu.removeEventListener(myButtonEvent.ID_Listener, buttonClick);
			addEventListener(MouseEvent.CLICK,exitInstructions);
			
			// remove the img and the listener
		}
		public function exitInstructions(e:MouseEvent):void
		{
			
			removeEventListener(MouseEvent.CLICK,exitInstructions);
			if(this.contains(gameInstructionsImg))
			{
				removeChild(gameInstructionsImg);
			}
			if(nextSystemState != NULL)
			{
				switchState(nextSystemState);
			}
		}
		// i can do that with prev state
		public function gameCredits():void
		{
			addChild(gameCreditsImg);
			nextSystemState = States.GameMenu_;
			menu.removeEventListener(myButtonEvent.ID_Listener, buttonClick);
			addEventListener(MouseEvent.CLICK,exitCreditsListener);
		}
		public function exitCreditsListener(e:MouseEvent):void
		{
			removeEventListener(MouseEvent.CLICK,gameCredits);
			if(this.contains(gameCreditsImg))
			{
				removeChild(gameCreditsImg);
			}
			if(nextSystemState != NULL)
			{
				switchState(nextSystemState);
			}
			
		}
		public function gameOptions():void
		{
			addChild(gameOptionsImg);
			nextSystemState = States.GameMenu_;
			menu.removeEventListener(myButtonEvent.ID_Listener, buttonClick);
			addEventListener(MouseEvent.CLICK,exitOptionsListener);
		}
		public function exitOptionsListener(e:MouseEvent):void
		{
			removeEventListener(MouseEvent.CLICK,gameOptions);
			if(this.contains(gameOptionsImg))
			{
				removeChild(gameOptionsImg);
			}
			if(nextSystemState != NULL)
			{
				switchState(nextSystemState);
			}
			
		}
		public function saveGame():void
		{
			// do something
		}
		public function loadGame():void
		{
			removeChild(menu);
			//addChild(loadedGame);
		}
		public function gameWait():void
		{
			// do something
		}
		// Custom Listeners //half of them are useless
		public function  newGameListener():void
		{
			//removeChild(menu);
			switchState(States.NewGame_);
		}
		/*public function  loadGameListener():void
		{
			removeChild(menu);
			switchState(States.LoadGame_);
		}*/
		public function  gameOverListener(e:Event):void
		{
			if(this.contains(game))
			{
				removeChild(game);
			}
			addChild(gameOverImg);
			switchState(States.GameOver_);
		}
		public function gameWonListener(e:Event):void
		{
			if(this.contains(game))
			{
				removeChild(game);
			}
			addChild(gameWonImg);
			switchState(States.GameWon_);
		}
		public function  exitGameListener():void
		{
			if(this.contains(game))
			{
				removeChild(game);
			}
			switchState(States.GameMenu_); /////////////////////////////////////////////////////new
		}
		/*public function  gamePausedListener():void
		{
			switchState(States.GamePaused_);
		}*/
		/*public function  muteSoundListener():void
		{
			// mute sounds
		}*/
		/*public function  gameOptionsListener():void
		{
			
		}
		public function  gameInstructionsListener():void
		{
			
		}*/
		//
		public function gameMenu():void
		{
			//menu = new GameMenu();
			addChild(menu);
			//Old Code
			//menu.addEventListener(GameMenu.NewGame, newGameListener, false, 0, true);
			//menu.addEventListener(GameMenu.LoadGame, loadGameListener, false, 0,true);
			//menu.addEventListener(GameMenu.GameInstructions, gameInstructionsListener, false, 0, true);
			//menu.addEventListener(GameMenu.GameOptions, gameOptionsListener, false, 0, true);
			//
			//addEventListener(myButtonEvent.ID_Listener, buttonClick); // doest matter if it is attached to menu.
			menu.addEventListener(myButtonEvent.ID_Listener, buttonClick);
		}
		
		public function buttonClick(e:myButtonEvent):void
		{
			switch (e.ID)
			{
				case 1 :
					switchState(States.NewGame_);
				break;
				case 2 :
					switchState(States.GameCredits_);
					break;
				case 3 :
					switchState(States.GameOptions_);
					break;
				case 4 :
					switchState(States.GameInstructions_);
				break;
				case 5 :
					switchState(lastSystemState);
				break;
			}
		}
		
		
	}
}