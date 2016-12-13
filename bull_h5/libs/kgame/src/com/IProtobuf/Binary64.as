package com.IProtobuf
{

    public class Binary64 extends Object
    {
        public var low:uint;
        protected var internalHigh:uint;
		protected static const CHAR_CODE_0:uint = "0".charCodeAt();
		protected static const CHAR_CODE_9:uint = "9".charCodeAt();
		protected static const CHAR_CODE_A:uint = "a".charCodeAt();
		protected static const CHAR_CODE_Z:uint = "z".charCodeAt();

        public function Binary64(param1:uint = 0, param2:uint = 0)
        {
            this.low = param1;
            this.internalHigh = param2;
            return;
        }// end function

		protected final function div(param1:uint) : uint
        {
            var _loc_2:uint = 0;
            _loc_2 = this.internalHigh % param1;
            var _loc_3:* = (this.low % param1 + _loc_2 * 6) % param1;
            this.internalHigh = this.internalHigh / param1;
            var _loc_4:* = (_loc_2 * 4294967296 + this.low) / param1;
            this.internalHigh = this.internalHigh + uint(_loc_4 / 4294967296);
            this.low = _loc_4;
            return _loc_3;
        }// end function

		protected final function mul(param1:uint) : void
        {
            var _loc_2:* = Number(this.low) * param1;
            this.internalHigh = this.internalHigh * param1;
            this.internalHigh = this.internalHigh + uint(_loc_2 / 4294967296);
            this.low = this.low * param1;
            return;
        }// end function

		protected final function add(param1:uint) : void
        {
            var _loc_2:* = Number(this.low) + param1;
            this.internalHigh = this.internalHigh + uint(_loc_2 / 4294967296);
            this.low = _loc_2;
            return;
        }// end function

		protected final function bitwiseNot() : void
        {
            this.low = ~this.low;
            this.internalHigh = ~this.internalHigh;
            return;
        }// end function

    }
}
