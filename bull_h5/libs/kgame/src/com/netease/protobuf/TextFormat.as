package com.netease.protobuf
{
    import com.netease.protobuf.fieldDescriptors.*;
    import flash.errors.*;
    import flash.utils.*;

    final public class TextFormat extends Object
    {
        private static const allEnumValues:Dictionary = new Dictionary();
        private static const allMessageFields:Dictionary = new Dictionary();

        public function TextFormat()
        {
            return;
        }// end function

        private static function printHex(param1:IDataOutput, param2:uint) : void
        {
            var _loc_3:* = param2.toString(16);
            param1.writeUTFBytes("00000000".substring(0, 8 - _loc_3.length));
            param1.writeUTFBytes(_loc_3);
            return;
        }// end function

        private static function printEnum(param1:IDataOutput, param2:int, param3:Class) : void
        {
            var _loc_4:Array = null;
            var _loc_5:XML = null;
            var _loc_6:XMLList = null;
            var _loc_7:String = null;
            if (param3 in allEnumValues)
            {
                _loc_4 = allEnumValues[param3];
            }
            else
            {
                _loc_5 = describeType(param3);
                _loc_6 = _loc_5.*.@name;
                _loc_4 = [];
                for each (_loc_7 in _loc_6)
                {
                    
                    _loc_4[param3[_loc_7]] = _loc_7;
                }
                allEnumValues[param3] = _loc_4;
            }
            if (param2 in _loc_4)
            {
                param1.writeUTFBytes(_loc_4[param2]);
            }
            else
            {
                throw new IOError(param2 + " is invalid for " + _loc_5.@name);
            }
            return;
        }// end function

        private static function printBytes(param1:IDataOutput, param2:ByteArray) : void
        {
            var _loc_3:int = 0;
            param1.writeUTFBytes("\"");
            param2.position = 0;
            while (param2.bytesAvailable > 0)
            {
                
                _loc_3 = param2.readByte();
                switch(_loc_3)
                {
                    case 7:
                    {
                        param1.writeUTFBytes("\\a");
                        break;
                    }
                    case 8:
                    {
                        param1.writeUTFBytes("\\b");
                        break;
                    }
                    case 12:
                    {
                        param1.writeUTFBytes("\\f");
                        break;
                    }
                    case 10:
                    {
                        param1.writeUTFBytes("\\n");
                        break;
                    }
                    case 13:
                    {
                        param1.writeUTFBytes("\\r");
                        break;
                    }
                    case 9:
                    {
                        param1.writeUTFBytes("\\t");
                        break;
                    }
                    case 11:
                    {
                        param1.writeUTFBytes("\\v");
                        break;
                    }
                    case 92:
                    {
                        param1.writeUTFBytes("\\\\");
                        break;
                    }
                    case 39:
                    {
                        param1.writeUTFBytes("\\\'");
                        break;
                    }
                    case 34:
                    {
                        param1.writeUTFBytes("\\\"");
                        break;
                    }
                    default:
                    {
                        if (_loc_3 >= 32)
                        {
                            param1.writeByte(_loc_3);
                        }
                        else
                        {
                            param1.writeUTFBytes("\\");
                            param1.writeByte("0".charCodeAt() + (_loc_3 >>> 6 & 3));
                            param1.writeByte("0".charCodeAt() + (_loc_3 >>> 3 & 7));
                            param1.writeByte("0".charCodeAt() + (_loc_3 & 7));
                        }
                        break;
                        break;
                    }
                }
            }
            param1.writeUTFBytes("\"");
            return;
        }// end function

        private static function printString(param1:IDataOutput, param2:String) : void
        {
            var _loc_3:* = new ByteArray();
            _loc_3.writeUTFBytes(param2);
            printBytes(param1, _loc_3);
            return;
        }// end function

        private static function printUnknownField(param1:IDataOutput, param2:uint, param3:Object, param4:PrintSetting, param5:String) : void
        {
            var _loc_7:int = 0;
            var _loc_6:* = param3 as Array;
            if (_loc_6)
            {
                if (_loc_6.length > 0)
                {
                    printSingleUnknownField(param1, param2, _loc_6[_loc_7], param4, param5);
                    _loc_7 = 1;
                    while (_loc_7 < _loc_6.length)
                    {
                        
                        param1.writeByte(param4.newLine);
                        printSingleUnknownField(param1, param2, _loc_6[_loc_7], param4, param5);
                        _loc_7 = _loc_7 + 1;
                    }
                }
            }
            else
            {
                printSingleUnknownField(param1, param2, param3, param4, param5);
            }
            return;
        }// end function

        private static function printSingleUnknownField(param1:IDataOutput, param2:uint, param3:Object, param4:PrintSetting, param5:String) : void
        {
            var _loc_6:UInt64 = null;
            param1.writeUTFBytes(param5);
            param1.writeUTFBytes(String(param2 >>> 3));
            param1.writeUTFBytes(param4.simpleFieldSeperator);
            switch(param2 & 7)
            {
                case WireType.VARINT:
                {
                    param1.writeUTFBytes(UInt64(param3).toString());
                    break;
                }
                case WireType.FIXED_32_BIT:
                {
                    param1.writeUTFBytes("0x");
                    printHex(param1, uint(param3));
                    break;
                }
                case WireType.FIXED_64_BIT:
                {
                    _loc_6 = UInt64(param3);
                    param1.writeUTFBytes("0x");
                    printHex(param1, _loc_6.high);
                    printHex(param1, _loc_6.low);
                    break;
                }
                case WireType.LENGTH_DELIMITED:
                {
                    printBytes(param1, ByteArray(param3));
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private static function printMessageFields(param1:IDataOutput, param2:Message, param3:PrintSetting, param4:String = "") : void
        {
            var isFirst:Boolean;
            var messageFields:XMLList;
            var fieldDescriptorName:String;
            var key:String;
            var description:XML;
            var fieldDescriptor:BaseFieldDescriptor;
            var shortName:String;
            var fieldValues:Array;
            var i:int;
            var m:Array;
            var hasField:String;
            var extension:BaseFieldDescriptor;
            var extensionFieldValues:Array;
            var j:int;
            var output:* = param1;
            var message:* = param2;
            var printSetting:* = param3;
            var currentIndent:* = param4;
            isFirst;
            var type:* = Object(message).constructor;
            if (type in allMessageFields)
            {
                messageFields = allMessageFields[type];
            }
            else
            {
                description = describeType(type);
                var _loc_7:int = 0;
                var _loc_8:* = description.*;
                var _loc_6:* = new XMLList("");
                for each (_loc_9 in _loc_8)
                {
                    
                    var _loc_10:* = _loc_9;
                    with (_loc_9)
                    {
                        if (String(@type).search(/^com.netease.protobuf.fieldDescriptors::(Repeated)?FieldDescriptor_""^com.netease.protobuf.fieldDescriptors::(Repeated)?FieldDescriptor_/) == 0)
                        {
                        }
                        if (BaseFieldDescriptor(type[@name]).name.search(/\/""\//) == -1)
                        {
                            _loc_6[_loc_7] = _loc_9;
                        }
                    }
                }
                messageFields = _loc_6.@name;
                allMessageFields[type] = messageFields;
            }
            var _loc_6:int = 0;
            var _loc_7:* = messageFields;
            while (_loc_7 in _loc_6)
            {
                
                fieldDescriptorName = _loc_7[_loc_6];
                fieldDescriptor = type[fieldDescriptorName];
                shortName = fieldDescriptor.fullName.substring((fieldDescriptor.fullName.lastIndexOf(".") + 1));
                if (fieldDescriptor.type == Array)
                {
                    fieldValues = message[fieldDescriptor.name];
                    if (fieldValues)
                    {
                        i;
                        while (i < fieldValues.length)
                        {
                            
                            if (isFirst)
                            {
                                isFirst;
                            }
                            else
                            {
                                output.writeByte(printSetting.newLine);
                            }
                            output.writeUTFBytes(currentIndent);
                            output.writeUTFBytes(shortName);
                            printValue(output, fieldDescriptor, fieldValues[i], printSetting, currentIndent);
                            i = (i + 1);
                        }
                    }
                    continue;
                }
                m = fieldDescriptor.name.match(/^(__)?(.)(.*)$""^(__)?(.)(.*)$/);
                m[0] = "";
                m[1] = "has";
                m[2] = m[2].toUpperCase();
                hasField = m.join("");
                try
                {
                    if (message[hasField] === false)
                    {
                        continue;
                    }
                }
                catch (e:ReferenceError)
                {
                }
                if (isFirst)
                {
                    isFirst;
                }
                else
                {
                    output.writeByte(printSetting.newLine);
                }
                output.writeUTFBytes(currentIndent);
                output.writeUTFBytes(shortName);
                printValue(output, fieldDescriptor, message[fieldDescriptor.name], printSetting, currentIndent);
            }
            var _loc_6:int = 0;
            var _loc_7:* = message;
            while (_loc_7 in _loc_6)
            {
                
                key = _loc_7[_loc_6];
                if (!message.propertyIsEnumerable(key))
                {
                    continue;
                }
                try
                {
                    extension = BaseFieldDescriptor.getExtensionByName(key);
                }
                catch (e:ReferenceError)
                {
                    if (key.search(/^[0-9]+$""^[0-9]+$/) == 0)
                    {
                        if (isFirst)
                        {
                            isFirst;
                        }
                        else
                        {
                            output.writeByte(printSetting.newLine);
                        }
                        printUnknownField(output, uint(key), message[key], printSetting, currentIndent);
                    }
                    else
                    {
                        throw new IOError("Bad unknown field " + key);
                    }
                    continue;
                }
                if (extension.type == Array)
                {
                    extensionFieldValues = message[key];
                    j;
                    while (j < extensionFieldValues.length)
                    {
                        
                        if (isFirst)
                        {
                            isFirst;
                        }
                        else
                        {
                            output.writeByte(printSetting.newLine);
                        }
                        output.writeUTFBytes(currentIndent);
                        output.writeUTFBytes("[");
                        output.writeUTFBytes(extension.fullName);
                        output.writeUTFBytes("]");
                        printValue(output, extension, extensionFieldValues[j], printSetting, currentIndent);
                        j = (j + 1);
                    }
                    continue;
                }
                if (isFirst)
                {
                    isFirst;
                }
                else
                {
                    output.writeByte(printSetting.newLine);
                }
                output.writeUTFBytes(currentIndent);
                output.writeUTFBytes("[");
                output.writeUTFBytes(extension.fullName);
                output.writeUTFBytes("]");
                printValue(output, extension, message[key], printSetting, currentIndent);
            }
            return;
        }// end function

        private static function printValue(param1:IDataOutput, param2:BaseFieldDescriptor, param3:Object, param4:PrintSetting, param5:String = "") : void
        {
            var _loc_7:String = null;
            var _loc_8:FieldDescriptor_TYPE_ENUM = null;
            var _loc_9:RepeatedFieldDescriptor_TYPE_ENUM = null;
            var _loc_6:* = param3 as Message;
            if (_loc_6)
            {
                if (param4 == SINGLELINE_MODE)
                {
                    param1.writeUTFBytes("{");
                }
                else
                {
                    param1.writeUTFBytes(" {\n");
                }
                printMessageFields(param1, _loc_6, param4, param4.indentChars + param5);
                if (param4 == SINGLELINE_MODE)
                {
                    param1.writeUTFBytes("}");
                }
                else
                {
                    param1.writeByte(param4.newLine);
                    param1.writeUTFBytes(param5);
                    param1.writeUTFBytes("}");
                }
            }
            else
            {
                param1.writeUTFBytes(param4.simpleFieldSeperator);
                _loc_7 = param3 as String;
                if (_loc_7 !== null)
                {
                    printString(param1, _loc_7);
                }
                else
                {
                    _loc_8 = param2 as FieldDescriptor_TYPE_ENUM;
                    if (_loc_8)
                    {
                        printEnum(param1, int(param3), _loc_8.enumType);
                    }
                    else
                    {
                        _loc_9 = param2 as RepeatedFieldDescriptor_TYPE_ENUM;
                        if (_loc_9)
                        {
                            printEnum(param1, int(param3), _loc_9.enumType);
                        }
                        else
                        {
                            if (!(param2 is FieldDescriptor_TYPE_BYTES))
                            {
                            }
                            if (param2 is RepeatedFieldDescriptor_TYPE_BYTES)
                            {
                                printBytes(param1, ByteArray(param3));
                            }
                            else
                            {
                                param1.writeUTFBytes(param3.toString());
                            }
                        }
                    }
                }
            }
            return;
        }// end function

        public static function printToUTFBytes(param1:IDataOutput, param2:Message, param3:Boolean = true, param4:String = "") : void
        {
            printMessageFields(param1, param2, param3 ? (SINGLELINE_MODE) : (MULTILINE_MODE), param4);
            return;
        }// end function

        public static function printToString(param1:Message, param2:Boolean = true, param3:String = "") : String
        {
            var _loc_4:* = new ByteArray();
            printToUTFBytes(_loc_4, param1, param2, param3);
            _loc_4.position = 0;
            return _loc_4.readUTFBytes(_loc_4.length);
        }// end function

        private static function skipWhitespace(param1:ISource) : void
        {
            var _loc_2:int = 0;
            while (true)
            {
                
                _loc_2 = param1.read();
                switch(_loc_2)
                {
                    case 32:
                    case 9:
                    case 10:
                    case 13:
                    {
                        break;
                    }
                    case 35:
                    {
                        while (true)
                        {
                            
                            switch(param1.read())
                            {
                                case 10:
                                case 13:
                                {
                                    break;
                                }
                                default:
                                {
                                    break;
                                }
                            }
                        }
                        break;
                    }
                    default:
                    {
                        param1.unread(_loc_2);
                        return;
                        break;
                    }
                }
            }
            return;
        }// end function

        private static function toHexDigit(param1:int) : int
        {
            if (param1 >= 48)
            {
            }
            if (param1 <= 57)
            {
                return param1 - 48;
            }
            if (param1 >= 97)
            {
            }
            if (param1 <= 102)
            {
                return param1 - 87;
            }
            if (param1 >= 65)
            {
            }
            if (param1 <= 70)
            {
                return param1 - 55;
            }
            throw new IOError("Expect hex, got " + String.fromCharCode(param1));
        }// end function

        private static function toOctalDigit(param1:int) : int
        {
            if (param1 >= 48)
            {
            }
            if (param1 <= 55)
            {
                return param1 - 48;
            }
            throw new IOError("Expect digit, got " + String.fromCharCode(param1));
        }// end function

        private static function tryConsumeBytes(param1:ISource) : ByteArray
        {
            var _loc_3:ByteArray = null;
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_9:int = 0;
            skipWhitespace(param1);
            var _loc_2:* = param1.read();
            switch(_loc_2)
            {
                case 34:
                case 39:
                {
                    _loc_3 = new ByteArray();
                    while (true)
                    {
                        
                        _loc_4 = param1.read();
                        switch(_loc_4)
                        {
                            case _loc_2:
                            {
                                return _loc_3;
                            }
                            case 92:
                            {
                                _loc_5 = param1.read();
                                switch(_loc_5)
                                {
                                    case 97:
                                    {
                                        _loc_3.writeByte(7);
                                        break;
                                    }
                                    case 98:
                                    {
                                        _loc_3.writeByte(8);
                                        break;
                                    }
                                    case 102:
                                    {
                                        _loc_3.writeByte(12);
                                        break;
                                    }
                                    case 110:
                                    {
                                        _loc_3.writeByte(10);
                                        break;
                                    }
                                    case 114:
                                    {
                                        _loc_3.writeByte(13);
                                        break;
                                    }
                                    case 116:
                                    {
                                        _loc_3.writeByte(9);
                                        break;
                                    }
                                    case 118:
                                    {
                                        _loc_3.writeByte(11);
                                        break;
                                    }
                                    case 120:
                                    {
                                        _loc_6 = param1.read();
                                        _loc_7 = param1.read();
                                        _loc_3.writeByte(toHexDigit(_loc_6) * 16 + toHexDigit(_loc_7));
                                        break;
                                    }
                                    default:
                                    {
                                        if (_loc_5 >= 48)
                                        {
                                        }
                                        if (_loc_5 <= 57)
                                        {
                                            _loc_8 = param1.read();
                                            _loc_9 = param1.read();
                                            _loc_3.writeByte(toOctalDigit(_loc_5) * 64 + toOctalDigit(_loc_8) * 8 + toOctalDigit(_loc_9));
                                        }
                                        else
                                        {
                                            _loc_3.writeByte(_loc_5);
                                        }
                                        break;
                                        break;
                                    }
                                }
                            }
                            default:
                            {
                                _loc_3.writeByte(_loc_4);
                                break;
                                break;
                            }
                        }
                    }
                    break;
                }
                default:
                {
                    param1.unread(_loc_2);
                    break;
                    break;
                }
            }
            return null;
        }// end function

        private static function tryConsume(param1:ISource, param2:int) : Boolean
        {
            skipWhitespace(param1);
            var _loc_3:* = param1.read();
            if (_loc_3 == param2)
            {
                return true;
            }
            param1.unread(_loc_3);
            return false;
        }// end function

        private static function consume(param1:ISource, param2:int) : void
        {
            skipWhitespace(param1);
            var _loc_3:* = param1.read();
            if (_loc_3 != param2)
            {
                throw new IOError("Expect " + String.fromCharCode(param2) + ", got " + String.fromCharCode(_loc_3));
            }
            return;
        }// end function

        private static function consumeIdentifier(param1:ISource) : String
        {
            var _loc_3:int = 0;
            skipWhitespace(param1);
            var _loc_2:* = new ByteArray();
            while (true)
            {
                
                _loc_3 = param1.read();
                if (_loc_3 >= 48)
                {
                }
                if (_loc_3 > 57)
                {
                    if (_loc_3 >= 65)
                    {
                    }
                }
                if (_loc_3 > 90)
                {
                    if (_loc_3 >= 97)
                    {
                    }
                }
                if (_loc_3 > 122)
                {
                }
                if (_loc_3 != 46)
                {
                }
                if (_loc_3 != 95)
                {
                }
                if (_loc_3 != 45)
                {
                }
                if (_loc_3 < 0)
                {
                    _loc_2.writeByte(_loc_3);
                    continue;
                }
                if (_loc_2.length == 0)
                {
                    throw new IOError("Expect Identifier, got " + String.fromCharCode(_loc_3));
                }
                param1.unread(_loc_3);
                break;
            }
            _loc_2.position = 0;
            return _loc_2.readUTFBytes(_loc_2.length);
        }// end function

        private static function appendUnknown(param1:Message, param2:uint, param3) : void
        {
            var _loc_5:Array = null;
            var _loc_4:* = param1[param2];
            if (_loc_4 === undefined)
            {
                param1[param2] = param3;
            }
            else
            {
                _loc_5 = _loc_4 as Array;
                if (_loc_5)
                {
                    _loc_5.push(param3);
                }
                else
                {
                    param1[param2] = [_loc_4, param3];
                }
            }
            return;
        }// end function

        private static function consumeUnknown(param1:ISource, param2:Message, param3:uint) : void
        {
            var _loc_5:String = null;
            var _loc_4:* = tryConsumeBytes(param1);
            if (_loc_4)
            {
                appendUnknown(param2, param3 << 3 | WireType.LENGTH_DELIMITED, _loc_4);
                return;
            }
            _loc_5 = consumeIdentifier(param1);
            var _loc_6:* = _loc_5.match(/^0[xX]([0-9a-fA-F]{16}|[0-9a-fA-F]{8})$""^0[xX]([0-9a-fA-F]{16}|[0-9a-fA-F]{8})$/);
            if (!_loc_6)
            {
                appendUnknown(param2, param3 << 3 | WireType.VARINT, UInt64.parseUInt64(_loc_5));
                return;
            }
            var _loc_7:* = _loc_6[1];
            if (_loc_7.length == 8)
            {
                appendUnknown(param2, param3 << 3 | WireType.FIXED_32_BIT, uint(parseInt(_loc_7, 16)));
            }
            else
            {
                appendUnknown(param2, param3 << 3 | WireType.FIXED_64_BIT, UInt64.parseUInt64(_loc_7, 16));
            }
            return;
        }// end function

        private static function consumeEnumFieldValue(param1:ISource, param2:Class) : int
        {
            var _loc_3:String = null;
            consume(param1, 58);
            _loc_3 = consumeIdentifier(param1);
            var _loc_4:* = param2[_loc_3];
            if (_loc_4 === undefined)
            {
                throw new IOError("Invalid enum name " + _loc_3);
            }
            return _loc_4;
        }// end function

        private static function parseUnknown(param1:Message) : void
        {
            var _loc_3:String = null;
            var _loc_4:ByteArray = null;
            var _loc_5:uint = 0;
            var _loc_2:* = new WritingBuffer();
            for (_loc_3 in param1)
            {
                
                _loc_5 = uint(_loc_3);
                if (_loc_5 == 0)
                {
                    continue;
                }
                WriteUtils.writeUnknownPair(_loc_2, _loc_5, param1[_loc_3]);
                delete param1[_loc_3];
            }
            _loc_4 = new ByteArray();
            _loc_2.toNormal(_loc_4);
            _loc_4.position = 0;
            param1.mergeFrom(_loc_4);
            return;
        }// end function

        private static function consumeFieldValue(param1:ISource, param2:Class)
        {
            var _loc_3:ByteArray = null;
            var _loc_4:ByteArray = null;
            var _loc_5:String = null;
            var _loc_6:Message = null;
            switch(param2)
            {
                case ByteArray:
                {
                    consume(param1, 58);
                    _loc_3 = tryConsumeBytes(param1);
                    if (_loc_3)
                    {
                        _loc_3.position = 0;
                        return _loc_3;
                    }
                    throw new IOError("Expect quoted bytes");
                }
                case String:
                {
                    consume(param1, 58);
                    _loc_4 = tryConsumeBytes(param1);
                    if (_loc_4)
                    {
                        _loc_4.position = 0;
                        return _loc_4.readUTFBytes(_loc_4.length);
                    }
                    throw new IOError("Expect quoted string");
                }
                case Boolean:
                {
                    consume(param1, 58);
                    _loc_5 = consumeIdentifier(param1);
                    switch(_loc_5)
                    {
                        case "true":
                        {
                            return true;
                        }
                        case "false":
                        {
                            return false;
                        }
                        default:
                        {
                            throw new IOError("Expect boolean, got " + _loc_5);
                            break;
                        }
                    }
                }
                case Int64:
                {
                    consume(param1, 58);
                    return Int64.parseInt64(consumeIdentifier(param1));
                }
                case UInt64:
                {
                    consume(param1, 58);
                    return UInt64.parseUInt64(consumeIdentifier(param1));
                }
                case uint:
                {
                    consume(param1, 58);
                    return uint(parseInt(consumeIdentifier(param1)));
                }
                case int:
                {
                    consume(param1, 58);
                    return int(parseInt(consumeIdentifier(param1)));
                }
                case Number:
                {
                    consume(param1, 58);
                    return parseFloat(consumeIdentifier(param1));
                }
                default:
                {
                    tryConsume(param1, 58);
                    consume(param1, 123);
                    _loc_6 = new param2;
                    while (true)
                    {
                        
                        if (tryConsume(param1, 125))
                        {
                            break;
                        }
                        consumeField(param1, _loc_6);
                    }
                    parseUnknown(_loc_6);
                    return _loc_6;
                    break;
                }
            }
        }// end function

        private static function consumeField(param1:ISource, param2:Message) : void
        {
            var name:String;
            var fieldDescriptor:BaseFieldDescriptor;
            var lastDotPosition:int;
            var scope:String;
            var localName:String;
            var destination:Array;
            var enumRepeatedFieldDescriptor:RepeatedFieldDescriptor_TYPE_ENUM;
            var enumFieldDescriptor:FieldDescriptor_TYPE_ENUM;
            var source:* = param1;
            var message:* = param2;
            var isExtension:* = tryConsume(source, 91);
            name = consumeIdentifier(source);
            if (isExtension)
            {
                consume(source, 93);
            }
            if (isExtension)
            {
                lastDotPosition = name.lastIndexOf(".");
                scope = name.substring(0, lastDotPosition);
                localName = name.substring((lastDotPosition + 1));
                try
                {
                    fieldDescriptor = getDefinitionByName(scope)[localName.toUpperCase()];
                }
                catch (e:ReferenceError)
                {
                    try
                    {
                        fieldDescriptor = BaseFieldDescriptor(getDefinitionByName(scope + "." + localName.toUpperCase()));
                    }
                    catch (e:ReferenceError)
                    {
                        throw new IOError("Unknown extension: " + name);
                    }
                }
                else
                {
                    if (name.search(/[0-9]+""[0-9]+/) == 0)
                    {
                        consume(source, 58);
                        consumeUnknown(source, message, uint(name));
                        return;
                    }
                    fieldDescriptor = Object(message).constructor[name.toUpperCase()];
                    if (!fieldDescriptor)
                    {
                        throw new IOError("Unknown field: " + name);
                    }
                }
                var repeatedFieldDescriptor:* = fieldDescriptor as RepeatedFieldDescriptor;
                if (repeatedFieldDescriptor)
                {
                    if (!message[fieldDescriptor.name])
                    {
                        var _loc_4:* = [];
                        message[fieldDescriptor.name] = [];
                    }
                    destination = _loc_4;
                    enumRepeatedFieldDescriptor = repeatedFieldDescriptor as RepeatedFieldDescriptor_TYPE_ENUM;
                    destination.push(enumRepeatedFieldDescriptor ? (consumeEnumFieldValue(source, enumRepeatedFieldDescriptor.enumType)) : (consumeFieldValue(source, repeatedFieldDescriptor.elementType)));
                }
                else
                {
                    enumFieldDescriptor = fieldDescriptor as FieldDescriptor_TYPE_ENUM;
                    message[fieldDescriptor.name] = enumFieldDescriptor ? (consumeEnumFieldValue(source, enumFieldDescriptor.enumType)) : (consumeFieldValue(source, fieldDescriptor.type));
                }
                return;
        }// end function

        private static function mergeFromSource(param1:ISource, param2:Message) : void
        {
            while (true)
            {
                
                if (tryConsume(param1, 0))
                {
                    break;
                }
                consumeField(param1, param2);
            }
            parseUnknown(param2);
            return;
        }// end function

        public static function mergeFromUTFBytes(param1:IDataInput, param2:Message) : void
        {
            mergeFromSource(new WrappedSource(param1), param2);
            return;
        }// end function

        public static function mergeFromString(param1:String, param2:Message) : void
        {
            var _loc_3:* = new BufferedSource();
            _loc_3.writeUTFBytes(param1);
            _loc_3.position = 0;
            mergeFromSource(_loc_3, param2);
            return;
        }// end function

    }
}

class PrintSetting extends Object
{
    public var newLine:uint;
    public var indentChars:String;
    public var simpleFieldSeperator:String;

    function PrintSetting()
    {
        return;
    }// end function

}


class BufferedSource extends ByteArray implements ISource
{

    function BufferedSource()
    {
        return;
    }// end function

    public function unread(param1:int) : void
    {
        if (param1 == 0)
        {
        }
        if (bytesAvailable == 0)
        {
            return;
        }
        var _loc_3:* = position - 1;
        position = _loc_3;
        return;
    }// end function

    public function read() : int
    {
        if (bytesAvailable > 0)
        {
            return readByte();
        }
        return 0;
    }// end function

}

