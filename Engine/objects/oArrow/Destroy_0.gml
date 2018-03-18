/// @description  AoE / Visual FX

switch(statusEffect)
{
    case global.ITEM_Bomb:
    {
        DoBombAoE(x, y);
        FxSmoke(x, y, 12);
        break;
    }
}


