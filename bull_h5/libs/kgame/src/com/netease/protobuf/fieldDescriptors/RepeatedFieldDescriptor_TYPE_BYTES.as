﻿package com.netease.protobuf.fieldDescriptors
{
    import com.netease.protobuf.*;
    import flash.utils.*;

    final public class RepeatedFieldDescriptor_TYPE_BYTES extends RepeatedFieldDescriptor
    {

        public function RepeatedFieldDescriptor_TYPE_BYTES(param1:String, param2:String, param3:uint)
        {
            this.fullName = param1;
            this._name = param2;
            this.tag = param3;
            return;
        }// end function

        override public function get nonPackedWireType() : int
        {
            return WireType.LENGTH_DELIMITED;
        }// end function

        override public function get type() : Class
        {
            return Array;
        }// end function

        override public function get elementType() : Class
        {
            return ByteArray;
        }// end function

        override public function readSingleField(param1:IDataInput)
        {
            return ReadUtils.read_TYPE_BYTES(param1);
        }// end function

        override public function writeSingleField(param1:WritingBuffer, param2) : void
        {
            WriteUtils.write_TYPE_BYTES(param1, param2);
            return;
        }// end function

    }
}
