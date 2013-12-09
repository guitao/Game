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
     * 活动排行奖励通知(2:108)
     */
    public class ActivityRankRewardResponse implements IResponse
    {
        /**
         * 奖励类型 1角斗场排名 2 公会战总积分 3公会战个人积分 4公会BOSS站 5世界BOSS
         */
        public var type:uint;

        /**
         * 获奖人数
         */
        public var num:uint;

        /**
         * 奖励信息
         */
        public var infoList:Array /* of ActivityRankInfo */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var activityRankInfo:ActivityRankInfo = new ActivityRankInfo();
                activityRankInfo.id = p.readUnsignedInt();
                activityRankInfo.name = p.readMultiByte(33, "utf-8");
                activityRankInfo.rank = p.readUnsignedInt();
                activityRankInfo.item = new ItemNumInfo();
                activityRankInfo.item.id = p.readUnsignedInt();
                activityRankInfo.item.num = p.readUnsignedInt();
                infoList.push(activityRankInfo);
            }
        }
    }
}