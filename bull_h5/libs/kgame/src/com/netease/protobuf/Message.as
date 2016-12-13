package com.netease.protobuf
{
    import flash.errors.*;
    import flash.utils.*;

    public class Message extends Object
    {

        public function Message()
        {
            return;
        }// end function

        final public function mergeFrom(param1:IDataInput) : void
        {
            param1.endian = Endian.LITTLE_ENDIAN;
            this.readFromSlice(param1, 0);
            return;
        }// end function

        final public function mergeDelimitedFrom(param1:IDataInput) : void
        {
            param1.endian = Endian.LITTLE_ENDIAN;
            ReadUtils.read_TYPE_MESSAGE(param1, this);
            return;
        }// end function

        final public function writeTo(param1:IDataOutput) : void
        {
            var _loc_2:* = new WritingBuffer();
            this.writeToBuffer(_loc_2);
            _loc_2.toNormal(param1);
            return;
        }// end function

        final public function writeDelimitedTo(param1:IDataOutput) : void
        {
            var _loc_2:* = new WritingBuffer();
            WriteUtils.write_TYPE_MESSAGE(_loc_2, this);
            _loc_2.toNormal(param1);
            return;
        }// end function

        function readFromSlice(param1:IDataInput, param2:uint) : void
        {
            throw new Error("Not implemented!");
        }// end function

        function writeToBuffer(param1:WritingBuffer) : void
        {
            throw new Error("Not implemented!");
        }// end function

        private function writeSingleUnknown(param1:WritingBuffer, param2:uint, param3) : void
        {
            WriteUtils.write_TYPE_UINT32(param1, param2);
            switch(param2 & 7)
            {
                case WireType.VARINT:
                {
                    WriteUtils.write_TYPE_UINT64(param1, param3);
                    break;
                }
                case WireType.FIXED_64_BIT:
                {
                    WriteUtils.write_TYPE_FIXED64(param1, param3);
                    break;
                }
                case WireType.LENGTH_DELIMITED:
                {
                    WriteUtils.write_TYPE_BYTES(param1, param3);
                    break;
                }
                case WireType.FIXED_32_BIT:
                {
                    WriteUtils.write_TYPE_FIXED32(param1, param3);
                    break;
                }
                default:
                {
                    throw new IOError("Invalid wire type: " + (param2 & 7));
                    break;
                }
            }
            return;
        }// end function

        final protected function writeUnknown(param1:WritingBuffer, param2:String) : void
        {
            var _loc_3:* = uint(param2);
            if (_loc_3 == 0)
            {
                throw new ArgumentError("Attemp to write an undefined string filed: " + param2);
            }
            WriteUtils.writeUnknownPair(param1, _loc_3, this[param2]);
            return;
        }// end function

        final protected function writeExtensionOrUnknown(param1:WritingBuffer, param2:String) : void
        {
            var fieldDescriptor:BaseFieldDescriptor;
            var output:* = param1;
            var fieldName:* = param2;
            if (!this.propertyIsEnumerable(fieldName))
            {
                return;
            }
            try
            {
                fieldDescriptor = BaseFieldDescriptor.getExtensionByName(fieldName);
            }
            catch (e:ReferenceError)
            {
                writeUnknown(output, fieldName);
                return;
            }
            fieldDescriptor.write(output, this);
            return;
        }// end function

        final protected function readUnknown(param1:IDataInput, param2:uint) : void
        {
            var _loc_3:* = undefined;
            switch(param2 & 7)
            {
                case WireType.VARINT:
                {
                    _loc_3 = ReadUtils.read_TYPE_UINT64(param1);
                    break;
                }
                case WireType.FIXED_64_BIT:
                {
                    _loc_3 = ReadUtils.read_TYPE_FIXED64(param1);
                    break;
                }
                case WireType.LENGTH_DELIMITED:
                {
                    _loc_3 = ReadUtils.read_TYPE_BYTES(param1);
                    break;
                }
                case WireType.FIXED_32_BIT:
                {
                    _loc_3 = ReadUtils.read_TYPE_FIXED32(param1);
                    break;
                }
                default:
                {
                    throw new IOError("Invalid wire type: " + (param2 & 7));
                    break;
                }
            }
            var _loc_4:* = this[param2];
            if (!_loc_4)
            {
                this[param2] = _loc_3;
            }
            else if (_loc_4 is Array)
            {
                _loc_4.push(_loc_3);
            }
            else
            {
                this[param2] = [_loc_4, _loc_3];
            }
            return;
        }// end function

        final protected function readExtensionOrUnknown(param1:Array, param2:IDataInput, param3:uint) : void
        {
            var _loc_4:* = param1[param3];
            if (_loc_4 != null)
            {
                this._loc_4(param2, this);
            }
            else
            {
                this.readUnknown(param2, param3);
            }
            return;
        }// end function

        final public function toString() : String
        {
            return TextFormat.printToString(this);
        }// end function

        public static function getExtensionByName(param1:String) : IFieldDescriptor
        {
            return BaseFieldDescriptor.getExtensionByName(param1);
        }// end function

    }
}
