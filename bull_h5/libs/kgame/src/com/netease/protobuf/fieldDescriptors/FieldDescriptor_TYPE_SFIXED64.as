﻿package com.netease.protobuf.fieldDescriptors
{
    import com.netease.protobuf.*;
    import flash.utils.*;

    final public class FieldDescriptor_TYPE_SFIXED64 extends FieldDescriptor
    {

        public function FieldDescriptor_TYPE_SFIXED64(param1:String, param2:String, param3:uint)
        {
            this.fullName = param1;
            this._name = param2;
            this.tag = param3;
            return;
        }// end function

        override public function get type() : Class
        {
            return Int64;
        }// end function

        override public function readSingleField(param1:IDataInput)
        {
            return ReadUtils.read_TYPE_SFIXED64(param1);
        }// end function

        override public function writeSingleField(param1:WritingBuffer, param2) : void
        {
            WriteUtils.write_TYPE_SFIXED64(param1, param2);
            return;
        }// end function

    }
}
