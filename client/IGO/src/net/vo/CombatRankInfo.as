/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 战斗力排行信息
     */
    public class CombatRankInfo
    {
        /**
         * 用户ID
         */
        public var userID:uint;

        /**
         * 姓名
         */
        public var nickName:String;

        /**
         * 战斗力数值
         */
        public var combat:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * 本次排名
         */
        public var curPostion:uint;

        /**
         * 上次排名
         */
        public var lastPostion:uint;

    }
}