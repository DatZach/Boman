/// @description  Update dialogue

// Update intensity
intensity = lerp(intensity, targetIntensity, 0.25);
if (intensity <= 0.1 && targetIntensity == 0)
    instance_destroy();
    
if (targetIntensity == 0)
    exit;

// HANDLE DIALOGUE LOGIC
var segment;
if (ds_list_empty(segments))
{
    var newSegment = ds_map_create();
        newSegment[? "type"] = 0;
        newSegment[? "text"] = "";
        newSegment[? "text-color"] = blackColor;
        newSegment[? "sprite"] = -1;
        newSegment[? "image-index"] = 0;
    ds_list_add(segments, newSegment);
    segment = newSegment;
}
else
    segment = segments[| ds_list_size(segments) - 1];

var entry = dialogue[| diagIndex];
var type = entry[? "type"];
var text = entry[? "value"];
var textLength = string_length(text);
var actionHold = CheckKey(global.k_action, E_DOWN);
var actionPress = CheckKey(global.k_action, E_PRESS);

for(var i = prevCharIndex; i < floor(charIndex); ++i)
{
    var ch = string_char_at(text, i + 1);
    if (ch == "\\")
    {
        var nch = string_char_at(text, i + 2);
        switch(nch)
        {
            case ".":
                prevCharIndex = i;
                awaitingKey = true;
                if (!actionPress)
                    exit;
                    
                charIndex += 2;
                ++i;
                break;
                
            case "z":
                if (!waiting && canWait)
                {
                    prevCharIndex = i;
                    waiting = true;
                    canWait = false;
                    alarm[2] = room_speed * 0.5;
                    exit;
                }
                else if (alarm[2] > 0)
                    exit;
                else
                {
                    canWait = true;
                    charIndex += 2;
                    ++i;
                    break;
                }
                exit;
                
            case "$":
            {
                var spriteName = "";
                var imageIndex = 0;
                i += 3;
                
                var ch;
                for(; i < textLength; ++i)
                {
                    ch = string_char_at(text, i);
                    if (ch == "$" || ch == ":")
                        break;
                    
                    spriteName += ch;
                }
                
                if (ch == ":")
                {
                    var strImageIndex = "";
                    
                    ++i;
                    for(; i < textLength; ++i)
                    {
                        ch = string_char_at(text, i);
                        if (ch == "$")
                            break;
                        
                        strImageIndex += ch;
                    }
                    
                    imageIndex = real(strImageIndex);
                }
                
                var sprIndex = asset_get_index(spriteName);
                var newSegment = ds_map_create();                   // Sprite segment
                    newSegment[? "type"] = 1;
                    newSegment[? "text"] = "";
                    newSegment[? "text-color"] = blackColor;
                    newSegment[? "sprite"] = sprIndex;
                    newSegment[? "image-index"] = imageIndex;
                ds_list_add(segments, newSegment);
                newSegment = ds_map_create();                       // Return back to text
                    newSegment[? "type"] = 0;
                    newSegment[? "text"] = "";
                    newSegment[? "text-color"] = blackColor;
                    newSegment[? "sprite"] = -1;
                    newSegment[? "image-index"] = 0;
                ds_list_add(segments, newSegment);
                segment = newSegment;
                charIndex = i;
                
                if (sprIndex == -1)
                    ConsolePrint(oController.debugConsole, concat("Unable to resolve sprite \"", spriteName, "\""));
                break;
            }
            
            case "@":
            {
                i += 3;
                var hexCode = string_copy(text, i, 6);
                i += 5;
                
                newSegment = ds_map_create();
                    newSegment[? "type"] = 0;
                    newSegment[? "text"] = "";
                    newSegment[? "text-color"] = make_color_hex(hexCode);
                    newSegment[? "sprite"] = -1;
                    newSegment[? "image-index"] = 0;
                ds_list_add(segments, newSegment);
                segment = newSegment;
                charIndex = i;
                break;
            }
            
            case "!":
            {
                i += 2;
                newSegment = ds_map_create();
                    newSegment[? "type"] = 0;
                    newSegment[? "text"] = "";
                    newSegment[? "text-color"] = blackColor;
                    newSegment[? "sprite"] = -1;
                    newSegment[? "image-index"] = 0;
                ds_list_add(segments, newSegment);
                segment = newSegment;
                charIndex = i;
                break;
            }
                
            case "0":
            case "1":
            case "2":
            case "3":
            case "4":
            case "5":
            case "6":
            case "7":
            case "8":
            case "9":
                portraitFrame[entry[? "side"]] = real(nch);
                ++i;
                break;
        }
    }
    else
    {
        segment[? "text"] += ch;
    }
}

awaitingKey = false;
prevCharIndex = floor(charIndex);

if (charIndex <= textLength)
{
    if (actionPress && doubleTap)
        charIndex = textLength;
    else
        charIndex += DIALOGUE_SPEED + DIALOGUE_SPEED * actionHold;
    
    if (actionHold)
    {
        doubleTap = true;
        alarm[1] = room_speed * 0.33;
    }
}
else if (CheckKey(global.k_action, E_PRESS))
{
    // Execute whatever script is attached to this dialogue
    var script = entry[? "script"];
    if (script != noone)
    {
        if (type == 1)
            script_execute(script, self, optionIndex);
        else
            script_execute(script);
    }
    
    // Move to next entry
    //segment = '';
    var count = ds_list_size(segments);
    for(var i = 0; i < count; ++i)
        ds_map_destroy(segments[| i]);
    ds_list_clear(segments);
    ++diagIndex;
    
    // DESTROY DIALOGUE IF WE'VE REACHED THE END
    if (diagIndex >= ds_list_size(dialogue))
    {
        targetIntensity = 0;
        exit;
    }
    
    entry = dialogue[| diagIndex];
    var side = entry[? "side"];
    portrait[side] = entry[? "portrait"];
    namePlate[side] = entry[? "name"];
    
    charIndex = 0;
    prevCharIndex = 0;
    optionIndex = 0;
    windowOffset = 0;
}

if (type == 1)
{
    if (CheckKey(global.k_down, E_PRESS))
        optionIndex += 2;
    else if (CheckKey(global.k_up, E_PRESS))
        optionIndex -= 2;
    else if (CheckKey(global.k_right, E_PRESS))
        ++optionIndex;
    else if (CheckKey(global.k_left, E_PRESS))
        --optionIndex;
    
    var count = entry[? "option-count"];
    if (optionIndex < 0)
        optionIndex = count - 1;
    else if (optionIndex >= count)
        optionIndex = 0;
    
   if (optionIndex < windowOffset)
        windowOffset -= 2;
    
    if (optionIndex >= windowOffset + 4)
        windowOffset += 2;
}


