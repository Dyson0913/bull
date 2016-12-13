package com.netease.protobuf
{
	public class IOError extends Error
	{
		public function IOError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}