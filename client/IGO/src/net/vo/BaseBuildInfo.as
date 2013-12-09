/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 公会基地修筑信息
     */
    public class BaseBuildInfo
    {
        /**
         * 公会ID
         */
        public var unionID:uint;

        /**
         * 角色ID
         */
        public var charID:uint;

        /**
         * 名称
         */
        public var name:String;

        /**
         * 消耗资源类型 1银币 2人民币
         */
        public var type:uint;

        /**
         * 消耗资源数量
         */
        public var money:uint;

        /**
         * 增加的公会基地经验
         */
        public var addexp:uint;

        /**
         * 增加的公会资金
         */
        public var addmoney:uint;

        /**
         * 修筑具体时间
         */
        public var time:uint;

        /**
         * 修筑周
         */
        public var week:uint;

    }
}