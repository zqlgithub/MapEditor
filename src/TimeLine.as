package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class TimeLine extends Sprite
	{
		private var marks:Vector.<TextField>;
		private var interval:int;
		private var timeInterval:int;
		
		public function TimeLine(markInterval:int, timeInterval:int)
		{
			marks = new Vector.<TextField>;
			this.interval = markInterval;
			this.timeInterval = timeInterval;
			
			var currHeight:int = 0;
			graphics.lineStyle(2);
			graphics.moveTo(0, currHeight);
			while(this.height < 1000)
			{
				var mark:TextField = new TextField();
				mark.defaultTextFormat = new TextFormat(null, 20);
				mark.x = -60;
				mark.y = -currHeight-20;
				
				marks.push(mark);
				addChild(mark);
				
				graphics.lineTo(-5, -currHeight);
				graphics.moveTo(0, -currHeight);
				currHeight+=interval;
				graphics.lineTo(0, -currHeight);
			}
		}
		
		public function resize(h:int):void
		{
			var currHeight:int = 0;
			graphics.lineStyle(2);
			graphics.moveTo(0, currHeight);
			while(this.height < h)
			{
				var mark:TextField = new TextField();
				mark.text = "s";
				mark.defaultTextFormat = new TextFormat(null, 20);
				mark.x = -200;
				mark.y = -currHeight-mark.height;
				marks.push(mark);
				addChild(mark);
				
				graphics.lineTo(-5, -currHeight);
				graphics.moveTo(0, -currHeight);
				currHeight+=interval;
				graphics.lineTo(0, -currHeight);
			}
		}
		
		public function setCurrTime(time:int):void
		{
			var t:int = time;
			
			for each(var m:TextField in marks)
			{
				var min:int = t/60;
				var s:int = t%60;
				m.text = min >0 ? min+"m"+s+"s": s+"s";
				t+=timeInterval;
			}
		}
	}
}