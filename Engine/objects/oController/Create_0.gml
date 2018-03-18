/// @description  Initialize Debug Console

// Never allow more than 1 controller to exist
if (instance_number(oController) > 1)
{
    instance_destroy();
    exit;
}

global.DBG_ShowAABB = false;
global.DBG_ShowHP = false;
global.DBG_NoClip = false;

debugConsole = ConsoleCreate();

// Commands
ConsoleAddCommand(debugConsole, "echo", DBG_Echo);
ConsoleAddCommand(debugConsole, "spawn-test-mobs", DBG_SpawnTestMob);
ConsoleAddCommand(debugConsole, "dbgo", DBG_ToggleDebugOverlay);
ConsoleAddCommand(debugConsole, "nr", DBG_GotoNextRoom);
ConsoleAddCommand(debugConsole, "pr", DBG_GotoPreviousRoom);
ConsoleAddCommand(debugConsole, "rr", DBG_RestartRoom);
ConsoleAddCommand(debugConsole, "aabb", DBG_ToggleAABB);
ConsoleAddCommand(debugConsole, "maxstats", DBG_MaxStats);
ConsoleAddCommand(debugConsole, "toggle-hp", DBG_ToggleShowHP);
ConsoleAddCommand(debugConsole, "nc", DBG_ToggleNoClip);
ConsoleAddCommand(debugConsole, "kill-player", DBG_KillPlayer);


