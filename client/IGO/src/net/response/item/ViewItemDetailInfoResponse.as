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
     * 查看玩家展示的道具信息(11:50)
     */
    public class ViewItemDetailInfoResponse implements IResponse
    {
        /**
         * 物品数据
         */
        public var info:ItemInfo;

        public function read(p:Packet):void
        {

            info = new ItemInfo();
            info.id = p.readUnsignedInt();
            info.baseID = p.readUnsignedInt();
            info.pos = new ItemLocationInfo();
            info.pos.locationType = p.readUnsignedInt();
            info.pos.tableID = p.readUnsignedInt();
            info.pos.column = p.readUnsignedShort();
            info.pos.row = p.readUnsignedShort();
            info.num = p.readUnsignedInt();
            info.upgrade = p.readUnsignedByte();
            info.quality = p.readUnsignedByte();
            info.bind = p.readUnsignedByte();
            info.exp = p.readUnsignedInt();
            info.pDamage = p.readUnsignedShort();
            info.pdPercent = p.readUnsignedShort();
            info.defence = p.readUnsignedShort();
            info.maxHP = p.readUnsignedInt();
            info.resumeHP = p.readUnsignedShort();
            info.obtainTime = p.readUnsignedInt();
            info.endTime = p.readUnsignedInt();
            info.price = p.readUnsignedInt();
				info.starList = [];
                for(var i:int = 0; i < 10; i++){
					info.starList.push(p.readUnsignedInt());
      	       }
				info.socketList = [];
                for(var j:int = 0; j < 6; j++){
            	var infoSocketInfo:SocketInfo = new SocketInfo();
            	infoSocketInfo.type = p.readUnsignedByte();
            	infoSocketInfo.itemID = p.readUnsignedInt();
					infoSocketInfo.fixEffectList = [];
                	for(var k:int = 0; k < 5; k++){
            		var itemEffect:ItemEffect = new ItemEffect();
						itemEffect.type = p.readUnsignedByte();
						itemEffect.id = p.readUnsignedShort();
						itemEffect.value = p.readUnsignedInt();
						infoSocketInfo.fixEffectList.push(itemEffect);
					}
					infoSocketInfo.skillList = [];
                	for(var m:int = 0; m < 3; m++){
						infoSocketInfo.skillList.push(p.readUnsignedShort());
					}
            	info.socketList.push(infoSocketInfo)
      	       }
				info.fixEffectList = [];
                for(var n:int = 0; n < 5; n++){
            	var infoItemEffect:ItemEffect = new ItemEffect();
            	infoItemEffect.type = p.readUnsignedByte();
            	infoItemEffect.id = p.readUnsignedShort();
            	infoItemEffect.value = p.readUnsignedInt();
            	info.fixEffectList.push(infoItemEffect)
      	       }
				info.randEffectList = [];
                for(var x:int = 0; x < 5; x++){
            	var infoItemEffect:ItemEffect = new ItemEffect();
            	infoItemEffect.type = p.readUnsignedByte();
            	infoItemEffect.id = p.readUnsignedShort();
            	infoItemEffect.value = p.readUnsignedInt();
            	info.randEffectList.push(infoItemEffect)
      	       }
				info.growEffectList = [];
                for(var y:int = 0; y < 5; y++){
            	var infoItemEffect:ItemEffect = new ItemEffect();
            	infoItemEffect.type = p.readUnsignedByte();
            	infoItemEffect.id = p.readUnsignedShort();
            	infoItemEffect.value = p.readUnsignedInt();
            	info.growEffectList.push(infoItemEffect)
      	       }
				info.skillList = [];
                for(var z:int = 0; z < 3; z++){
					info.skillList.push(p.readUnsignedShort());
      	       }
        }
    }
}