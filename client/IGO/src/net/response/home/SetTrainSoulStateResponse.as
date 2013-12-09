/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 设置育魂珠状态(15:22)
     */
    public class SetTrainSoulStateResponse implements IResponse
    {
        /**
         * 0成功 1ID未发现 2已存在魂晶 3非法操作 4等级不足
         */
        public var ret:uint;

        /**
         * 育魂珠
         */
        public var info:TrainSoul;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            info = new TrainSoul();
            info.id = p.readUnsignedShort();
            info.state = p.readUnsignedByte();
            info.type = p.readUnsignedByte();
            info.trainItem = p.readUnsignedInt();
            info.startTime = p.readUnsignedInt();
            info.endTime = p.readUnsignedInt();
            info.soulPoint = p.readUnsignedInt();
        }
    }
}