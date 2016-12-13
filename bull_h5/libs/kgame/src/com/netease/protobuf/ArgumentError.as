package com.netease.protobuf
{
	public class ArgumentError extends Error
	{
		public function ArgumentError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}