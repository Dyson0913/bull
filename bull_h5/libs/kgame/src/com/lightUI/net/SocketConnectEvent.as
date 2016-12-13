package com.lightUI.net
{
	import com.lightUI.events.LightEvent;

	/**
	 * @author light
	 * 创建时间：2015-9-14 下午12:00:09
	 * 
	 */
	public class SocketConnectEvent extends LightEvent
	{
		public static const OPEN:String = "open";
		public static const LOGIN:String = "login";
		public static const CONNECT:String = "connect";
		public static const RECEIVE:String = "receive";
		public static const CLOSE:String = "close";
		public static const CONNECT_FAIL:String = "connectFail";//////////重连后确认失败
		public static const DROPPED:String = "connection dropped";/////////掉线    包括 心跳停止后  主动关闭连接  以及  服务器关闭连接 触发的 close事件
		public static const CANT_CONN:String = "cantConn";////////////////实在是连不上啊（一定时间内都一直连不上服务器）
		
		public function SocketConnectEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type,data, bubbles, cancelable);
		}
	}
}