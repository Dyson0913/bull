package com.IProtobuf
{
	import com.IProtobuf;

    final public class Int64 extends Binary64
    {

        public function Int64(param1:uint = 0, param2:int = 0)
        {
            super(param1, param2);
            return;
        }// end function

        final public function set high(param1:int) : void
        {
            internalHigh = param1;
            return;
        }// end function

        final public function get high() : int
        {
            return internalHigh;
        }// end function

        final public function toNumber() : Number
        {
            return this.high * 4294967296 + low;
        }// end function

        final public function toString(param1:uint = 10) : String
        {
            var _loc_4:uint = 0;
            if (param1 >= 2)
            {
            }
            if (param1 > 36)
            {
                throw new com.IProtobuf.ArgumentError();
            }
            switch(this.high)
            {
                case 0:
                {
                    return low.toString(param1);
                }
                case -1:
                {
                    if ((low & 2147483648) == 0)
                    {
                        return (int(low | 2147483648) - 2147483648).toString(param1);
                    }
                    return int(low).toString(param1);
                }
                default:
                {
                    break;
                    break;
                }
            }
            if (low == 0)
            {
            }
            if (this.high == 0)
            {
                return "0";
            }
            var _loc_2:Array = [];
            var _loc_3:* = new UInt64(low, this.high);
            if (this.high < 0)
            {
                _loc_3.bitwiseNot();
                _loc_3.add(1);
            }
            do
            {
                
                _loc_4 = _loc_3.div(param1);
                if (_loc_4 < 10)
                {
                    _loc_2.push(_loc_4 + CHAR_CODE_0);
                    continue;
                }
                _loc_2.push(_loc_4 - 10 + CHAR_CODE_A);
            }while (_loc_3.high != 0)
            if (this.high < 0)
            {
                return "-" + _loc_3.low.toString(param1) + String.fromCharCode.apply(String, _loc_2.reverse());
            }
            return _loc_3.low.toString(param1) + String.fromCharCode.apply(String, _loc_2.reverse());
        }// end function

        public static function fromNumber(param1:Number) : Int64
        {
            return new Int64(param1, Math.floor(param1 / 4294967296));
        }// end function

        public static function parseInt64(param1:String, param2:uint = 0) : Int64
        {
            var _loc_6:uint = 0;
            var _loc_3:* = param1.search(/^\-""^\-/) == 0;
            var _loc_4:* = _loc_3 ? (1) : (0);
            if (param2 == 0)
            {
                if (param1.search(/^\-?0x""^\-?0x/) == 0)
                {
                    param2 = 16;
                    _loc_4 = _loc_4 + 2;
                }
                else
                {
                    param2 = 10;
                }
            }
            if (param2 >= 2)
            {
            }
            if (param2 > 36)
            {
                throw new com.IProtobuf.ArgumentError();
            }
            param1 = param1.toLowerCase();
            var _loc_5:* = new Int64;
            while (_loc_4 < param1.length)
            {
                
                _loc_6 = param1.charCodeAt(_loc_4);
                if (_loc_6 >= CHAR_CODE_0)
                {
                }
                if (_loc_6 <= CHAR_CODE_9)
                {
                    _loc_6 = _loc_6 - CHAR_CODE_0;
                }
                else
                {
                    if (_loc_6 >= CHAR_CODE_A)
                    {
                    }
                    if (_loc_6 <= CHAR_CODE_Z)
                    {
                        _loc_6 = _loc_6 - CHAR_CODE_A;
                        _loc_6 = _loc_6 + 10;
                    }
                    else
                    {
                        throw new com.IProtobuf.ArgumentError();
                    }
                }
                if (_loc_6 >= param2)
                {
                    throw new com.IProtobuf.ArgumentError();
                }
                _loc_5.mul(param2);
                _loc_5.add(_loc_6);
                _loc_4 = _loc_4 + 1;
            }
            if (_loc_3)
            {
                _loc_5.bitwiseNot();
                _loc_5.add(1);
            }
            return _loc_5;
        }// end function

    }
}
