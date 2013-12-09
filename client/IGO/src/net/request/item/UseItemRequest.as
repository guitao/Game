/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.request.item
{
    import com.yo.net.IRequest;
    import net.vo.*;
    import com.yo.net.Packet;

    /**
     * 使用物品(11:13)
     */
    public class UseItemRequest implements IRequest
    {
        /**
         * 类型0唯一ID 1baseID
         */
        public var type:uint;
    
        /**
         * 物品唯一ID
         */
        public var itemID:uint;
    
        /**
         * 使用的数量
         */
        public var num:uint;
    
        public function get module():int
        {
            return 11;
        }

        public function get action():int
        {
            return 13;
        }

        public function write(p:Packet):void
        {
            
            p.writeByte(type);
            p.writeUnsignedInt(itemID);
            p.writeUnsignedInt(num);
        }
    }
}