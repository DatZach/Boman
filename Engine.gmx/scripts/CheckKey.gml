/// CheckKey(specific_key, event);

{
    specific_key = argument0;
    event = argument1;
    
    switch (event) {
        case E_PRESS:
            return keyboard_check_pressed(specific_key);
        
        case E_DOWN:
            return keyboard_check(specific_key);

        case E_RELEASE:
          return keyboard_check_released(specific_key);

        default:
            assert("Unable to handle unrecognized event: " + string(event));
            break;
    }
}
