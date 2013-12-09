/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.response.home
{
    import com.yile.framework.net.IResponse;
    import net.vo.*;
    import com.yo.net.Packet;

    /*@import*/

    /**
     * 训练栏信息(15:6)
     */
    public class TrainHeroListResponse implements IResponse
    {
        /**
         * 数量
         */
        public var num:uint;

        /**
         * 栏位信息
         */
        public var infoList:Array /* of TrainHeroBase */;

        public function read(p:Packet):void
        {

            num = p.readUnsignedShort();
			infoList = [];
            for(var i:int = 0; i < num; i++){
                var trainHeroBase:TrainHeroBase = new TrainHeroBase();
                trainHeroBase.id = p.readUnsignedShort();
                trainHeroBase.state = p.readUnsignedByte();
                trainHeroBase.heroID = p.readUnsignedInt();
                trainHeroBase.startTime = p.readUnsignedInt();
                trainHeroBase.endTime = p.readUnsignedInt();
                infoList.push(trainHeroBase);
            }
        }
    }
}