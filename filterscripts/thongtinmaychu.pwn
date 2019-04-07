#include <a_samp>

#if defined FILTERSCRIPT

#define COLOR_GREEN 0x15FF00AA

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" ");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/thongtinmaychu", cmdtext, true, 10) == 0)
	{
	    new string [944];
	    new giveid;
 		strcat(string, "{15FF00}Trang web:{FFFFFF}www.playcnr.com\n");
		strcat(string, "{15FF00}Forum:{FFFFFF}diendan.playcnr.com\n");
		strcat(string, "{15FF00}Fanpage{FFFFFF}fb.com/copandrobber\n");
		strcat(string, "{15FF00}Group{FFFFFF}fb.com/groups/cnrvn\n");
		strcat(string, "\n\n");
		ShowPlayerDialog(giveid, 44, DIALOG_STYLE_MSGBOX, "Thong tin may chu", string, "OK", "");
		return 1;
	}
	return 0;
}
