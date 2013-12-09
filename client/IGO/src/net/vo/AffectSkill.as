/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 英雄影响技能属性
     */
    public class AffectSkill
    {
        /**
         * 指定技能ID 0为影响全部技能
         */
        public var id:uint;

        /**
         * 类型 1按百分比减少CD 2按值减少CD 3按百分比减少消耗 4按值减少消耗 5按百分比增加伤害 6按值增加伤害
         */
        public var type:uint;

        /**
         * 影响的值
         */
        public var value:uint;

    }
}