/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 装备格子信息(11:22)
     */
    public class EquipGridInfoResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 装备格子数据
         */
        public var infoList:Array /* of EquipGridInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var equipGridInfo:EquipGridInfo = new EquipGridInfo();
                equipGridInfo.id = p.readUnsignedByte();
                equipGridInfo.level = p.readUnsignedShort();
                infoList.push(equipGridInfo);
            }
        }
    }
}