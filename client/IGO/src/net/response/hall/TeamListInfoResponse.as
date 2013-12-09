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
     * 队伍列表(4:49)
     */
    public class TeamListInfoResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 房间信息
         */
        public var infoList:Array /* of TeamInfo */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var teamInfo:TeamInfo = new TeamInfo();
                teamInfo.teamID = p.readUnsignedInt();
                teamInfo.name = p.readMultiByte(33, "utf-8");
                teamInfo.level = p.readUnsignedShort();
                teamInfo.mode = p.readUnsignedByte();
                teamInfo.curPlayers = p.readUnsignedByte();
                teamInfo.maxPlayers = p.readUnsignedByte();
                teamInfo.owner = p.readUnsignedInt();
                teamInfo.state = p.readUnsignedByte();
                infoList.push(teamInfo);
            }
        }
    }
}