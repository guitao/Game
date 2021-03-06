package com.yo.framework.objects.movement
{
    import com.yo.framework.core.FP;
    import com.yo.framework.objects.entity.BaseEntity;
    import com.yo.framework.objects.entity.MovingEntity;
    
    import flash.events.Event;
    import flash.geom.Point;
    
    public class TargetMovement extends Movement
    {
        private var _target:BaseEntity;
		
        private var _dist:Number;
		
        private var _angle:Number;
		
        private var _delta:Point;
        
        public function TargetMovement(owner:MovingEntity, target:BaseEntity, delta:Point)
        {
            super(owner);
            _target = target;
            _delta = delta;
            
//            _target.addEventListener(EntityEvent.REMOVED, onTargetDispose);
        }
        
        protected function onTargetDispose(event:Event):void
        {
//            _target.removeEventListener(EntityEvent.REMOVED, onTargetDispose);
            dispatchEvent(new MovementEvent(MovementEvent.ARRIVED));
        }
        
        private function _isArrived():Boolean {
            return _dist <= (_owner.speed / FP.frameRate);
        }
        
        private function _getTargetX():Number {
            return _target.position.x + _delta.x;
        }
        
        private function _getTargetY():Number {
            return _target.position.y + _delta.y;
        }
        
        override public function update():void {
            var distX:Number = _getTargetX() - _owner.position.x;
            var distY:Number = _getTargetY() - _owner.position.y;
            _dist = Math.sqrt(Math.pow(distX, 2) + Math.pow(distY, 2));
            _angle = Math.atan2(distY, distX);
            
            if(_isArrived())
			{
				_owner.position.x = _getTargetX();
				_owner.position.y = _getTargetY();
				_owner.stop();
				dispatchEvent(new MovementEvent(MovementEvent.ARRIVED));
            }else{
				_owner.move(_angle);
            }
        }
    }
}