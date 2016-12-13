package com.netease.protobuf
{
    import flash.utils.*;

    public class FieldDescriptor extends BaseFieldDescriptor
    {

        public function FieldDescriptor()
        {
            return;
        }// end function

        final public function read(param1:IDataInput, param2:Message) : void
        {
            param2[name] = readSingleField(param1);
            return;
        }// end function

        final override public function write(param1:WritingBuffer, param2:Message) : void
        {
            WriteUtils.write_TYPE_UINT32(param1, tag);
            writeSingleField(param1, param2[name]);
            return;
        }// end function

    }
}
