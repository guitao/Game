/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 角色信息
     */
    public class UserFightData
    {
        /**
         * 角色ID
         */
        public var userID:uint;

        /**
         * 昵称
         */
        public var nickName:String;

        /**
         * 称谓
         */
        public var caption:String;

        /**
         * 种族 1,2,3
         */
        public var type:uint;

        /**
         * 性别 1男 2女
         */
        public var sex:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 位置
         */
        public var pos:uint;

        /**
         * 移动速度
         */
        public var moveSpeed:uint;

        /**
         * 攻击速度
         */
        public var attackSpeed:uint;

        /**
         * 攻击距离
         */
        public var adistance:uint;

        /**
         * 视野距离
         */
        public var vision:uint;

        /**
         * 当前生命值
         */
        public var hp:uint;

        /**
         * 最大生命值
         */
        public var maxHP:uint;

        /**
         * 每秒生命值恢复
         */
        public var hpRegen:uint;

        /**
         * 当前愤怒值
         */
        public var sp:uint;

        /**
         * 最大愤怒值
         */
        public var maxSP:uint;

        /**
         * 愤怒值恢复
         */
        public var spRegen:uint;

        /**
         * 当前能量值
         */
        public var energy:uint;

        /**
         * 最大能量值
         */
        public var maxEnergy:uint;

        /**
         * 每秒能量值恢复
         */
        public var energyRegen:uint;

        /**
         * 攻击力
         */
        public var pDamage:uint;

        /**
         * 防御力
         */
        public var defence:uint;

        /**
         * 暴击伤害百分比
         */
        public var criDam:uint;

        /**
         * 暴击抗性百分比
         */
        public var criDefence:uint;

        /**
         * 暴击伤害概率
         */
        public var criDamP:uint;

        /**
         * 生命吸取
         */
        public var suck:uint;

        /**
         * 伤害反弹
         */
        public var rebound:uint;

        /**
         * 战斗力
         */
        public var combat:uint;

        /**
         * 总战斗力（包括出战英雄）
         */
        public var allCombat:uint;

        /**
         * 技能状态列表
         */
        public var statesList:Array /* of uint */;

    }
}