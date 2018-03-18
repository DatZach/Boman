/// @description  Reset active when re-entering a room

active = ShrineIsActive();

// If we enter a room with an active teleporter then we want to set our
// current checkpoint to that teleporter
if (active)
    SetCheckpoint();


