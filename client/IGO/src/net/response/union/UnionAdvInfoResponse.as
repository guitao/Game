/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.union
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 公会广告信息返回(7:46)
     */
    public class UnionAdvInfoResponse implements IResponse
    {
        /**
         * 0 成功失败 1资源不足 2错误
         */
        public var ret:uint;

        /**
         * 公会ID
         */
        public var unionID:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        public function read(p:Packet):void
        {

            ret = p.readUnsignedByte();
            unionID = p.readUnsignedInt();
            unionName = p.readMultiByte(33, "utf-8");
        }
    }
}