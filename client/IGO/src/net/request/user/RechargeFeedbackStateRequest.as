/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.user
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 请求充值回馈活动状态信息(2:117)
     */
    public class RechargeFeedbackStateRequest implements IRequest
    {
        public function get module():uint
        {
            return 2;
        }

        public function get action():uint
        {
            return 117;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}