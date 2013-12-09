/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.item
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 删除礼包(11:48)
     */
    public class DeleteGiftPackResponse implements IResponse
    {
        /**
         * 礼包ID
         */
        public var id:uint;

        /**
         * 类型 1过期 2队列满 3玩家手动删除
         */
        public var type:uint;

        public function read(p:Packet):void
        {

            id = p.readUnsignedInt();
            type = p.readUnsignedByte();
        }
    }
}