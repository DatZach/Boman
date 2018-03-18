/// @description  Initialize Overlay

enum HudMenuTab {
    Inventory,
    KnickKnacks,
    Relics,
    Map,
    Count
}

if (instance_number(oHud) > 1)
{
    instance_destroy();
    exit;
}

// CONSTANTS
itemRubyWidth = sprite_get_width(sHudItemRuby);
itemRubyHeight = sprite_get_height(sHudItemRuby);
brokenArrowHeight = sprite_get_height(sHudBrokenArrow);
heartHeight = sprite_get_height(sHudHeart);
heartWidth = sprite_get_width(sHudHeart);
arrowWidth = sprite_get_width(sHudArrow) / 3;
goldWidth = sprite_get_width(sHudGoldPile);
goldHeight = sprite_get_height(sHudGoldPile);
keyWidth = sprite_get_width(sHudKey);
keyHeight = sprite_get_height(sHudKey);

sIOItemRuby_Width = sprite_get_width(sIOItemRuby);
sIOItemRuby_Height = sprite_get_height(sIOItemRuby);
sIOHeartContainer_Width = sprite_get_width(sIOHeartContainer);
sIOHeartContainer_Height = sprite_get_height(sIOHeartContainer);
sIOIcons_Width = sprite_get_width(sIOIcons);
sIOIcons_Height = sprite_get_height(sIOIcons);

outlineColor = make_color_rgb(107, 126, 136);
selectColor = make_color_rgb(103, 161, 219);
blackColor = make_color_rgb(28, 30, 32);
whiteColor = make_color_rgb(252, 250, 233);

// INTERACTIVE NOTIFICATION
enum InteractionIcon {
    None            = -1,
    Hand            = 0,
    UpArrow,
    DownArrow,
    View,
    Key,
    Deny
}

global.interactionIcon = InteractionIcon.None;
global.interactionText = "";

// TOAST VARIABLES
toasts = ds_list_create();

// ITEM MENU VARIABLES
itemOverlayEnabled = false;
menuTabIndex = HudMenuTab.Inventory;
itemIndex = 0;
windowOffset = 0;

// DUNGEON MAP VARIABLES
layer = 0;

intensity = 0;
targetIntensity = 0;
enabled = true;

//FxInitializeDesaturatedBlur();
display_set_gui_size(VIEW_WIDTH, VIEW_HEIGHT);


