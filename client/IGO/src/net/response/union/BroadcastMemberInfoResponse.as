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
     * 更新公会成员状态及信息通知消息(7:27)
     */
    public class BroadcastMemberInfoResponse implements IResponse
    {
        /**
         * 成员状态 1上线 2下线 3离开本公会 4加入本公会 5别名更改 6提升为管理员 7降为会员 8提升为会长 9成员被踢 10捐献公会
         */
        public var state:uint;

        /**
         * 成员ID
         */
        public var id:uint;

        /**
         * 成员名称
         */
        public var name:String;

        /**
         * 捐赠类型0银币 1人民币
         */
        public var type:uint;

        /**
         * 捐赠数量
         */
        public var num:uint;

        public function read(p:Packet):void
        {

            state = p.readUnsignedByte();
            id = p.readUnsignedInt();
            name = p.readMultiByte(33, "utf-8");
            type = p.readUnsignedByte();
            num = p.readUnsignedInt();
        }
    }
}