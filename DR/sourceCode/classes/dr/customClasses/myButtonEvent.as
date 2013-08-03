package sourceCode.classes.dr.customClasses
{
	import flash.events.Event;
	//import flash.events.*
	// http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/Event.html
	// http://webcache.googleusercontent.com/search?q=cache:http://cookbooks.adobe.com/post_AS3__Creating_and_dispatching_Custom_Events-17609.html
	public class myButtonEvent extends Event
	{
		public static const ID_Listener:String = "ID listener";
		public var ID:int;
		
		public function myButtonEvent(type:String, ID:int, bubbles:Boolean=false,cancelable:Boolean=false)
		{
			super(type, bubbles,cancelable);
			// super calls to the constructor of the Event class.
			// http://www.emanueleferonato.com/2009/08/10/understanding-as3-super-statement/
			
			this.ID = ID;
		}
		
		public override function clone():Event 
		{
				return new myButtonEvent(type, ID, bubbles,cancelable);
				// returns the new event.
		}
	}
}