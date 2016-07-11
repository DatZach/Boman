/// CreateShop(side, portrait, name, backdrop, intro);

{
    var inst = instance_create(0, 0, oShop);
    inst.dialogue = CreateDialogue(argument3);
    inst.side = argument0;
    inst.portrait = argument1;
    inst.name = argument2;
    inst.items = ds_list_create();
    inst.talk = ds_list_create();

    if (argument4 != '')
    {
        AddDialogue(
            inst.dialogue, inst.side, inst.portrait, inst.name,
            argument4
        );
    }
    
    with(inst)
        event_user(0);
        
    return inst;
}

