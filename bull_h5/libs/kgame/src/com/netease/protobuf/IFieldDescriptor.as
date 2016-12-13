package com.netease.protobuf
{

    public interface IFieldDescriptor
    {

        //public function IFieldDescriptor();

        function get type() : Class;

        function get name() : String;

        function get tagNumber() : uint;

    }
}
