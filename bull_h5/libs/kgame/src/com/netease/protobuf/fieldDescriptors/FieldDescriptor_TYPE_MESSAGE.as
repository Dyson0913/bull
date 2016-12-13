package com.netease.protobuf.fieldDescriptors
{
    import com.netease.protobuf.*;
    import flash.utils.*;

    final public class FieldDescriptor_TYPE_MESSAGE extends FieldDescriptor
    {
        public var messageUnion:Object;

        public function FieldDescriptor_TYPE_MESSAGE(param1:String, param2:String, param3:uint, param4:Object)
        {
            this.fullName = param1;
            this._name = param2;
            this.tag = param3;
            this.messageUnion = param4;
            return;
        }// end function

        override public function get type() : Class
        {
            if (!(this.messageUnion as Class))
            {
                var _loc_1:* = this.messageUnion();
                this.messageUnion = this.messageUnion();
            }
            return Class(_loc_1);
        }// end function

        override public function readSingleField(param1:IDataInput)
        {
            return ReadUtils.read_TYPE_MESSAGE(param1, new this.type());
        }// end function

        override public function writeSingleField(param1:WritingBuffer, param2) : void
        {
            WriteUtils.write_TYPE_MESSAGE(param1, param2);
            return;
        }// end function

    }
}
