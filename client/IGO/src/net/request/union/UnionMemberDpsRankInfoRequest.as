/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.union
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 公会成员伤害输出排行(7:47)
     */
    public class UnionMemberDpsRankInfoRequest implements IRequest
    {
        public function get module():int
        {
            return 7;
        }

        public function get action():int
        {
            return 47;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}