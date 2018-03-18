/// @description  ConsoleDraw(console);
/// @function  ConsoleDraw
/// @param console
{
    var HISTORY_BACKLOG = 8;
    
    var console = argument0;

    var unseenHistory = ConsoleGetUnseenHistoryCount(console);
    if (unseenHistory > 0)
    {
        var OFFSET = 12;
        
        draw_set_font(fDialogue);
        var badgeWidth = max(12, string_width(string_hash_to_newline(string(unseenHistory))));
        var badgeHeight = string_height(string_hash_to_newline("M"));
        
        draw_set_color(c_black);
        draw_roundrect_ext(
            OFFSET, OFFSET,
            OFFSET + badgeWidth + 128,
            OFFSET + badgeHeight + 4,
            12, 12,
            false
        )
        
        draw_set_color(c_white);
        draw_roundrect_ext(
            OFFSET + 2,
            OFFSET + 2,
            OFFSET + 4 + badgeWidth,
            OFFSET + badgeHeight + 2,
            12, 12,
            false
        );
        
        draw_set_color(c_black);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(
            OFFSET + 2 + badgeWidth / 2,
            OFFSET + 2 + badgeHeight / 2,
            string_hash_to_newline(string(unseenHistory))
        );
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        
        draw_set_color(c_white);
        draw_set_valign(fa_middle);
        draw_text(
            OFFSET + 4 + badgeWidth + 4,
            OFFSET + badgeHeight / 2 + 1,
            string_hash_to_newline("Unseen Messages")
        );
        draw_set_valign(fa_top);
        
        return 0;
    }
    
    if (!console[? "active"])
        return 0;
        
    var historyBottom = string_height(string_hash_to_newline("W")) * HISTORY_BACKLOG + 8 + 8;
    var consoleBottom = historyBottom + 8 + 8;
        
    // Background
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, window_get_width(), consoleBottom, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_line(0, historyBottom, window_get_width(), historyBottom);

    // Command line
    draw_text(8, historyBottom - string_height(string_hash_to_newline("W")), string_hash_to_newline("# " + keyboard_string));
    
    // History
    var history = console[? "history"];
    for(var i = 0, j = ds_list_size(history); i < j && i < HISTORY_BACKLOG; ++i)
    {
        var yy = historyBottom - i * string_height(string_hash_to_newline("W")) - 8 - string_height(string_hash_to_newline("W"));
        draw_text(8, yy, string_hash_to_newline(history[| j - i - 1]));
    }
    
    return 1;
}
