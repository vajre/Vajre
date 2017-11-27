
Ë6
MessageClient.protoMessageCommon.proto"R
CS_Cmd_RoleLogin
eType (2
.LoginType
strToken (	
	strOpenID (	"{
SC_Cmd_RoleLogin 
result (2.RoleLoginResult
roleInfo (2.tagRoleInfo
n32FreezeTime (
isRoom ("E
CS_Cmd_AccountLogin
strAccountName (	
u32PasswordCrc ("6
SC_Cmd_BeLoginLeave
type (2.BeLoginLeaveType"3
SC_Cmd_RoleUpdate
roleInfo (2.tagRoleInfo"7
CS_Cmd_CreateRoom"
ruleInfo (2.tagRoomRuleInfo"I
SC_Cmd_CreateRoom!
result (2.CreateRoomResult
	u32RoomID ("$
CS_Cmd_JoinRoom
	u32RoomID ("_
SC_Cmd_JoinRoom
	u32RoomID (
result (2.JoinRoomResult
eType (2	.RoomType"ä
SC_Cmd_SignInfo"
ruleInfo (2.tagRoomRuleInfo
	u8GameNum (
	u8RoleNum (
u32YuanBaoNum (
u32RoomCardNum ("$
CS_Cmd_SignInfo
	u32RoomID ("*
CS_Cmd_JoinSystemRoom
	u32OnlyID ("K
SC_Cmd_JoinSystemRoom
result (2.JoinRoomResult
	u32RoomID ("
CS_Cmd_LeaveRoom"H
SC_Cmd_LeaveRoom 
result (2.LeaveRoomResult

u32LockSec ("7
SC_Cmd_BeRemoveRoom 
eType (2.BeRemoveRoomType"C
SC_Cmd_RoleChangeRoom
u32OldRoomID (
u32NowRoomID ("$
CS_Cmd_RoleAccpet
bAccpet ("5
CS_Cmd_RoomOper"
operInfo (2.tagRoomOperInfo"9
SC_Cmd_RoomRoleInfo"
roleInfo (2.tagRoomRoleInfo"9
SC_Cmd_RoomInitInfo"
initInfo (2.tagRoomInitInfo"6
SC_Cmd_RoomEndInfo 
endInfo (2.tagRoomEndInfo"<
SC_Cmd_RoomStateInfo$
	stateInfo (2.tagRoomStateInfo"%
CS_Cmd_RenewRoom
	u8GameNum ("Y
SC_Cmd_RenewRoom 
result (2.RenewRoomResult
	bRoomCard (
u32Price ("e
SC_Cmd_RoomGameNumChg
	u32RoomID (
	u8GameNum (
u32MasterID (
	bRoomCard ("$
CS_Cmd_KickRole
	u32RoleID ("C
SC_Cmd_KickRole#
result (2.KickRoomRoleResult
bBJ ("T
SC_Cmd_KickRoleAsk
u32SrcRoleID (
u32KickRoleID (
	u32RoomID ("#
CS_Cmd_KickRoleAsk
bKick ("f
SC_Cmd_KickRoleAskOper
	u32RoomID (
u32OperRoleID (
bKick (
bKickResult ("z
tagRoomPriceInfo
eType (2	.RoomType

rolenumArr (

gamenumArr (
priceArr (

aapriceArr ("3
tagPayAction_Double
shopid (
rate ("I
tagPayAction_Present
shopid (
yuanbao (
roomcard ("a
SC_Cmd_ClientInfo$
double (2.tagPayAction_Double&
present (2.tagPayAction_Present"Q
CS_Cmd_RoleChar
eType (2	.CharType
strRoleChar (	
u8Param ("d
SC_Cmd_RoleChar
eType (2	.CharType
	u32RoleID (
strRoleChar (	
u8Param ("$
CS_Cmd_RoomInfo
	u32OnlyID ("U
SC_Cmd_RoomInfo
result (2.RoomInfoResult!
roomInfo (2.tagRoomLogInfo""
CS_Cmd_BindID
	u32BindID (".
SC_Cmd_BindID
result (2.BindIDResult"
CS_Cmd_CloseRoom"4
SC_Cmd_CloseRoom 
result (2.CloseRoomResult"X
SC_Cmd_VoteInfo
u32DestRoleID (
eType (2	.VoteType
u32VoteIndex ("§
SC_Cmd_VoteOper
u32VoteIndex (
u32SrcRoleID (
u32DestRoleID (
eType (2	.VoteType
u32Param (
roleArr (
	u32TimeMS ("6
CS_Cmd_VoteOper
u32VoteIndex (
bOper ("Q
SC_Cmd_RoleVoteOper
u32VoteIndex (
u32OperRoleID (
bOper ("k
SC_Cmd_VoteResult
u32SrcRoleID (
u32DestRoleID (
bResult (
eType (2	.VoteType";
CS_Cmd_RoleCharm
u32Index (
u32DestRoleID ("s
SC_Cmd_RoleCharm 
result (2.RoleCharmResult
u32SrcRoleID (
u32DestRoleID (
u32Index ("7
CS_Cmd_SoundReg
	u32RoleID (
	u32RoomID ("
CS_Cmd_SoundLeave"?
CS_Cmd_SendSound
eType (2
.SoundType
soundArr ("R
SC_Cmd_SendSound
	u32RoleID (
eType (2
.SoundType
soundArr ("Z

CS_Cmd_Pay
	u32ShopID (
eType (2.PayType
bIOS (

strIOSInfo (	"|

SC_Cmd_Pay
result (2
.PayResult

u64OrderID (
	u32ShopID (
eType (2.PayType

strOrderID (	"n
SC_Cmd_PayResult
result (2
.PayResult

u64OrderID (
	u32ShopID (
eType (2.PayType"T
SC_Cmd_MessageInfo
strMessageInfo (	

u32StepNum (

u32StepSec ("3
CS_Cmd_LoadRoleInfo
eType (2.RoleInfoType"7
SC_Cmd_LoadRoleInfo 
roleInfo (2.tagRoleExInfo"
SC_Cmd_RoleRoomErr"
CS_Cmd_TodayFirReward">
SC_Cmd_TodayFirReward%
result (2.TodayFirRewardResult"
CS_Cmd_RoleZhuanPan"^
SC_Cmd_RoleZhuanPan#
result (2.RoleZhuanPanResult
isEntity (
rewardId (")
CS_Cmd_RoleEntityItem
u64Phone ("P
SC_Cmd_RoleEntityItem%
result (2.RoleEntityItemResult
rewardId ("
CS_Cmd_RewardRecord"Q
SC_Cmd_RewardRecord)
	recordArr (2.tagZhuanPanRewardInfo
freeNum ("
CS_Cmd_FXReward"2
SC_Cmd_FXReward
result (2.FXRewardResult"
CS_Cmd_WeiXinFXReward">
SC_Cmd_WeiXinFXReward%
result (2.WeiXinFXRewardResult"$
CS_Cmd_ShiMingID
Identity (	"4
SC_Cmd_ShiMingID 
result (2.ShiMingIDResult";
CS_Cmd_GiveYuanBao
	GiveIDArr (

GiveNumArr ("Z
SC_Cmd_GiveYuanBao
u32SrcRoleID (
strScrRoleName (	
u32GiveYuanBao (">
SC_Cmd_GiveYuanBaoResult"
result (2.GiveYuanBaoResult""
CS_Cmd_Deposit
bDeposit (*Ü
ClientNetMsgType
CS_RoleLoginx
SC_RoleLoginy
SC_BeLoginLeavez
SC_RoleUpdate{
CS_CreateRoom|
SC_CreateRoom}
CS_JoinRoom~
SC_JoinRoom
SC_SignInfoÄ
CS_SignInfoÅ
CS_JoinSystemRoomÇ
SC_JoinSystemRoomÉ
CS_LeaveRoomÑ
SC_LeaveRoomÖ
SC_BeRemoveRoomÜ
SC_RoleChangeRoomá
CS_RoleAccpetà
CS_RoomOperâ
SC_RoomRoleInfoä
SC_RoomInitInfoã
SC_RoomEndInfoå
SC_RoomStateInfoç
CS_RenewRoomé
SC_RenewRoomè
SC_RoomGameNumChgê
CS_KickRoleë
SC_KickRoleí
SC_KickRoleAskì
CS_KickRoleAskî
SC_KickRoleAskOperï
SC_ClientInfoñ
CS_RoleCharó
SC_RoleCharò
CS_RoomInfoô
SC_RoomInfoö
	CS_BindIDõ
	SC_BindIDú
CS_CloseRoomù
SC_CloseRoomû
SC_VoteInfoü
SC_VoteOper†
CS_VoteOper°
SC_VoteResult¢
CS_RoleCharm£
SC_RoleCharm§
CS_AccountLogin•
CS_SoundReg¶
CS_SoundLeaveß
CS_SendSound®
SC_SendSound©
CS_Pay™
SC_Pay´
SC_PayResult¨
SC_MessageInfo≠
CS_LoadRoleInfoÆ
SC_LoadRoleInfoØ
SC_RoleRoomErr∞
CS_TodayFirReward±
SC_TodayFirReward≤
CS_RoleZhuanPan≥
SC_RoleZhuanPan¥
CS_RoleEntityItemµ
SC_RoleEntityItem∂
CS_RewardRecord∑
SC_RewardRecord∏
CS_FXRewardπ
SC_FXReward∫
CS_WeiXinFXRewardª
SC_WeiXinFXRewardº
CS_ShiMingIDΩ
SC_ShiMingIDæ
CS_GiveYuanBaoø
SC_GiveYuanBao¿
SC_GiveYuanBaoResult¡

CS_Deposit¬
SC_RoleVoteOper√*S
CharType
CharType_SystemChar
CharType_SystemIcon
CharType_RoleChar*1
	SoundType
SoundType_IOS
SoundType_ANI