﻿package com.yo.framework.utils
{
	import flash.display.Graphics;
	import flash.geom.Point;
	
	/**
	 * A basic 2-dimensional vector class.
	 */
	public class Vector2D
	{
		public var x:Number;
        public var y:Number;
//        public static var pool:ObjectPool = new ObjectPool(true);
//		
//        {
//            pool.allocate(100, Vector2D);
//        }
		/**
		 * Constructor.
		 */
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			this.x = x;
            this.y = y;
		}
        
		public function set(x:Number = 0, y:Number = 0):void {
			this.x = x;
			this.y = y;
		}
		
        public static function create(x:Number = 0, y:Number = 0):Vector2D {
//            var v:Vector2D = pool.object;
//            v.x = x;
//            v.y = y;
            var v:Vector2D = new Vector2D(x, y);
            return v;
        }
        
        public function dispose():void {
//            pool.object = this;
        }
		
        public function toPoint():Point {
            return new Point(x, y);
        }
		/**
		 * Can be used to visualize the vector. Generally used for debug purposes only.
		 * @param graphics The Graphics instance to draw the vector on.
		 * @param color The color of the line used to represent the vector.
		 */
		public function draw(graphics:Graphics, color:uint = 0):void
		{
			graphics.lineStyle(0, color);
			graphics.moveTo(0, 0);
			graphics.lineTo(x, y);
		}
		
		/**
		 * Generates a copy of this vector.
		 * @return Vector2D A copy of this vector.
		 */
		public function clone():Vector2D
		{
			return new Vector2D(x, y);
		}
		
		/**
		 * Sets this vector's x and y values, and thus length, to zero.
		 * @return Vector2D A reference to this vector.
		 */
		public function zero():Vector2D
		{
			x = 0;
			y = 0;
			return this;
		}
		
		/**
		 * Whether or not this vector is equal to zero, i.e. its x, y, and length are zero.
		 * @return Boolean True if vector is zero, otherwise false.
		 */
		public function isZero():Boolean
		{
			return x == 0 && y == 0;
		}
		
		/**
		 * Sets / gets the length or magnitude of this vector. Changing the length will change the x and y but not the angle of this vector.
		 */
		public function set length(value:Number):void
		{
			var a:Number = angle;
			x = Math.cos(a) * value;
			y = Math.sin(a) * value;
		}
		public function get length():Number
		{
			return Math.sqrt(lengthSQ);
		}
		
		/**
		 * Gets the length of this vector, squared.
		 */
		public function get lengthSQ():Number
		{
			return x * x + y * y;
		}
		
		/**
		 * Gets / sets the angle of this vector. Changing the angle changes the x and y but retains the same length.
		 */
		public function set angle(value:Number):void
		{
			var len:Number = length;
			x = Math.cos(value) * len;
			y = Math.sin(value) * len;
		}
		public function get angle():Number
		{
			return Math.atan2(y, x);
		}
		
		/**
		 * Normalizes this vector. Equivalent to setting the length to one, but more efficient.
		 * @return Vector2D A reference to this vector. 
		 */
		public function normalize():Vector2D
		{
			if(length == 0)
			{
				x = 1;
				return this;
			}
			var len:Number = length;
			x /= len;
			y /= len;
			return this;
		}
		
		/**
		 * Ensures the length of the vector is no longer than the given value.
		 * @param max The maximum value this vector should be. If length is larger than max, it will be truncated to this value.
		 * @return Vector2D A reference to this vector.
		 */
		public function truncate(max:Number):Vector2D
		{
			length = Math.min(max, length);
			return this;
		}
		
		/**
		 * Reverses the direction of this vector.
		 * @return Vector2D A reference to this vector.
		 */
		public function reverse():Vector2D
		{
			x = -x;
			y = -y;
			return this;
		}
		
		/**
		 * Whether or not this vector is normalized, i.e. its length is equal to one.
		 * @return Boolean True if length is one, otherwise false.
		 */
		public function isNormalized():Boolean
		{
			return length == 1.0;
		}
		
		/**
		 * Calculates the dot product of this vector and another given vector.
		 * @param v2 Another Vector2D instance.
		 * @return Number The dot product of this vector and the one passed in as a parameter.
		 */
		public function dotProd(v2:Vector2D):Number
		{
			return x * v2.x + y * v2.y;
		}
		
		/**
		 * Calculates the cross product of this vector and another given vector.
		 * @param v2 Another Vector2D instance.
		 * @return Number The cross product of this vector and the one passed in as a parameter.
		 */
		public function crossProd(v2:Vector2D):Number
		{
			return x * v2.y - y * v2.x;
		}
		
		/**
		 * Calculates the angle between two vectors.
		 * @param v1 The first Vector2D instance.
		 * @param v2 The second Vector2D instance.
		 * @return Number the angle between the two given vectors.
		 */
		public static function angleBetween(v1:Vector2D, v2:Vector2D):Number
		{
			if(!v1.isNormalized()) v1 = v1.clone().normalize();
			if(!v2.isNormalized()) v2 = v2.clone().normalize();
			return Math.acos(v1.dotProd(v2));
		}
		
		/**
		 * Determines if a given vector is to the right or left of this vector.
		 * @return int If to the left, returns -1. If to the right, +1.
		 */
		public function sign(v2:Vector2D):int
		{
			return perp.dotProd(v2) < 0 ? -1 : 1;
		}
		
		/**
		 * Finds a vector that is perpendicular to this vector.
		 * @return Vector2D A vector that is perpendicular to this vector.
		 */
		public function get perp():Vector2D
		{
			return new Vector2D(-y, x);
		}
		
		/**
		 * Calculates the distance from this vector to another given vector.
		 * @param v2 A Vector2D instance.
		 * @return Number The distance from this vector to the vector passed as a parameter.
		 */
		public function dist(v2:Vector2D):Number
		{
			return Math.sqrt(distSQ(v2));
		}
		
		/**
		 * Calculates the distance squared from this vector to another given vector.
		 * @param v2 A Vector2D instance.
		 * @return Number The distance squared from this vector to the vector passed as a parameter.
		 */
		public function distSQ(v2:Vector2D):Number
		{
			var dx:Number = v2.x - x;
			var dy:Number = v2.y - y;
			return dx * dx + dy * dy;
		}
		
		/**
		 * Adds a vector to this vector, creating a new Vector2D instance to hold the result.
		 * @param v2 A Vector2D instance.
		 * @return Vector2D A new vector containing the results of the addition.
		 */
		public function add(v2:Vector2D):Vector2D
		{
			return Vector2D.create(x + v2.x, y + v2.y);
		}
		
		/**
		 * Subtacts a vector to this vector, creating a new Vector2D instance to hold the result.
		 * @param v2 A Vector2D instance.
		 * @return Vector2D A new vector containing the results of the subtraction.
		 */
		public function subtract(v2:Vector2D):Vector2D
		{
			return Vector2D.create(x - v2.x, y - v2.y);
		}
		
		/**
		 * Multiplies this vector by a value, creating a new Vector2D instance to hold the result.
		 * @param v2 A Vector2D instance.
		 * @return Vector2D A new vector containing the results of the multiplication.
		 */
		public function multiply(value:Number):Vector2D
		{
			return Vector2D.create(x * value, y * value);
		}
		
		/**
		 * Divides this vector by a value, creating a new Vector2D instance to hold the result.
		 * @param v2 A Vector2D instance.
		 * @return Vector2D A new vector containing the results of the division.
		 */
		public function divide(value:Number):Vector2D
		{
			return Vector2D.create(x / value, y / value);
		}
		
		/**
		 * Indicates whether this vector and another Vector2D instance are equal in value.
		 * @param v2 A Vector2D instance.
		 * @return Boolean True if the other vector is equal to this one, false if not.
		 */
		public function equals(v2:Vector2D):Boolean
		{
			return x == v2.x && y == v2.y;
		}
		
		/**
		 * Generates a string representation of this vector.
		 * @return String A description of this vector.
		 */
		public function toString():String
		{
			return "[Vector2D (x:" + x + ", y:" + y + ")]";
		}
	}
}
