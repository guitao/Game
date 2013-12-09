/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.user
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 解除神之封印(2:72)
     */
    public class ReleaseGodSealResponse implements IResponse
    {
        /**
         * 当前已解除点的序号
         */
        public var dot:uint;

        /**
         * 0ok 1未解锁 2资源不足 3已解锁 4等级不足 5未知错误
         */
        public var ret:uint;

        public function read(p:Packet):void
        {

            dot = p.readUnsignedShort();
            ret = p.readUnsignedByte();
        }
    }
}