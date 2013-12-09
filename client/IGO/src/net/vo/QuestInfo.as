/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 任务信息
     */
    public class QuestInfo
    {
        /**
         * 任务ID
         */
        public var id:uint;

        /**
         * 任务条件数量
         */
        public var num:uint;

        /**
         * 任务条件完成量信息
         */
        public var infoList:Array /* of QuestValueInfo */;

    }
}