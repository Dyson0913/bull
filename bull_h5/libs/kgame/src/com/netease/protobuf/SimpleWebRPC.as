package com.netease.protobuf
{
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;

    final public class SimpleWebRPC extends Object
    {
        private var urlPrefix:String;
        private static const REF:Dictionary = new Dictionary();

        public function SimpleWebRPC(param1:String)
        {
            this.urlPrefix = param1;
            return;
        }// end function

        public function send(param1:String, param2:Message, param3:Function, param4:Class) : void
        {
            var loader:URLLoader;
            var qualifiedMethodName:* = param1;
            var requestMessage:* = param2;
            var rpcResult:* = param3;
            var responseClass:* = param4;
            var errorEventHandler:* = function (event:Event) : void
            {
                delete REF[loader];
                rpcResult(event);
                return;
            }// end function
            ;
            loader = new URLLoader();
            REF[loader] = true;
            loader.dataFormat = URLLoaderDataFormat.BINARY;
            loader.addEventListener(Event.COMPLETE, function (event:Event) : void
            {
                delete REF[loader];
                var _loc_2:* = new responseClass();
                _loc_2.mergeFrom(loader.data);
                rpcResult(_loc_2);
                return;
            }// end function
            );
            loader.addEventListener(IOErrorEvent.IO_ERROR, errorEventHandler);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorEventHandler);
            var request:* = new URLRequest(this.urlPrefix + qualifiedMethodName.replace(/\.""\./g, "/").replace(/^((com|org|net)\/\w+\/\w+\/)?(.*)$""^((com|org|net)\/\w+\/\w+\/)?(.*)$/, "$3"));
            var requestContent:* = new ByteArray();
            requestMessage.writeTo(requestContent);
            if (requestContent.length != 0)
            {
                request.data = requestContent;
            }
            request.contentType = "application/x-protobuf";
            request.method = URLRequestMethod.POST;
            loader.load(request);
            return;
        }// end function

    }
}
