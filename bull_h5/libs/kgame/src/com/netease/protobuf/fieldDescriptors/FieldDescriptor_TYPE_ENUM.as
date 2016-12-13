package com.netease.protobuf.fieldDescriptors
{
    import com.netease.protobuf.*;
    import flash.utils.*;

    final public class FieldDescriptor_TYPE_ENUM extends FieldDescriptor
    {
        public var enumType:Class;

        public function FieldDescriptor_TYPE_ENUM(param1:String, param2:String, param3:uint, param4:Class)
        {
            this.fullName = param1;
            this._name = param2;
            this.tag = param3;
            this.enumType = param4;
            return;
        }// end function

        override public function get type() : Class
        {
            return int;
        }// end function

        override public function readSingleField(param1:IDataInput)
        {
            return ReadUtils.read_TYPE_ENUM(param1);
        }// end function

        override public function writeSingleField(param1:WritingBuffer, param2) : void
        {
            WriteUtils.write_TYPE_ENUM(param1, param2);
            return;
        }// end function

    }
}
