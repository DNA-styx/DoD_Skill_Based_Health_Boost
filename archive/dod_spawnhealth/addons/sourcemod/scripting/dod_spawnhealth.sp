////////////////////////////////////////////////////////
//
// SourceMod Script
//
// DoD SpawnHealth
//
// Developed by FeuerSturm for the Realism Community!
//
////////////////////////////////////////////////////////
#include <sourcemod>

#define PLUGIN_VERSION "1.0"

public Plugin:myinfo = 
{
	name = "DoD SpawnHealth",
	author = "FeuerSturm",
	description = "Set player's health on Spawn",
	version = PLUGIN_VERSION,
	url = "http://www.dodsplugins.net"
}

new Handle:SpawnHealth = INVALID_HANDLE

public OnPluginStart()
{
	SpawnHealth = CreateConVar("dod_spawnhealth", "100", "<#> = set HP that players start with on spawn", FCVAR_PLUGIN, true, 1.0, true, 200.0)
	HookEventEx("player_spawn", OnPlayerSpawn, EventHookMode_Post)
}

public Action:OnPlayerSpawn(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"))
	new health = GetConVarInt(SpawnHealth)
	if(IsClientInGame(client) && IsPlayerAlive(client) && GetClientTeam(client) > 1 && health != 100)
	{
		SetEntityHealth(client, health)
	}
	return Plugin_Continue
}