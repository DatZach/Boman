/// ConsoleGetUnseenHistoryCount(console);

{
    var console = argument0;
    return ds_list_size(console[? 'history']) - console[? 'seen-history'];
}

