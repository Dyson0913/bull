package com.netease.protobuf
{
    import flash.utils.*;
    import google.protobuf.*;

    final public class CustomOption extends Object
    {

        public function CustomOption()
        {
            return;
        }// end function

        public static function getMethodOptions(param1:String) : MethodOptions
        {
            var optionsBytes:ByteArray;
            var result:MethodOptions;
            var methodFullName:* = param1;
            var m:* = methodFullName.match(/^(.+)\.[^\.]+$""^(.+)\.[^\.]+$/);
            if (m == null)
            {
                return null;
            }
            var serviceClass:* = Class(getDefinitionByName(m[1]));
            try
            {
                optionsBytes = serviceClass.OPTIONS_BYTES_BY_METHOD_NAME[methodFullName];
            }
            catch (e:ReferenceError)
            {
                return null;
            }
            if (optionsBytes)
            {
                result = new MethodOptions();
                result.mergeFrom(optionsBytes);
                return result;
            }
            return null;
        }// end function

        public static function getServiceOptions(param1:Class) : ServiceOptions
        {
            var optionsBytes:ByteArray;
            var serviceClass:* = param1;
            try
            {
                optionsBytes = serviceClass.OPTIONS_BYTES;
            }
            catch (e:ReferenceError)
            {
                return null;
            }
            var result:* = new ServiceOptions();
            result.mergeFrom(optionsBytes);
            return result;
        }// end function

    }
}
