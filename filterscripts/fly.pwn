#if defined (c)Copyright_2012
#endif
#include <a_samp>
#include <zcmd>
new bool:flying[MAX_PLAYERS];
forward AdminFly(playerid);
forward Float:SetPlayerToFacePos(playerid, Float:X, Float:Y);
public OnFilterScriptInit()
{
	new year,month,day;
	getdate(year, month, day);
	new hour,minute,second;
	gettime(hour,minute,second);

	printf("\n------------------------------------------------");
	printf(" ");
	printf("------------------------------------------------\n");

	printf("| DA CHAY | Ngay: %d/%d/%d | Thoi gian: %d:%d:%d |",day,month,year,hour, minute, second);
	return 1;
}

public OnFilterScriptExit()
{
	new year,month,day;
	getdate(year, month, day);
	new hour,minute,second;
	gettime(hour,minute,second);

	printf("\n------------------------------------------------");
	printf(" ");
	printf("------------------------------------------------\n");

	printf("| DA NGUNG CHAY | Ngay: %d/%d/%d | Thoi gian: %d:%d:%d |",day,month,year,hour, minute, second);
	return 1;
}

public AdminFly(playerid)
{
	if(!IsPlayerConnected(playerid))
		return flying[playerid] = false;

	if(flying[playerid])
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
			new
			    keys,
				ud,
				lr,
				Float:x[2],
				Float:y[2],
				Float:z;

			GetPlayerKeys(playerid, keys, ud, lr);
			GetPlayerVelocity(playerid, x[0], y[0], z);
			if(ud == KEY_UP)
			{
				GetPlayerCameraPos(playerid, x[0], y[0], z);
				GetPlayerCameraFrontVector(playerid, x[1], y[1], z);
    			ApplyAnimation(playerid, "SWIM", "SWIM_crawl", 4.1, 0, 1, 1, 0, 0);
				SetPlayerToFacePos(playerid, x[0] + x[1], y[0] + y[1]);
				SetPlayerVelocity(playerid, x[1], y[1], z);
			}
			else
			SetPlayerVelocity(playerid, 0.0, 0.0, 0.01);
		}
		SetTimerEx("AdminFly", 100, 0, "d", playerid);
	}
	return 0;
}

public Float:SetPlayerToFacePos(playerid, Float:X, Float:Y)
{
	new
		Float:pX1,
		Float:pY1,
		Float:pZ1,
		Float:ang;

	if(!IsPlayerConnected(playerid)) return 0.0;

	GetPlayerPos(playerid, pX1, pY1, pZ1);

	if( Y > pY1 ) ang = (-acos((X - pX1) / floatsqroot((X - pX1)*(X - pX1) + (Y - pY1)*(Y - pY1))) - 90.0);
	else if( Y < pY1 && X < pX1 ) ang = (acos((X - pX1) / floatsqroot((X - pX1)*(X - pX1) + (Y - pY1)*(Y - pY1))) - 450.0);
	else if( Y < pY1 ) ang = (acos((X - pX1) / floatsqroot((X - pX1)*(X - pX1) + (Y - pY1)*(Y - pY1))) - 90.0);

	if(X > pX1) ang = (floatabs(floatabs(ang) + 180.0));
	else ang = (floatabs(ang) - 180.0);

	ang += 180.0;

	SetPlayerFacingAngle(playerid, ang);

 	return ang;
}

CMD:fly(playerid, params[])
{
 if(IsPlayerAdmin(playerid))
	{


	    new Float:x, Float:y, Float:z;
		if((flying[playerid] = !flying[playerid]))
		{
		    GetPlayerPos(playerid, x, y, z);
		    SetPlayerPos(playerid, x, y, z+5);
    		SetPlayerArmour(playerid, 1000000000.0);
		    SetPlayerHealth(playerid, 1000000000.0);
		    SetTimerEx("AdminFly", 100, 0, "d", playerid);
		}
		else
		{
		    GetPlayerPos(playerid, x, y, z);
		    SetPlayerPos(playerid, x, y, z+0.5);
		    ClearAnimations(playerid);
		    SetPlayerArmour(playerid, 100.0);
		    SetPlayerHealth(playerid, 100.0);
			return 1;
		}
	}
	else
	{
	    SendClientMessage(playerid, 0xB4B5B7FF, "Ban khong co quyen su dung lenh nay.");
	}
	return 1;
}
