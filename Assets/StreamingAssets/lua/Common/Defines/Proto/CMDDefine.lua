--网络命令ID
CMD = 
{
	CS_RoleLogin		= 120;
	SC_RoleLogin		= 121;
	SC_BeLoginLeave		= 122;
	SC_RoleUpdate		= 123;
	CS_CreateRoom		= 124;
	SC_CreateRoom		= 125;
	CS_JoinRoom			= 126;
	SC_JoinRoom			= 127;
	SC_SignInfo			= 128;
	CS_SignInfo			= 129;
	CS_JoinSystemRoom	= 130;
	SC_JoinSystemRoom   = 131;
	CS_LeaveRoom		= 132;
	SC_LeaveRoom		= 133;
	SC_BeRemoveRoom		= 134;
	SC_RoleChangeRoom	= 135;
	CS_RoleAccpet		= 136;	
	CS_RoomOper			= 137;
	SC_RoomRoleInfo		= 138;
	SC_RoomInitInfo		= 139;
	SC_RoomEndInfo		= 140;
	SC_RoomStateInfo	= 141;
	CS_RenewRoom		= 142;
	SC_RenewRoom		= 143;
	SC_RoomGameNumChg	= 144;
	CS_KickRole			= 145;
	SC_KickRole			= 146;
	SC_KickRoleAsk		= 147;
	CS_KickRoleAsk		= 148;
	SC_KickRoleAskOper	= 149;
	SC_ClientInfo		= 150;
	CS_RoleChar			= 151;
	SC_RoleChar			= 152;
	CS_RoomInfo			= 153;
	SC_RoomInfo			= 154;
	CS_BindID			= 155;
	SC_BindID			= 156;
	CS_CloseRoom		= 157;
	SC_CloseRoom		= 158;
	SC_VoteInfo			= 159;
	SC_VoteOper			= 160;
	CS_VoteOper			= 161;
	SC_VoteResult		= 162;
	CS_RoleCharm		= 163;
	SC_RoleCharm		= 164;
	CS_AccountLogin		= 165;
	CS_SoundReg			= 166;
	CS_SoundLeave		= 167;
	CS_SendSound		= 168;
	SC_SendSound		= 169;
	CS_Pay				= 170;
	SC_Pay				= 171;
	SC_PayResult		= 172;
	SC_MessageInfo		= 173;
	CS_LoadRoleInfo		= 174; 
	SC_LoadRoleInfo		= 175; 
	SC_RoleRoomErr		= 176; 
	CS_TodayFirReward	= 177;
	SC_TodayFirReward	= 178;
	CS_RoleZhuanPan		= 179;
	SC_RoleZhuanPan		= 180;
	CS_RoleEntityItem	= 181;
	SC_RoleEntityItem	= 182;
	CS_RewardRecord		= 183;
	SC_RewardRecord		= 184;
	CS_FXReward			= 185;
	SC_FXReward			= 186;
	CS_WeiXinFXReward	= 187;
	SC_WeiXinFXReward   = 188;
	CS_ShiMingID		= 189;
	SC_ShiMingID		= 190;
	CS_GiveYuanBao		= 191;
	SC_GiveYuanBao		= 192;
	SC_GiveYuanBaoResult= 193;
	CS_Deposit			= 194;
	SC_RoleVoteOper		= 195;
};

CMD_Mapping = {}

for k, v in pairs(CMD) do
    local str = tostring(k)
    local len = string.len(str)
    local dd = string.find(str, "_")
    if(dd == nil) then
        print("*** 未知的命令格式:" .. str .." ***")
        CMD_Mapping[v] = str
    else
        local msg = string.sub(str, 1, dd) .."Cmd" .. string.sub(str, dd, len)
        CMD_Mapping[v] = msg
    end
    --print(v .."," .. CMD_Mapping[v] )
end
