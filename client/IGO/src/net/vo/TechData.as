/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 地图中的科技信息
     */
    public class TechData
    {
        /**
         * 科技ID
         */
        public var baseID:uint;

        /**
         * 当前状态 0未激活 1激活未建造 2以建造
         */
        public var state:uint;

        /**
         * 科技等级
         */
        public var techLevel:uint;

        /**
         * 升级需要的资源
         */
        public var needResource:uint;

        /**
         * 建造所需时间
         */
        public var duration:uint;

    }
}