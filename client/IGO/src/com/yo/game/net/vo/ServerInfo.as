/**
 * Copyright (c) 2012, www.yo.com All rights reserved.
 */
package com.yo.game.net.vo
{
    /*@import*/
    /**
     * 服务器信息
     */
    public class ServerInfo
    {
        /**
         * 服务器id
         */
        public var serverID:uint;

        /**
         * 服务器类型
         */
        public var serverType:uint;

        /**
         * 名字
         */
        public var name:String;

        /**
         * 内网ip
         */
        public var ip:String;

        /**
         * 内网端口
         */
        public var port:uint;

        /**
         * 外网ip
         */
        public var extip:String;

        /**
         * 外网端口
         */
        public var extport:uint;

        /**
         * 网络类型（1电信，2网通）
         */
        public var netType:uint;

        /**
         * 最大负载
         */
        public var load:uint;

        /**
         * 当前负载
         */
        public var inuse:uint;

    }
}