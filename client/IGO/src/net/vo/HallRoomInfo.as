/**
 * Copyright (c) 2012, www.yile.com All rights reserved.
 */
package net.vo
{
    /*@import*/
    /**
     * 房间信息
     */
    public class HallRoomInfo
    {
        /**
         * 房间id
         */
        public var roomID:uint;

        /**
         * 房间名称
         */
        public var name:String;

        /**
         * 需要等级
         */
        public var needLevel:uint;

        /**
         * 游戏模式
         */
        public var mode:uint;

        /**
         * 当前人数
         */
        public var curPlayers:uint;

        /**
         * 最大游戏人数
         */
        public var maxPlayers:uint;

        /**
         *  房主ID
         */
        public var owner:uint;

        /**
         * 房间状态0等待 1开始游戏 2隐藏 3销毁
         */
        public var state:uint;

        /**
         * 地图场景id
         */
        public var sceneID:uint;

        /**
         * 进入副本类型 0,1
         */
        public var loginType:uint;

    }
}