/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 角色信息
     */
    public class MainUserData
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
         * 称号
         */
        public var captionName:String;

        /**
         * 账号ID
         */
        public var accid:uint;

        /**
         * 种族 1,2,3
         */
        public var type:uint;

        /**
         * 等级
         */
        public var level:uint;

        /**
         * 性别 1男 2女
         */
        public var sex:uint;

        /**
         * 状态
         */
        public var state:uint;

        /**
         * 角色掩码
         */
        public var bitMask:uint;

        /**
         * 当前经验值
         */
        public var exp:uint;

        /**
         * 声望
         */
        public var reputation:uint;

        /**
         * 胜利次数
         */
        public var winWars:uint;

        /**
         * 逃跑次数
         */
        public var flees:uint;

        /**
         * 战斗总次数
         */
        public var allWars:uint;

        /**
         * 禁言到期的时间
         */
        public var forbidTalk:uint;

        /**
         * 在线时间统计
         */
        public var onlineTime:uint;

        /**
         * 上次下线时间
         */
        public var offlineTime:uint;

        /**
         * 钱啊
         */
        public var money:uint;

        /**
         * 金币
         */
        public var gold:uint;

        /**
         * 礼券
         */
        public var ticket:uint;

        /**
         * 魂精
         */
        public var soulPoint:uint;

        /**
         * 噬魂能量
         */
        public var soulEnergy:uint;

        /**
         * 精力点
         */
        public var vigour:uint;

        /**
         * 精力点上限
         */
        public var maxVigour:uint;

        /**
         * vip
         */
        public var vip:uint;

        /**
         * 账号权限
         */
        public var accPriv:uint;

        /**
         * 公会id
         */
        public var unionID:uint;

        /**
         * 公会名称
         */
        public var unionName:String;

        /**
         * 站街地图场景ID
         */
        public var cityID:uint;

        /**
         * 站街坐标
         */
        public var x:uint;

        /**
         * 站街坐标
         */
        public var y:uint;

        /**
         * 完成的引导ID
         */
        public var guide:uint;

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
         * 当日获得经验
         */
        public var dayObtainExp:uint;

        /**
         * 0不 1防沉迷
         */
        public var isAntiAddiction:uint;

        /**
         * 剩余购买精力点数量
         */
        public var buyVigourLeft:uint;

    }
}