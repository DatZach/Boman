/// @description  Set vine on fire if arrow is on fire

if (other.statusEffect == global.ITEM_Lantern &&
    (other.hspd != 0 || other.vspd != 0))
{
    event_user(0);
}

