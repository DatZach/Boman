/// SpawnGold(x, y, maxCoins, averageValue);

{
    var xx = argument0;
    var yy = argument1;
    var maxCoins = argument2;
    var averageValue = argument3;
    
    maxCoins = max(1, irandom(maxCoins));
    repeat(maxCoins)
    {
        var dev = floor(averageValue * 0.25);
        var inst = instance_create(xx, yy, oGoldCoin);
        inst.value = irandom_range(averageValue - dev, averageValue + dev);
    }
}
