// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -50000; // oController
global.__objectDepths[1] = -20000; // oCursor
global.__objectDepths[2] = -50000; // oHud
global.__objectDepths[3] = -50001; // oDialogue
global.__objectDepths[4] = -50002; // oShop
global.__objectDepths[5] = -49999; // oAreaToast
global.__objectDepths[6] = -50001; // oDeathOverlay
global.__objectDepths[7] = -49999; // oCheckpointToast
global.__objectDepths[8] = -49999; // oTeleportOverlay
global.__objectDepths[9] = -50010; // oPauseMenu
global.__objectDepths[10] = -2; // oWeaponBomb
global.__objectDepths[11] = -1; // oPlayer
global.__objectDepths[12] = -10; // oArrow
global.__objectDepths[13] = 0; // pPlatformingEntity
global.__objectDepths[14] = 0; // pStaticSolid
global.__objectDepths[15] = 0; // pDynamicSolid
global.__objectDepths[16] = 0; // pPlatformingSolid
global.__objectDepths[17] = 0; // pJumpThrough
global.__objectDepths[18] = 0; // pClimbable
global.__objectDepths[19] = 10000; // oDBGUnevenBlock
global.__objectDepths[20] = 10000; // oDBGLadder
global.__objectDepths[21] = 10000; // oDBGMovingBlock
global.__objectDepths[22] = 10000; // oDBGPlatformingBlock
global.__objectDepths[23] = 0; // pPhysicsEntity
global.__objectDepths[24] = 10000; // oBlock
global.__objectDepths[25] = 10000; // oSlope
global.__objectDepths[26] = 10000; // oJumpThroughBlock
global.__objectDepths[27] = 0; // pMob
global.__objectDepths[28] = 0; // oMobPerson
global.__objectDepths[29] = 0; // oMobTurtle
global.__objectDepths[30] = 0; // pPuzzleElement
global.__objectDepths[31] = -1; // oTarget
global.__objectDepths[32] = 0; // oFloorSwitch
global.__objectDepths[33] = 10000; // oDoor
global.__objectDepths[34] = -15; // oArrowSegment
global.__objectDepths[35] = -15; // oGoldCoin
global.__objectDepths[36] = -16; // oItem
global.__objectDepths[37] = 1; // oSignPost
global.__objectDepths[38] = 1; // oChest
global.__objectDepths[39] = 10; // oVine
global.__objectDepths[40] = 11; // oLayerDoor
global.__objectDepths[41] = 0; // oRockWall
global.__objectDepths[42] = 1; // oShrine
global.__objectDepths[43] = 1; // oAreaCheckpoint
global.__objectDepths[44] = 0; // oFxDBGMobSmokeEmitter
global.__objectDepths[45] = -500; // oFxSmoke
global.__objectDepths[46] = -500; // oFxFlameEmitter


global.__objectNames[0] = "oController";
global.__objectNames[1] = "oCursor";
global.__objectNames[2] = "oHud";
global.__objectNames[3] = "oDialogue";
global.__objectNames[4] = "oShop";
global.__objectNames[5] = "oAreaToast";
global.__objectNames[6] = "oDeathOverlay";
global.__objectNames[7] = "oCheckpointToast";
global.__objectNames[8] = "oTeleportOverlay";
global.__objectNames[9] = "oPauseMenu";
global.__objectNames[10] = "oWeaponBomb";
global.__objectNames[11] = "oPlayer";
global.__objectNames[12] = "oArrow";
global.__objectNames[13] = "pPlatformingEntity";
global.__objectNames[14] = "pStaticSolid";
global.__objectNames[15] = "pDynamicSolid";
global.__objectNames[16] = "pPlatformingSolid";
global.__objectNames[17] = "pJumpThrough";
global.__objectNames[18] = "pClimbable";
global.__objectNames[19] = "oDBGUnevenBlock";
global.__objectNames[20] = "oDBGLadder";
global.__objectNames[21] = "oDBGMovingBlock";
global.__objectNames[22] = "oDBGPlatformingBlock";
global.__objectNames[23] = "pPhysicsEntity";
global.__objectNames[24] = "oBlock";
global.__objectNames[25] = "oSlope";
global.__objectNames[26] = "oJumpThroughBlock";
global.__objectNames[27] = "pMob";
global.__objectNames[28] = "oMobPerson";
global.__objectNames[29] = "oMobTurtle";
global.__objectNames[30] = "pPuzzleElement";
global.__objectNames[31] = "oTarget";
global.__objectNames[32] = "oFloorSwitch";
global.__objectNames[33] = "oDoor";
global.__objectNames[34] = "oArrowSegment";
global.__objectNames[35] = "oGoldCoin";
global.__objectNames[36] = "oItem";
global.__objectNames[37] = "oSignPost";
global.__objectNames[38] = "oChest";
global.__objectNames[39] = "oVine";
global.__objectNames[40] = "oLayerDoor";
global.__objectNames[41] = "oRockWall";
global.__objectNames[42] = "oShrine";
global.__objectNames[43] = "oAreaCheckpoint";
global.__objectNames[44] = "oFxDBGMobSmokeEmitter";
global.__objectNames[45] = "oFxSmoke";
global.__objectNames[46] = "oFxFlameEmitter";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for