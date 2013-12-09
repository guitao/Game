/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 训练栏位信息
     */
    public class TrainHeroBase
    {
        /**
         * 栏位ID
         */
        public var id:uint;

        /**
         * 状态 0未开启 1开启
         */
        public var state:uint;

        /**
         * 英雄ID
         */
        public var heroID:uint;

        /**
         * 开始训练时间（秒）
         */
        public var startTime:uint;

        /**
         * 结束训练时间（秒）
         */
        public var endTime:uint;

    }
}