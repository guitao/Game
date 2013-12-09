/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.scene
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 移动(5:10)
     */
    public class MoveResponse implements IResponse
    {
        /**
         * ID
         */
        public var guid:GUID;

        /**
         * 移动状态 0停止 1移动
         */
        public var state:uint;

        /**
         * 移动角度
         */
        public var angle:Number;

        /**
         * 移动速度
         */
        public var speed:uint;

        /**
         * 当前x坐标
         */
        public var x:uint;

        /**
         * 当前y坐标
         */
        public var y:uint;

        /**
         * 目标点
         */
        public var destX:uint;

        /**
         * 目标点
         */
        public var destY:uint;

        /**
         * 同步标记 1需要同步 0不需要
         */
        public var synFlag:uint;

        public function read(p:Packet):void
        {

            guid = new GUID();
            guid.id = p.readUnsignedInt();
            guid.type = p.readUnsignedByte();
            state = p.readUnsignedByte();
            angle = p.readFloat();
            speed = p.readUnsignedShort();
            x = p.readUnsignedShort();
            y = p.readUnsignedShort();
            destX = p.readUnsignedShort();
            destY = p.readUnsignedShort();
            synFlag = p.readUnsignedByte();
        }
    }
}