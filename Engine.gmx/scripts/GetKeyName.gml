/// GetKeyName(key);
/// Returns a human-readable name for a key binding

{
    var key = argument0;
    
    if (key >= ord('!') && key <= ord('~'))
        return chr(key);
    else
    {
        switch(key)
        {
            case vk_space:          return 'space';
            case vk_nokey:          return 'no key';
            case vk_anykey:         return 'any key';
            case vk_left:           return 'left arrow';
            case vk_right:          return 'right arrow';
            case vk_up:             return 'up arrow';
            case vk_down:           return 'down arrow';
            case vk_enter:          return 'return';
            case vk_escape:         return 'escape';
            case vk_shift:          return 'shift';
            case vk_control:        return 'control';
            case vk_alt:            return 'alt';
            case vk_backspace:      return 'backspace';
            case vk_tab:            return 'tab';
            case vk_home:           return 'home';
            case vk_end:            return 'end';
            case vk_delete:         return 'delete';
            case vk_insert:         return 'insert';
            case vk_pageup:         return 'page up';
            case vk_pagedown:       return 'page down';
            case vk_pause:          return 'pause';
            case vk_printscreen:    return 'print screen';
            case vk_f1:             return 'f1';
            case vk_f2:             return 'f2';
            case vk_f3:             return 'f3';
            case vk_f4:             return 'f4';
            case vk_f5:             return 'f5';
            case vk_f6:             return 'f6';
            case vk_f7:             return 'f7';
            case vk_f8:             return 'f8';
            case vk_f9:             return 'f9';
            case vk_f10:            return 'f10';
            case vk_f11:            return 'f11';
            case vk_f12:            return 'f12';
            case vk_numpad0:        return 'numpad 0';
            case vk_numpad1:        return 'numpad 1';
            case vk_numpad2:        return 'numpad 2';
            case vk_numpad3:        return 'numpad 3';
            case vk_numpad4:        return 'numpad 4';
            case vk_numpad5:        return 'numpad 5';
            case vk_numpad6:        return 'numpad 6';
            case vk_numpad7:        return 'numpad 7';
            case vk_numpad8:        return 'numpad 8';
            case vk_numpad9:        return 'numpad 9';
            case vk_multiply:       return 'numpad *';
            case vk_divide:         return 'numpad /';
            case vk_add:            return 'numpad +';
            case vk_subtract:       return 'numpad -';
            case vk_decimal:        return 'numpad .';
        }
    }
    
    return 'unknown';
}

