/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.request.login
{
    import com.yo.framework.net.IRequest;
    import com.yo.game.net.vo.*;
    import com.yo.framework.net.Packet;

    /**
     * 占个坑(1:3)
     */
    public class LoginSuccessRequest implements IRequest
    {
        public function get module():uint
        {
            return 1;
        }

        public function get action():uint
        {
            return 3;
        }

        public function write(p:Packet):void
        {
            
        }
    }
}