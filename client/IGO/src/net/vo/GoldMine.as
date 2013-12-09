/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 金矿信息
     */
    public class GoldMine
    {
        /**
         * 金矿id
         */
        public var baseID:uint;

        /**
         * 当前等级
         */
        public var curLevel:uint;

        /**
         * 当前每秒产量
         */
        public var curProduce:uint;

        /**
         * 当前农民数
         */
        public var curMiners:uint;

        /**
         * 当前拥有栏位数
         */
        public var curFields:uint;

        /**
         * 升级需要的资源
         */
        public var needResource:uint;

        /**
         * 建造时间
         */
        public var duration:uint;

        /**
         * 状态 0升级中 1就绪
         */
        public var state:uint;

    }
}