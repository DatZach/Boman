/// GuiGetShowKeyCount()
/// Returns true/false for if we should show the key count in the HUD

{
    var metadata = GetCurrentRoom();
    return HasFlag(metadata[? 'flags'], RoomFlags.Dungeon);
}

