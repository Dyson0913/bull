package com.netease.protobuf.fieldDescriptors
{
    import com.netease.protobuf.*;
    import flash.utils.*;

    final public class FieldDescriptor_TYPE_FLOAT extends FieldDescriptor
    {

        public function FieldDescriptor_TYPE_FLOAT(param1:String, param2:String, param3:uint)
        {
            this.fullName = param1;
            this._name = param2;
            this.tag = param3;
            return;
        }// end function

        override public function get type() : Class
        {
            return Number;
        }// end function

        override public function readSingleField(param1:IDataInput)
        {
            return ReadUtils.read_TYPE_FLOAT(param1);
        }// end function

        override public function writeSingleField(param1:WritingBuffer, param2) : void
        {
            WriteUtils.write_TYPE_FLOAT(param1, param2);
            return;
        }// end function

    }
}
