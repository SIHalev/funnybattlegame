package sourceCode.classes.dr.customClasses
{
	//import sourceCode.classes.dr.game.Main;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormatAlign;
	import flash.events.EventDispatcher;

	import flash.net.URLLoader;// rrrrr ;(
	import flash.net.URLRequest;
	import flash.display.Loader;//  raboti
	import sourceCode.classes.dr.customClasses.GameMenu;
	import  sourceCode.classes.dr.customClasses.myButtonEvent;
	
	
	
	public class TestButton extends Sprite
	{
		private var request1:URLRequest;
		private var request2:URLRequest;
		private var request3:URLRequest;

		private var buttonNG:Loader = new Loader();
		private var textNG:Loader = new Loader();
		private var buttonNGover:Loader = new Loader();
		private var button:Sprite = new Sprite();
		private var wantedText:String = null;
		//
		private var buttonCOver:Bitmap;
		private var buttonC:Bitmap;
		private var buttonText:Bitmap;

		public var ID:int;
		public function TestButton(ID:int,x:Number,y:Number,text:String)
		{
		
		buttonC = new Bitmap(new button100x20(0,0));
		buttonCOver = new Bitmap(new button100x20over(0,0));
		
			this.ID = ID;
			wantedText = "assets/" + text + ".png"; 
			//buttonText = new text.toString(); mmm trqbva napravq nov klas koito da go pravi ... = new randClass() i da vru6ta 
			// bitmap koito da go polzvam getBitmap(string);
			//trace(text);
			//buttonNG;
			//textNG
			//buttonNG.load(new URLRequest("assets/button1.jpeg")); //ne raboti

			//////request1 = new URLRequest("assets/button100x20.png");
			//////buttonNG.load(request1);
			//request2 = new URLRequest("assets/text1.png"); // not dynamic code // but no err;
			request2 = new URLRequest(wantedText);
			textNG.load(request2);
			//request3 = new URLRequest("assets/button100x20over.png");
			//buttonNGover.load(request3);

			button.x = x;
			button.y = y;
			textNG.x = 7;
			textNG.y = 4;
			button.addChild(buttonCOver);
			button.addChild(buttonC);
			
			button.addChild(textNG);

			addChild(button);

		}
		public function onClick()
		{
			
			//dispatchEvent(new myButtonEvent(myButtonEvent.ID_Listener,ID)); // don't work
			//trace(ID);
			dispatchEvent(new myButtonEvent(myButtonEvent.ID_Listener,ID,true));
			// it took me all day to solve the problem ... bubbles must be set to true... don't know why.
			// www.adobe.com -> 404 ...
		}
		public function over()
		{
			//buttonNG.load(request3);
			//button.addChild(buttonNG);
			//trace("over" + this.ID);
			//this.button.removeChild(textNG);
			buttonC.alpha = 0;
			//button.addChild(buttonNGover);
			//this.button.addChild(textNG);
			//this.button.addChild(buttonNGover);

		}
		public function off()
		{
			buttonC.alpha = 1;
		}

	}
}