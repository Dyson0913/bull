package com.netease.protobuf
{
    import flash.errors.*;
    import flash.utils.*;

    public class RepeatedFieldDescriptor extends BaseFieldDescriptor
    {

        public function RepeatedFieldDescriptor()
        {
            return;
        }// end function

        public function get elementType() : Class
        {
            throw new Error("Not Implemented!");
        }// end function

        final public function readNonPacked(param1:IDataInput, param2:Message) : void
        {
            if (!param2[name])
            {
                var _loc_4:* = [];
                param2[name] = [];
            }
            var _loc_3:* = _loc_4;
            _loc_3.push(readSingleField(param1));
            return;
        }// end function

        final public function readPacked(param1:IDataInput, param2:Message) : void
        {
            if (!param2[name])
            {
                var _loc_6:* = [];
                param2[name] = [];
            }
            var _loc_3:* = _loc_6;
            var _loc_4:* = ReadUtils.read_TYPE_UINT32(param1);
            if (param1.bytesAvailable < _loc_4)
            {
                throw new IOError("Invalid message length: " + _loc_4);
            }
            var _loc_5:* = param1.bytesAvailable - _loc_4;
            while (param1.bytesAvailable > _loc_5)
            {
                
                _loc_3.push(readSingleField(param1));
            }
            if (param1.bytesAvailable != _loc_5)
            {
                throw new IOError("Invalid packed destination data");
            }
            return;
        }// end function

        public function get nonPackedWireType() : int
        {
            throw new Error("Not Implemented!");
        }// end function

        final override public function write(param1:WritingBuffer, param2:Message) : void
        {
            var _loc_4:uint = 0;
            var _loc_5:uint = 0;
            var _loc_6:uint = 0;
            var _loc_3:* = param2[name];
            if ((tag & 7) == this.nonPackedWireType)
            {
                _loc_4 = 0;
                while (_loc_4 < _loc_3.length)
                {
                    
                    WriteUtils.write_TYPE_UINT32(param1, tag);
                    writeSingleField(param1, _loc_3[_loc_4]);
                    _loc_4 = _loc_4 + 1;
                }
            }
            else
            {
                WriteUtils.write_TYPE_UINT32(param1, tag);
                _loc_5 = param1.beginBlock();
                _loc_6 = 0;
                while (_loc_6 < _loc_3.length)
                {
                    
                    writeSingleField(param1, _loc_3[_loc_6]);
                    _loc_6 = _loc_6 + 1;
                }
                param1.endBlock(_loc_5);
            }
            return;
        }// end function

    }
}
