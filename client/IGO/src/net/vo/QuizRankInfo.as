/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 答题竞赛奖励
     */
    public class QuizRankInfo
    {
        /**
         * 玩家ID
         */
        public var id:uint;

        /**
         * 玩家名称
         */
        public var name:String;

        /**
         * 得分
         */
        public var score:uint;

        /**
         * 排名
         */
        public var rank:uint;

        /**
         * 道具奖励
         */
        public var item:ItemInfo;

        /**
         * 游戏币
         */
        public var gold:uint;

    }
}