package sourceCode.classes.dr.game
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	public class Story extends Sprite
	{
		public var firstStory:Bitmap;
		public var secondStory:Bitmap;
		//public var prevStory:int = 0;
		public var currStory:int = 0;
		public var nextStory:int = 0;
		public var stories:Array = [];
		public var finished:Boolean = false;

		public function Story()
		{
			firstStory = new Bitmap(new firstStoryImg);
			firstStory.x = 75;
			firstStory.y = 75;
			secondStory = new Bitmap(new secondStoryImg);
			secondStory.x = 75;
			secondStory.y = 75;
			stories.push(firstStory);
			stories.push(secondStory);
		}
		public function moveToNextStory():void
		{
			if (this.contains(stories[currStory]))
			{
				removeChild(stories[currStory]);
				if(currStory == stories.length)
				{
					finished = true;
				}
			}

			if (nextStory < stories.length)
			{
				addChild(stories[nextStory]);
				//getStory(nextStory);
				currStory = nextStory;
				nextStory++;
			}
		}
		/*
		public function getStory(num:int):void
		{
		addChild(stories[num]);
		}*/


	}
}