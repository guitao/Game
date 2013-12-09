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
     * 开启ui列表(2:96)
     */
    public class UiOpenListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * ui列表
         */
        public var idList:Array /* of uint */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			idList = [];
            for(var i:int = 0; i < num; i++){
                idList.push(p.readUnsignedInt());
            }
        }
    }
}