#include <a_samp>

#define FILTERSCRIPT
#define COLOR_LIGHTRED 0xFF6347FF

public OnFilterScriptInit()
{
        print("\n--------------------------------------");
        print(" ");
        print("--------------------------------------\n");
        return 1;
}

public OnFilterScriptExit()
{
        print("\n--------------------------------------");
        print(" ");
        print("--------------------------------------\n");
        return 1;
}

public OnPlayerConnect(playerid)
{
        new name[MAX_PLAYER_NAME+1], string[24+MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, name, sizeof(name));
        // Has numbers
        if(strfind(name, "0", true) != -1 || strfind(name, "1", true) != -1 || strfind(name, "2", true) != -1 || strfind(name, "3", true) != -1 || strfind(name, "4", true) != -1 || strfind(name, "5", true) != -1
        || strfind(name, "6", true) != -1 || strfind(name, "7", true) != -1 || strfind(name, "8", true) != -1 || strfind(name, "9", true) != -1 || strfind(name, "[", true) != -1 || strfind(name, "]", true) != -1)
        {
                SendClientMessage(playerid, COLOR_LIGHTRED, "SERVER: {FFFFFF}Vui long dat ten theo dang Ho_Ten.");
                SendClientMessage(playerid, COLOR_LIGHTRED, "SERVER: {FFFFFF}Vi du: Le_Song_Vi, Song_Vi.");
        new name[MAX_PLAYER_NAME+1], string[24+MAX_PLAYER_NAME+1];
        GetPlayerName(playerid, name, sizeof(name));
                format(string, sizeof(string), "%s da bi kick khoi may chu - Ten khong hop le.", name);
        SendClientMessageToAll(0xC4C4C4FF, string);
                Kick(playerid);
        }
        // No Underscore
        if(strfind( name, "_", true) == -1)
        {
                SendClientMessage(playerid, COLOR_LIGHTRED, "SERVER: {FFFFFF}Vui long dat ten theo dang Ho_Ten.");
        format(string, sizeof(string), "%s da bi kick khoi may chu - Ten khong hop le.", name);
        SendClientMessageToAll(0xC4C4C4FF, string);
                Kick(playerid);
        }
        return 1;
}
