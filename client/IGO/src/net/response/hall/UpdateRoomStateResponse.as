/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.hall
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 设置房间状态(4:41)
     */
    public class UpdateRoomStateResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 房间状态
         */
        public var infoList:Array /* of RoomState */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var roomState:RoomState = new RoomState();
                roomState.id = p.readUnsignedInt();
                roomState.state = p.readUnsignedByte();
                infoList.push(roomState);
            }
        }
    }
}