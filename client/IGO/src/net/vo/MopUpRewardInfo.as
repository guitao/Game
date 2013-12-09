/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 扫荡奖励信息
     */
    public class MopUpRewardInfo
    {
        /**
         * 副本ID
         */
        public var sceneID:uint;

        /**
         * 经验奖励
         */
        public var expReward:uint;

        /**
         * 金币奖励
         */
        public var goldReward:uint;

        /**
         * 出战英雄经验奖励
         */
        public var heroExpReward:uint;

        /**
         *  获得道具数量
         */
        public var num:uint;

        /**
         * 道具信息
         */
        public var infoList:Array /* of ItemNumInfo */;

    }
}