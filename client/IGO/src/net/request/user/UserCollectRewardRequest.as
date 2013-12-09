/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 用户技能收集奖励领取(2:65)
     */
    public class UserCollectRewardRequest implements IRequest
    {
        /**
         * 领取奖励类型 1进度奖励 2组收集奖励 3英雄奖励
         */
        public var type:uint;
    
        /**
         * 区域ID
         */
        public var zone:uint;
    
        /**
         * 组奖励对应组ID 英雄奖励对应英雄个数 进度奖励发0
         */
        public var value:uint;
    
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 65;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(zone);
            p.writeShort(value);
        }
    }
}