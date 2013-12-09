/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 社会关系信息
     */
    public class RelationInfo
    {
        /**
         * 玩家ID
         */
        public var userID:uint;

        /**
         * 昵称
         */
        public var nickName:String;

        /**
         * 关系类型 1好友 2黑名单
         */
        public var relationType:uint;

        /**
         * 友好度
         */
        public var degree:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 是否在线
         */
        public var state:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * 性别
         */
        public var sex:uint;

        /**
         * 是否祝福过，0未祝福 1已祝福
         */
        public var homeBless:uint;

    }
}