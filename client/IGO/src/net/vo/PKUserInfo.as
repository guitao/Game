/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 竞技场玩家信息
     */
    public class PKUserInfo
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
         * 等级
         */
        public var level:uint;

        /**
         * 性别 1男 2女
         */
        public var sex:uint;

        /**
         * 化身
         */
        public var avatarList:Array /* of uint */;

        /**
         * 排名
         */
        public var rank:uint;

        /**
         * 战斗力
         */
        public var allCombat:uint;

    }
}