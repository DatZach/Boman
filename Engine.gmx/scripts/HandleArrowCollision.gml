/// HandleArrowCollision(inst)
/// Only call from oArrow

/*
 *  Scoped Variables
 *  inst                    : Instance that we collided with
 *  initialCollision        : Indicates if this is the first time we're colliding
 */

{
    // ARGUMENTS
    var inst = argument0;
    
    show_debug_message('Arrow collision!');
    
    // HANDLE BREAK ON COLLISION
    var shouldBreak = false;
    
    shouldBreak = shouldBreak || (initialCollision && inst.hardSurface && irandom(100) > 60);
    shouldBreak = shouldBreak || statusEffect == global.ITEM_Bomb;
    shouldBreak = shouldBreak && !place_meeting(x, y, oTarget);
    
    if (shouldBreak)
    {
        repeat(irandom(3))
            instance_create(x, y, oArrowSegment);
            
        instance_destroy();
        exit;
    }
    
    // HANDLE ATTACHMENTS
    var canAttach =  object_is_ancestor(inst.object_index, pPlatformingEntity)
                  || object_is_ancestor(inst.object_index, pDynamicSolid);
    
    if (canAttach)
    {
        show_debug_message('Attached to ' + string(inst));
        attachedEntity = inst;
    }
    
    // HANDLE MOB COLLISION
    if (object_is_ancestor(inst.object_index, pMob))
    {
        with(inst)
        {
            if (MobAddHp(-1, self))
                Knockback(other.x, other.y, 4);
                
            if (other.fireActive && other.statusEffect == global.ITEM_Lantern)
            {
                event_user(1);
            }
        }
    }
    
    // DISABLE FIRE STATUS EFFECT AFTER 1 SECOND
    alarm[0] = room_speed;
    
    // UNSET INITIAL COLLISION
    initialCollision = false;
}

