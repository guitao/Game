/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 御神器信息(2:74)
     */
    public class GodCtrlInfoResponse implements IResponse
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 英雄增加属性
         */
        public var info:AddProperity;

        /**
         * 数量
         */
        public var num:uint;

        /**
         * 当前点
         */
        public var dataList:Array /* of GodCtrlLevelInfo */;

        public function read(p:Packet):void
        {

            userID = p.readUnsignedInt();
            info = new AddProperity();
            info.atk = p.readUnsignedShort();
            info.atkp = p.readUnsignedShort();
            info.crip = p.readUnsignedShort();
            info.cri = p.readUnsignedShort();
            info.def = p.readUnsignedShort();
            info.ref = p.readUnsignedShort();
            info.tough = p.readUnsignedShort();
            info.hp = p.readUnsignedShort();
            info.hpp = p.readUnsignedShort();
            info.suck = p.readUnsignedShort();
            info.rhp = p.readUnsignedShort();
            num = p.readUnsignedShort();
			dataList = [];
            for(var i:int = 0; i < num; i++){
                var godCtrlLevelInfo:GodCtrlLevelInfo = new GodCtrlLevelInfo();
                godCtrlLevelInfo.level = p.readUnsignedByte();
				godCtrlLevelInfo.infoList = [];
                for(var j:int = 0; j < 6; j++){
                	var infoDotInfo:DotInfo = new DotInfo();
                	infoDotInfo.id = p.readUnsignedByte();
                	infoDotInfo.state = p.readUnsignedByte();
                	godCtrlLevelInfo.infoList.push(infoDotInfo)
      	       }
                dataList.push(godCtrlLevelInfo);
            }
        }
    }
}