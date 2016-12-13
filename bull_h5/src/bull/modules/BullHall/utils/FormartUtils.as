package BullHall.utils
{
	public class FormartUtils
	{
		public function FormartUtils()
		{
		}
		
		public static function threeCount(num:Number):String{
			
			var temp:Array = String(num).split(".");
			var small:String = temp[1];
			var numstr:String = temp[0];
			var numarr:Array = numstr.split("");
			var tempArr:Array = [];
			numstr = "";
			for (var i:int = 0; i < numarr.length; i++) 
			{
				if(i != 0 && i%3 == 0) tempArr.push(",");
				tempArr.push(numarr[numarr.length - 1 - i]);
			}
			for (var j:int = tempArr.length -1; j >= 0; j--) 
			{
				numstr += tempArr[j];
			}
			if(small) numstr = numstr+"."+small;
			return numstr;
		}
		
		public static function highAeroFill(num:int,cunt:int):String{
			var numstr:String = String(num);
			var l:int = cunt - numstr.length;
			if(l<0) return numstr;
			for(var i:int = 0; i<l; i++){
				numstr = "0"+numstr;
			}
			return numstr;
		}
		
		public static function pointNumber2(num:Number,fix:int = 2):String{
			var str:String = String(num);
			var totle:int = str.length;
			var index:int = str.indexOf(".");
			
			if(index < 0){
				str += ".";
				for(var i:int = 0; i<fix; i++){
					str += "0";
				}
				return str;
			}
			
			index = totle - index;
			if(index > fix+1){
				//舍去多余的
				str = str.substr(0,(str.length - (index - fix -1)));
				return str;
			}else if(index == fix+1){
				return str;
			}else{
				//补零
				var l:int = fix + 1 - index;
				for(var j:int = 0; j<l; j++){
					str += "0";
				}
				return str;
			}
			return ""
		}
	}
}