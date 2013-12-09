/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.dare
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 查询我的竞技对象(13:2)
     */
    public class ReqMyPkListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 数据
         */
        public var infoList:Array /* of PKUserInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var pKUserInfo:PKUserInfo = new PKUserInfo();
                pKUserInfo.userID = p.readUnsignedInt();
                pKUserInfo.nickName = p.readMultiByte(33, "utf-8");
                pKUserInfo.level = p.readUnsignedShort();
                pKUserInfo.sex = p.readUnsignedByte();
				pKUserInfo.avatarList = [];
                for(var j:int = 0; j < 8; j++){
					pKUserInfo.avatarList.push(p.readUnsignedInt());
      	       }
                pKUserInfo.rank = p.readUnsignedInt();
                pKUserInfo.allCombat = p.readUnsignedInt();
                infoList.push(pKUserInfo);
            }
        }
    }
}