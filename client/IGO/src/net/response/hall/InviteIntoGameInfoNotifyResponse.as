/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 邀请好友加入游戏通知(4:21)
     */
    public class InviteIntoGameInfoNotifyResponse implements IResponse
    {
        /**
         * 邀请者ID
         */
        public var id:uint;

        /**
         * 邀请者名称
         */
        public var name:String;

        /**
         * 邀请类型 0副本邀请 1切磋邀请 2队伍邀请
         */
        public var kind:uint;

        /**
         * 房间ID
         */
        public var roomID:uint;

        /**
         * 地图ID
         */
        public var mapID:uint;

        /**
         * 队伍ID
         */
        public var teamID:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            name = p.readMultiByte(33, "utf-8");
            kind = p.readUnsignedByte();
            roomID = p.readUnsignedInt();
            mapID = p.readUnsignedInt();
            teamID = p.readUnsignedInt();
        }
    }
}