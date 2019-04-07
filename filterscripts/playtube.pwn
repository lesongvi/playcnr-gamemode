#include    <a_samp>
#include    <zcmd>

#define     DIALOG_MUSIC        (100)

COMMAND:playtube(playerid,params[])
	return ShowPlayerDialog(playerid,DIALOG_MUSIC,DIALOG_STYLE_INPUT,"PlayTube by iRaiDeN", "Please input the URL of the song you want (Example: wwww.youtube.com/watch?v=VID Change the VID!)","Play","Cancel"), 1;

public OnDialogResponse(playerid,dialogid,response,listitem,inputtext[])
{
	if(dialogid == DIALOG_MUSIC)
	{
		if(!response) return 1;
		if(!strlen(inputtext)) return ShowPlayerDialog(playerid,DIALOG_MUSIC,DIALOG_STYLE_INPUT,"PlayTube by iRaiDeN", "Please input the URL of the song you want (Example: wwww.youtube.com/watch?v=VID Change the VID!)","Play","Cancel");
		if(strfind(inputtext,"www.youtube.com",true) == -1) return ShowPlayerDialog(playerid,DIALOG_MUSIC,DIALOG_STYLE_INPUT,"PlayTube by iRaiDeN", "Please input the URL of the song you want (Example: wwww.youtube.com/watch?v=VID Change the VID!)","Play","Cancel");
		new localURL[128];
		strmid(localURL,inputtext,strfind(inputtext, "v=")+2,strfind(inputtext, "v=")+19);
		new localString[128];
		format(localString, 128, "http://mwrserver.com/youtube.php?videoid=%s",localURL);
		for(new i; i != MAX_PLAYERS; i++) PlayAudioStreamForPlayer(i,localString);
	}
	return 1;
}
