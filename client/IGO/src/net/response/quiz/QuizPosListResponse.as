/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.quiz
{
    import com.yo.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 竞赛结果(17:6)
     */
    public class QuizPosListResponse implements IResponse
    {
        /**
         * 竞赛类型 1世界 2个人
         */
        public var type:uint;

        /**
         * 获奖人数
         */
        public var num:uint;

        /**
         * 竞赛奖励
         */
        public var infoList:Array /* of QuizRankInfo */;

        public function read(p:Packet):void
        {

            type = p.readUnsignedByte();
            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var quizRankInfo:QuizRankInfo = new QuizRankInfo();
                quizRankInfo.id = p.readUnsignedInt();
                quizRankInfo.name = p.readMultiByte(33, "utf-8");
                quizRankInfo.score = p.readUnsignedInt();
                quizRankInfo.rank = p.readUnsignedInt();
                quizRankInfo.item = new ItemInfo();
                quizRankInfo.item.id = p.readUnsignedInt();
                quizRankInfo.item.baseID = p.readUnsignedInt();
                quizRankInfo.item.pos = new ItemLocationInfo();
            quizRankInfo.item.pos.locationType = p.readUnsignedInt();
            quizRankInfo.item.pos.tableID = p.readUnsignedInt();
            quizRankInfo.item.pos.column = p.readUnsignedShort();
            quizRankInfo.item.pos.row = p.readUnsignedShort();
                quizRankInfo.item.num = p.readUnsignedInt();
                quizRankInfo.item.upgrade = p.readUnsignedByte();
                quizRankInfo.item.quality = p.readUnsignedByte();
                quizRankInfo.item.bind = p.readUnsignedByte();
                quizRankInfo.item.exp = p.readUnsignedInt();
                quizRankInfo.item.pDamage = p.readUnsignedShort();
                quizRankInfo.item.pdPercent = p.readUnsignedShort();
                quizRankInfo.item.defence = p.readUnsignedShort();
                quizRankInfo.item.maxHP = p.readUnsignedInt();
                quizRankInfo.item.resumeHP = p.readUnsignedShort();
                quizRankInfo.item.obtainTime = p.readUnsignedInt();
                quizRankInfo.item.endTime = p.readUnsignedInt();
                quizRankInfo.item.price = p.readUnsignedInt();
				quizRankInfo.item.starList = [];
                for(var j:int = 0; j < 10; j++){
					quizRankInfo.item.starList.push(p.readUnsignedInt());
				}
				quizRankInfo.item.socketList = [];
                for(var k:int = 0; k < 6; k++){
					var dataSocketInfo:SocketInfo = new SocketInfo()
            		dataSocketInfo.type = p.readUnsignedByte();
            		dataSocketInfo.itemID = p.readUnsignedInt();
						dataSocketInfo.fixEffectList = [];
                for(var m:int = 0; m < 5; m++){
            	var infoItemEffect:ItemEffect = new ItemEffect();
            	infoItemEffect.type = p.readUnsignedByte();
            	infoItemEffect.id = p.readUnsignedShort();
            	infoItemEffect.value = p.readUnsignedInt();
            			dataSocketInfo.fixEffectList.push(infoItemEffect)
      	       }
						dataSocketInfo.skillList = [];
                for(var n:int = 0; n < 3; n++){
							dataSocketInfo.skillList.push(p.readUnsignedShort());
      	       }
					quizRankInfo.item.socketList.push(dataSocketInfo);
				}
				quizRankInfo.item.fixEffectList = [];
                for(var x:int = 0; x < 5; x++){
					var dataItemEffect:ItemEffect = new ItemEffect()
            		dataItemEffect.type = p.readUnsignedByte();
            		dataItemEffect.id = p.readUnsignedShort();
            		dataItemEffect.value = p.readUnsignedInt();
					quizRankInfo.item.fixEffectList.push(dataItemEffect);
				}
				quizRankInfo.item.randEffectList = [];
                for(var y:int = 0; y < 5; y++){
					var dataItemEffect:ItemEffect = new ItemEffect()
            		dataItemEffect.type = p.readUnsignedByte();
            		dataItemEffect.id = p.readUnsignedShort();
            		dataItemEffect.value = p.readUnsignedInt();
					quizRankInfo.item.randEffectList.push(dataItemEffect);
				}
				quizRankInfo.item.growEffectList = [];
                for(var z:int = 0; z < 5; z++){
					var dataItemEffect:ItemEffect = new ItemEffect()
            		dataItemEffect.type = p.readUnsignedByte();
            		dataItemEffect.id = p.readUnsignedShort();
            		dataItemEffect.value = p.readUnsignedInt();
					quizRankInfo.item.growEffectList.push(dataItemEffect);
				}
				quizRankInfo.item.skillList = [];
                for(var a:int = 0; a < 3; a++){
					quizRankInfo.item.skillList.push(p.readUnsignedShort());
				}
                quizRankInfo.gold = p.readUnsignedInt();
                infoList.push(quizRankInfo);
            }
        }
    }
}