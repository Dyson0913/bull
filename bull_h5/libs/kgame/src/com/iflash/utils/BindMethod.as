package com.iflash.utils
{
	public class BindMethod
	{
		public static function bind(domain:Object,method:Function):Function{
			var re:Function;
			__JS__("re = method.bind(domain)");
			return re;
		}
	}
}