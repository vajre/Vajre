
‹⁄
MessageCommon.proto"é
tagDBServerConfig
strIP (	
u16Port (
u8ListenThreadNum (
	strSqlUrl (	

u16SqlPort (
strSqlAccount (	
strSqlPassword (	
strSqlDBName (	
u8WorkThreadNum	 (
u8ProcTimeOut
 (
bLogDB (

u32TimeOut ("‚
tagCenterServerConfig
strClientIP (	
u16ClientPort (
u8ClientThreadNum (
	strGameIP (	
u16GamePort (
u8GameThreadNum (
strDBIP (	
	u16DBPort (

strLogDBIP	 (	
u16LogDBPort
 (
u8WorkThreadNum (
	strHttpIP (	
u16HttpPort (

strHttpsIP (	
u16HttpsPort (
cacheDay (
cacheNum (

cacheExDay (

cacheExNum (
u8DBSaveMin (

strQQAppID (	
u32BeginRoomID (
u32EndRoomID (
bTest (
u32SaveDBTime (
u32RoomLimitDay (
u32RoomLimitNum (
	strGateIP (	
u16GatePort (
u8GateThreadNum (
u32SFBAppID (
	strSFBKey  (	
u32SFBPartnerID! (
u32CharmPrice" (
u32InitYuanBao# (
u32InitGold$ (
u32InitRoomCard% (
u32ClientTimeOut& (
u32GateTimeOut' (
u32DBTimeOut( (
u32LogDBTimeOut) (
u32GameTimeOut* (
u32ZhuanPanLimitNum+ (
u32InitMagicFace, ("ê
tagGameServerConfig
strIP (	
u16Port (
	u8WorkNum (
roomArr (

opennumArr (

u32TimeOut (
bTest ("q
tagSoundServerConfig
strClientIP (	
u16ClientPort (
u8ClientThreadNum (

u32TimeOut ("∏
tagGateServerConfig
strClientIP (	
u16ClientPort (
u8ClientThreadNum (
	strConnIP (	
u16ConnPort (
u32ClientTimeOut (
u32CenterTimeOut ("Ö
tagGameSystemRoomItem
u32ID (
eType (

n32MinGold (

n32MaxGold (
u32MaxRoleNum (
u32Rate ("@
tagGameSystemRoomInfo'
roomArr (2.tagGameSystemRoomItem"w
tagShopItem
	u32ItemID (
u32AddYuanBao (
u32AddRoomCard (
	u32RMBNum (
strItemName (	",
tagShopInfo
itemArr (2.tagShopItem" 
tagAgentInfo
agentArr ("¨
tagRoomCardItem
eType (
	u8RoleNum (
	u8GameNum (
u32CreateRoomCard (
u32CreateYuanBao (
u32SignRoomCard (
u32SignYuanBao ("4
tagRoomCardInfo!
roomArr (2.tagRoomCardItem"¶
tagMessageItem
u32ID (
strMessageInfo (	
n32BeginTime (
u32StepTime (

u32StepNum (
u32OnceStepNum (
u32OnceStepSec ("2
tagMessageInfo 
itemArr (2.tagMessageItem"±
tagPayOrderInfo

u64OrderID (
	u32RoleID (
eType (2.PayType
	u32ShopID (

n32LogTime (
	u32BindID (
	n32UserID (
	n32BigUid ("˚
tagZhuanPanItem
u32ID (
strName (	
bEntity (
u32BeginAllYuanBao (
u32RoleYuanBao (
u32Rate (
u32WeekCount (
bIsLog (
u32AddYuanBaoNum	 (
u32AddRoomCardNum
 (
u32AddMagicFace ("{
tagZhuanPanConfig
u32DayFreeNum (
u32UsePrice (
u32RewardLogNum (!
itemArr (2.tagZhuanPanItem"ë
tagZhuanPanRewardInfo
	u32RoleID (
strRoleName (	

strFaceURL (	
u32RewardID (

n32LogTime (
u32clientID ("c
tagZhuanPanInfo
u32AllYuanBao (
idArr (
rewardCountNum (

n32LogTime ("M
tagRoleEntityInfo
	u32RoleID (
u64Phone (
u32RewardID ("Ä
tagRoleRemoteInfo
	u32RoleID (
strRoleName (	

strFaceURL (	
bOnline (
u32IP (
bGender ("m
tagRoleRoomInfo
	u32RoleID (
strRoleName (	

strFaceURL (	
u32IP (
bGender ("O
tagScriptData
Param1 (
Param2 (
Param3 (
Param4 ("g
tagHuPaiInfo
u32Rate (
eType (2
.HuPaiType
itemArr (2.MJValue
stateArr ("l
tagHuPaiItem
eValue (2.MJValue
hupaiArr (2.tagHuPaiInfo!

finialInfo (2.tagHuPaiInfo".
tagHuPaiList
itemArr (2.tagHuPaiItem"L
tagTingPaiItem
eValue (2.MJValue 
	hupaiInfo (2.tagHuPaiList"2
tagTingPaiInfo 
itemArr (2.tagTingPaiItem"<
tagRoleHuPaiInfo
mjArr (2.MJValue
rateArr ("U
tagRoleTiHuanInfo
	tihuanArr (2.MJValue#
hupaiArr (2.tagRoleHuPaiInfo";
tagRoleChuPai
u8SeatID (
eValue (2.MJValue"Q
tagRoleLChiPai
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue"Q
tagRoleRChiPai
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue"Q
tagRoleMChiPai
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue"Q
tagRolePengPai
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue"Q
tagRoleGangPai
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue"

tagRoleGuo
u8SeatID (":
tagRoleMoPai
u8SeatID (
eValue (2.MJValue"<
tagRoleTingPai
u8SeatID (
eValue (2.MJValue"y
tagRoleHuPai
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue
bZM (
bGSKH (
bGSP ("S
tagRoleQiangGang
u8SeatID (
u8SrcSeatID (
eValue (2.MJValue"<
tagRoleKaiGang
u8SeatID (
eValue (2.MJValue"<
tagRoleJiaGang
u8SeatID (
eValue (2.MJValue">
tagRoleGangMoPai
u8SeatID (
eValue (2.MJValue"Å
tagMJBaseRoleOper
roleOper (2.MJRoleOper
chupai (2.tagRoleChuPai 
lchipai (2.tagRoleLChiPai 
rchipai (2.tagRoleRChiPai 
mchipai (2.tagRoleMChiPai 
pengpai (2.tagRolePengPai 
gangpai (2.tagRoleGangPai
guo (2.tagRoleGuo
mopai	 (2.tagRoleMoPai 
tingpai
 (2.tagRoleTingPai
hupai (2.tagRoleHuPai$
	qianggang (2.tagRoleQiangGang 
kaigang (2.tagRoleKaiGang 
jiagang (2.tagRoleJiaGang!
gangmo (2.tagRoleGangMoPai"]
tagRoomChuPai
u8SeatID (&

tihuanInfo (2.tagRoleTiHuanInfo

u32TimeOut ("P
tagRoomLChiPai
u8SeatID (
eValue (2.MJValue

u32TimeOut ("P
tagRoomRChiPai
u8SeatID (
eValue (2.MJValue

u32TimeOut ("P
tagRoomMChiPai
u8SeatID (
eValue (2.MJValue

u32TimeOut ("P
tagRoomPengPai
u8SeatID (
eValue (2.MJValue

u32TimeOut ("P
tagRoomGangPai
u8SeatID (
eValue (2.MJValue

u32TimeOut ("4
tagRoomMoPai
u8SeatID (

u32TimeOut ("X
tagRoomTingPai
u8SeatID ( 
info (2.tagRoleTiHuanInfo

u32TimeOut ("N
tagRoomHuPai
u8SeatID (
eValue (2.MJValue

u32TimeOut ("R
tagRoomQiangGang
u8SeatID (
eValue (2.MJValue

u32TimeOut ("O
tagRoomKaiGang
u8SeatID (
mjArr (2.MJValue

u32TimeOut ("O
tagRoomJiaGang
u8SeatID (
mjArr (2.MJValue

u32TimeOut ("2

tagRoomGuo
u8SeatID (

u32TimeOut ("ﬂ
tagMJBaseRoomOper
	eRoomOper (2.MJRoomOper
chupai (2.tagRoomChuPai 
lchipai (2.tagRoomLChiPai 
rchipai (2.tagRoomRChiPai 
mchipai (2.tagRoomMChiPai 
pengpai (2.tagRoomPengPai 
gangpai (2.tagRoomGangPai
mopai (2.tagRoomMoPai 
tingpai	 (2.tagRoomTingPai
hupai
 (2.tagRoomHuPai$
	qianggang (2.tagRoomQiangGang 
kaigang (2.tagRoomKaiGang 
jiagang (2.tagRoomJiaGang
guo (2.tagRoomGuo"Ú
tagTLSSZRuleInfo
u32Rate (
u8MaPai (
bYJPP (
bCheckIP (
bRP (
bSSZ (
bSTH (
bLDB (
bWDYK	 (
bQBYDR
 (
bQRYDB (
bYTL (
bQB (
bQR (
bZZQL ("m
tagNNRuleInfo
u32Rate (
bWXN (
eType (2	.NNZJType
bCheckIP (
	u8MinRole ("§
tagJXSSZRuleInfo
u32Rate (
u8MaPai (
bYJPP (
bCheckIP (
bDG (
bCS (
bHBL (
bRP (
bFH	 (
bLH
 ("U
tagJHSSZRuleInfo
u32Rate (
u8MaPai (
bYJPP (
bCheckIP ("ó
tagXSSSZRuleInfo
u32Rate (
u8MaPai (
bYJPP (
bCheckIP (
bFH (
bCS (
bHBL (
bDG (
bLH	 ("U
tagYWSSZRuleInfo
u32Rate (
u8MaPai (
bYJPP (
bCheckIP ("Q
tagLHSSZRuleInfo
u32Rate (
bDG (
bYJPP (
bCheckIP ("Ç
tagNCMJRuleInfo
u32Rate (
bCheckIP (
bDPSJF (
bBWJRate (
bCJP (
eXJType (2.NCMJXJType"4
tagAQMJRuleInfo
u32Rate (
bCheckIP ("¬
tagJYSSZRuleInfo
u32Rate (
bCheckIP (
bDG (
bHBL (
bLH (
mapaiArr (
bRP (
bSSZ (
bSTH	 (
bLDB
 (
bWDYK (
bQBYDR (
bQRYDB (
bYTL (
bQB (
bQR (
bZZQL (
bYJPP (
bFH (
bCS (
bLZ ("4
tagKMMJRuleInfo
u32Rate (
bCheckIP ("4
tagXZMJRuleInfo
u32Rate (
bCheckIP ("4
tagXLMJRuleInfo
u32Rate (
bCheckIP ("4
tagSSZRuleInfo"

scriptInfo (2.tagScriptData"D
tagMJRuleInfo
u32Rate ("

scriptInfo (2.tagScriptData"E
tagDDZRuleInfo
u32Rate ("

scriptInfo (2.tagScriptData"E
tagZJHRuleInfo
u32Rate ("

scriptInfo (2.tagScriptData"—
tagFYBZRuleInfo
u32Rate (
bRP (
bDG (
bHBL (
ISWang (
bSSZ (
bYTL (
SDZ (
bTZ	 (
bCheckIP
 (
bQP (
bYJPP (
	u8MinRole ("≤
tagRoomCommonInfo
	u32RoomID (
eType (2	.RoomType"

eRoomState (2.RoomStateType
u32RoomMasterID (
	u8RoleNum (
	u8GameNum (
bDKFJ ("≈
tagRoomRuleInfo*
roomCommonInfo (2.tagRoomCommonInfo$
	tlsszInfo (2.tagTLSSZRuleInfo
nnInfo (2.tagNNRuleInfo$
	jxsszInfo (2.tagJXSSZRuleInfo$
	jhsszInfo (2.tagJHSSZRuleInfo$
	xssszInfo (2.tagXSSSZRuleInfo$
	ywsszInfo (2.tagYWSSZRuleInfo$
	lhsszInfo (2.tagLHSSZRuleInfo"
ncmjInfo	 (2.tagNCMJRuleInfo$
	jysszInfo
 (2.tagJYSSZRuleInfo"
aqmjInfo (2.tagAQMJRuleInfo"
kmmjInfo (2.tagKMMJRuleInfo"
xzmjInfo (2.tagXZMJRuleInfo"
xlmjInfo (2.tagXLMJRuleInfo 
sszInfo (2.tagSSZRuleInfo
mjInfo (2.tagMJRuleInfo 
ddzInfo (2.tagDDZRuleInfo 
zjhInfo (2.tagZJHRuleInfo"
fybzInfo (2.tagFYBZRuleInfo"∏
tagDDZRoleOper
roleOper (2.DDZRoleOper
u8SeatID (
bOper (
	u32MPRate (
eType (2.DDZPokerType
pokerArr ("

scriptInfo (2.tagScriptData"$
tagDDZBeginInfo
	u8GameNum ("¸
tagDDZRoomOper
roomOper (2.DDZRoomOper
	u32TimeMS (
u8SeatID (
pokerArr (
	u32DZRate (
	u32HJRate (
	u32MPRate (
	u32ZDRate (#
	begininfo	 (2.tagDDZBeginInfo"

scriptInfo
 (2.tagScriptData"^
tagDDZEndInfoRoleItem
u8SeatID (
pokerArr (
n32Point (
u32Rate ("ª
tagDDZEndInfo
	u8GameNum (
	u32HJRate (
	u32ZDRate (
	u32DZRate (
	u32MPRate ('
roleArr (2.tagDDZEndInfoRoleItem"

scriptInfo (2.tagScriptData"M
tagDDZRoleInitInfo
u8SeatID (
u32PokerNum (
pokerArr ("ä
tagDDZInitInfo
u8SeatID (
	u8GameNum (

u8DZSeatID (
	u32HJRate (
	u32ZDRate (
	u32DZRate (
	u32MPRate (
u8ChuPaiSeatID (
	ChuPaiArr	 ($
roleArr
 (2.tagDDZRoleInitInfo"

scriptInfo (2.tagScriptData"q
tagDDZRoomDataInfo
	u32WinNum (

u32LoseNum (
u32PJNum ("

scriptInfo (2.tagScriptData"7
tagDDZRoomLogInfo"

scriptInfo (2.tagScriptData"ì
tagMJRoleOper
roleOper (2.MJRoleOperS
u8SeatID (
u8SrcSeatID (
mjArr (2.MJValue"

scriptInfo (2.tagScriptData"[
tagMJTiHuanInfo
eTiHuan (2.MJValue

tingpaiArr (2.MJValue
rateArr ("t
tagMJBeginRoleInfo
u8SeatID (
u8MJNum (
mjArr (2.MJValue"

scriptInfo (2.tagScriptData"ë
tagMJBeginInfo
	u8GameNum (
	ShaiZiArr (
u8MJNum ($
roleArr (2.tagMJBeginRoleInfo"

scriptInfo (2.tagScriptData"Ô
tagMJRoomOper
roomOper (2.MJRoomOperS
	u32TimeMS (
u8SeatID (
u8SrcSeatID (
mjArr (2.MJValue#
	tihuanArr (2.tagMJTiHuanInfo"
	beginInfo (2.tagMJBeginInfo"

scriptInfo (2.tagScriptData"9
	tagMJItem
u8SrcSeatID (
mjArr (2.MJValue"ê
tagMJPointChgLog
typeArr (2.MJInfoType
rateArr (
pointArr (
	finishArr (
seatArr (
mjArr (2.MJValue"Í
tagMJRoleEndInfo
u8SeatID (
mjArr (2.MJValue
lchiArr (2
.tagMJItem
mchiArr (2
.tagMJItem
rchiArr (2
.tagMJItem
pengArr (2
.tagMJItem
gangArr (2
.tagMJItem

jiagangArr (2
.tagMJItem

kaigangArr	 (2
.tagMJItem
n32Point
 ($
	pointInfo (2.tagMJPointChgLog"

scriptInfo (2.tagScriptData"Ä
tagMJEndInfo
	u8GameNum (
u8HuPaiSeatID ("
roleArr (2.tagMJRoleEndInfo"

scriptInfo (2.tagScriptData"Ù
tagMJRoleInitInfo
u8SeatID (
u8MJNum (
mjArr (2.MJValue
lchiArr (2
.tagMJItem
rchiArr (2
.tagMJItem
mchiArr (2
.tagMJItem
pengArr (2
.tagMJItem
	u8GangNum (
gangArr	 (2
.tagMJItem

jiaGangArr
 (2
.tagMJItem

kaiGangArr (2
.tagMJItem
	chupaiArr (2.MJValue"

scriptInfo (2.tagScriptData"∂
tagMJInitInfo
u8SeatID (
	u8GameNum (
u8MJNum (
	ShaiZiArr (
u8GangMoNum (#
roleArr (2.tagMJRoleInitInfo"

scriptInfo (2.tagScriptData"p
tagMJRoomDataInfo
	u32WinNum (

u32LoseNum (
u32PJNum ("

scriptInfo (2.tagScriptData"É
tagMJRoleOperItemLog
u8SeatID (
eOper (2.MJRoleOperS
eValue (2.MJValue"

scriptInfo (2.tagScriptData"¢
tagMJRoomLogInfo"
	beginInfo (2.tagMJBeginInfo
endInfo (2.tagMJEndInfo&
operArr (2.tagMJRoleOperItemLog"

scriptInfo (2.tagScriptData"ƒ
tagBZRoleOper
roleOper (2.BZRoleOper
u8SeatID (
pokerArr (
eTSType (2	.BZTSType
typeArr (2.BZType"

scriptInfo (2.tagScriptData
u32exTypePoint ("â
tagBZRoomOper
roomOper (2.BZRoomOper
	u32TimeMS (
u8SeatID (
pokerArr ("

scriptInfo (2.tagScriptData"∞
tagBZRoleEndInfo
u8SeatID (
pokerArr (
eTSType (2	.BZTSType
typeArr (2.BZType
seatArr (
pointArr (
dqArr (
n32Point ("é
tagBZEndInfo
	u8GameNum (
bHBL ("
roleArr (2.tagBZRoleEndInfo"

scriptInfo (2.tagScriptData
otherPokerArr ("ö
tagBZRoleInitInfo
u8SeatID (
u32PokerNum (
pokerArr (
eTSType (2	.BZTSType
typeArr (2.BZType
u32exTypePoint ("å
tagBZInitInfo
u8SeatID (
SeatArr (
operArr (#
roleArr (2.tagBZRoleInitInfo"

scriptInfo (2.tagScriptData"p
tagBZRoomDataInfo
	u32WinNum (

u32LoseNum (
u32PJNum ("

scriptInfo (2.tagScriptData"6
tagBZRoomLogInfo"

scriptInfo (2.tagScriptData"Æ
tagSSZRoleOper
roleOper (2.SSZRoleOper
u8SeatID (
pokerArr (
eTSType (2	.BZTSType
typeArr (2.BZType"

scriptInfo (2.tagScriptData"ã
tagSSZRoomOper
roomOper (2.SSZRoomOper
	u32TimeMS (
u8SeatID (
pokerArr ("

scriptInfo (2.tagScriptData"∆
tagSSZRoleEndInfo
u8SeatID (
pokerArr (
eTSType (2
.SSZTSType
typeArr (2.SSZType
seatArr (
pointArr (
dqArr (
	u32MPRate (
n32Point	 ("ô
tagSSZEndInfo
	u8GameNum (
bHBL (
bFH (
	u32LHRate (#
roleArr (2.tagSSZRoleEndInfo"

scriptInfo (2.tagScriptData"Ö
tagSSZRoleInitInfo
u8SeatID (
u32PokerNum (
pokerArr (
eTSType (2
.SSZTSType
typeArr (2.SSZType"é
tagSSZInitInfo
u8SeatID (
SeatArr (
operArr ($
roleArr (2.tagSSZRoleInitInfo"

scriptInfo (2.tagScriptData"q
tagSSZRoomDataInfo
	u32WinNum (

u32LoseNum (
u32PJNum ("

scriptInfo (2.tagScriptData"7
tagSSZRoomLogInfo"

scriptInfo (2.tagScriptData"µ
tagScriptRoomRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("P
tagScriptRoomRoleInfo'
roleArr (2.tagScriptRoomRoleItem
delArr ("ó
tagScriptRoleOper 
ddzInfo (2.tagDDZRoleOper
bzInfo (2.tagBZRoleOper 
sszInfo (2.tagSSZRoleOper
mjInfo (2.tagMJRoleOper"Õ
tagScriptRoomOper
eType (2	.RoomType#

ddzRoleArr (2.tagDDZRoleOper#

ddzRoomArr (2.tagDDZRoomOper!
	mjRoleArr (2.tagMJRoleOper!
	mjRoomArr (2.tagMJRoomOper!
	bzRoleArr (2.tagBZRoleOper!
	bzRoomArr (2.tagBZRoomOper#

sszRoleArr (2.tagSSZRoleOper#

sszRoomArr	 (2.tagSSZRoomOper"M
tagScriptRoomGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("‹
tagScriptRoomEndInfo
eType (2	.RoomType*
	groupInfo (2.tagScriptRoomGroupInfo
ddzInfo (2.tagDDZEndInfo
mjInfo (2.tagMJEndInfo
bzInfo (2.tagBZEndInfo
sszInfo (2.tagSSZEndInfo"√
tagScriptRoomInit"
ruleInfo (2.tagRoomRuleInfo$
roomOper (2.tagScriptRoomOper%
endArr (2.tagScriptRoomEndInfo*
	groupInfo (2.tagScriptRoomGroupInfo
bSign ( 
ddzInfo (2.tagDDZInitInfo
mjInfo (2.tagMJInitInfo
bzInfo (2.tagBZInitInfo 
sszInfo	 (2.tagSSZInitInfo"È
tagScriptRoomLogInfo
eType (2	.RoomType'
roleArr (2.tagScriptRoomRoleItem#
ddzInfo (2.tagDDZRoomLogInfo!
mjInfo (2.tagMJRoomLogInfo!
bzInfo (2.tagBZRoomLogInfo#
sszInfo (2.tagSSZRoomLogInfo"≈
tagScriptRoomDataInfo
eType (2	.RoomType$
ddzInfo (2.tagDDZRoomDataInfo"
mjInfo (2.tagMJRoomDataInfo"
bzInfo (2.tagBZRoomDataInfo$
sszInfo (2.tagSSZRoomDataInfo"
tagTLSSZLogInfo"p
tagTLSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("∞
tagTLSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagTLSSZRoleInfo"
roleArr (2.tagTLSSZRoleItem
delArr ("Ñ
tagTLSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("ˆ
tagTLSSZRoleEndInfo
u8SeatID (
bHBL (

u32LHCount (
bMaPai (
typeArr (2
.TLSSZType
typeex (2.TLSSZTSType
pokerArr ($
comArr (2.tagTLSSZRoleComInfo
pointArr	 (
n32PointChange
 ("H
tagTLSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagTLSSZEndInfo
	u8GameNum (%
roleArr (2.tagTLSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagTLSSZGroupInfo"å
tagTLSSZInitInfo
	u8GameNum (
u8MaPai ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
exType (2.TLSSZTSType
u32exTypePoint (
bSet (
u32WriteTime ( 
endArr	 (2.tagTLSSZEndInfo
u32InitTime
 (
bSign ("B
tagTLSSZOperInfo
eOper (2.TLSSZRoleOper
paraArr ("Å
tagTLSSZSendPokerInfo
u8SeatID (
pokerArr (
bMaPai (
typeex (2.TLSSZTSType
u32exTypePoint ("!
tagTLSSZSetInfo
setArr ("C
tagTLSSZRoleReset
seatArr (
setArr (
lhArr ("¶
TLSSZRoomOperInfo
eOper (2.TLSSZRoomOper(
sendInfo (2.tagTLSSZSendPokerInfo!
setInfo (2.tagTLSSZSetInfo%
	resetInfo (2.tagTLSSZRoleReset"O
tagTLSSZStateInfo
	u8GameNum ('
roomOperArr (2.TLSSZRoomOperInfo"
tagNNLogInfo"•
tagNNRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
u32ZDNum (
	u32WXNNum (
	u32WHNNum (
	u32SHNNum (
u32NNNum ("
tagNNRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
bZJ (
u32RoleRate (
	u32ZJRate (
bSet	 (
eState
 (2.RoomRoleState
bDeposit ("@
tagNNRoleInfo
roleArr (2.tagNNRoleItem
delArr (" 
tagNNStateQZ
pokerArr ("%
tagNNStateRate
u32ZJSeatID (""
tagNNStateSend
pokerArr ("∫
tagNNStateInfo
eState (2.NNRoomState

u32TimeLog (
	u8GameNum (
qzInfo (2.tagNNStateQZ!
rateInfo (2.tagNNStateRate!
sendInfo (2.tagNNStateSend"
tagNNOperQZ
u32Point ("!
tagNNOperRate
u32Point (" 
tagNNOperSet
pokerArr ("ç
tagNNOperInfo
eState (2.NNRoleState
qzInfo (2.tagNNOperQZ 
rateInfo (2.tagNNOperRate
setInfo (2.tagNNOperSet"å
tagNNRoleComInfo
u8SeatID (
pokerArr (
eType (2.NNType
n32BasePoint (
u32Rate (
n32FinalPoint ("l
tagNNOtherRolePokerInfo
u8SeatID (
pokerArr (
eType (2.NNType
n32FinalPoint ("»
tagNNRoleEndInfo
u8SeatID (
pokerArr (
eType (2.NNType
u32Rate ("
roleArr (2.tagNNRoleComInfo
n32PointChange (+
	otherRole (2.tagNNOtherRolePokerInfo"E
tagNNGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("}
tagNNEndInfo
	u8GameNum (

u8ZJSeatID ("
roleArr (2.tagNNRoleEndInfo"
	groupinfo (2.tagNNGroupInfo"Ã
tagNNInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
eState (2.NNRoomState

u32TimeLog (
pokerArr (
endArr (2.tagNNEndInfo

u8ZJSeatID (
bSign ("
tagJXSSZLogInfo"p
tagJXSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("∞
tagJXSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagJXSSZRoleInfo"
roleArr (2.tagJXSSZRoleItem
delArr ("Ñ
tagJXSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("É
tagJXSSZRoleEndInfo
u8SeatID (
bHBL (
bFH (

u32LHCount (
bMaPai (
typeex (2.JXSSZTSType
typeArr (2
.JXSSZType
pokerArr ($
comArr	 (2.tagJXSSZRoleComInfo
pointArr
 (
n32PointChange ("H
tagJXSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagJXSSZEndInfo
	u8GameNum (%
roleArr (2.tagJXSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagJXSSZGroupInfo"å
tagJXSSZInitInfo
	u8GameNum (
u8MaPai ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
exType (2.JXSSZTSType
u32exTypePoint (
bSet (
u32WriteTime ( 
endArr	 (2.tagJXSSZEndInfo
u32InitTime
 (
bSign ("B
tagJXSSZOperInfo
eOper (2.JXSSZRoleOper
paraArr ("Å
tagJXSSZSendPokerInfo
u8SeatID (
pokerArr (
bMaPai (
typeex (2.JXSSZTSType
u32exTypePoint ("!
tagJXSSZSetInfo
setArr ("C
tagJXSSZRoleReset
seatArr (
setArr (
lhArr ("¶
JXSSZRoomOperInfo
eOper (2.JXSSZRoomOper(
sendInfo (2.tagJXSSZSendPokerInfo!
setInfo (2.tagJXSSZSetInfo%
	resetInfo (2.tagJXSSZRoleReset"O
tagJXSSZStateInfo
	u8GameNum ('
roomOperArr (2.JXSSZRoomOperInfo"
tagYWSSZLogInfo"p
tagYWSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("∞
tagYWSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagYWSSZRoleInfo"
roleArr (2.tagYWSSZRoleItem
delArr ("Ñ
tagYWSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("ˆ
tagYWSSZRoleEndInfo
u8SeatID (
bHBL (

u32LHCount (
bMaPai (
typeex (2.YWSSZTSType
typeArr (2
.YWSSZType
pokerArr ($
comArr (2.tagYWSSZRoleComInfo
pointArr	 (
n32PointChange
 ("H
tagYWSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagYWSSZEndInfo
	u8GameNum (%
roleArr (2.tagYWSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagYWSSZGroupInfo"å
tagYWSSZInitInfo
	u8GameNum (
u8MaPai ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
exType (2.YWSSZTSType
u32exTypePoint (
bSet (
u32WriteTime ( 
endArr	 (2.tagYWSSZEndInfo
u32InitTime
 (
bSign ("B
tagYWSSZOperInfo
eOper (2.YWSSZRoleOper
paraArr ("Å
tagYWSSZSendPokerInfo
u8SeatID (
pokerArr (
bMaPai (
typeex (2.YWSSZTSType
u32exTypePoint ("!
tagYWSSZSetInfo
setArr ("C
tagYWSSZRoleReset
seatArr (
setArr (
lhArr ("¶
YWSSZRoomOperInfo
eOper (2.YWSSZRoomOper(
sendInfo (2.tagYWSSZSendPokerInfo!
setInfo (2.tagYWSSZSetInfo%
	resetInfo (2.tagYWSSZRoleReset"O
tagYWSSZStateInfo
	u8GameNum ('
roomOperArr (2.YWSSZRoomOperInfo"
tagXSSSZLogInfo"p
tagXSSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("∞
tagXSSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagXSSSZRoleInfo"
roleArr (2.tagXSSSZRoleItem
delArr ("Ñ
tagXSSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("Â
tagXSSSZRoleEndInfo
u8SeatID (
bHBL (
bFH (

u32LHCount (
bMaPai (
typeArr (2
.XSSSZType
pokerArr ($
comArr (2.tagXSSSZRoleComInfo
pointArr	 (
n32PointChange
 ("H
tagXSSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagXSSSZEndInfo
	u8GameNum (%
roleArr (2.tagXSSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagXSSSZGroupInfo"÷
tagXSSSZInitInfo
	u8GameNum (
u8MaPai ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
bSet (
u32WriteTime ( 
endArr (2.tagXSSSZEndInfo
u32InitTime (
bSign	 ("B
tagXSSSZOperInfo
eOper (2.XSSSZRoleOper
paraArr ("K
tagXSSSZSendPokerInfo
u8SeatID (
pokerArr (
bMaPai ("!
tagXSSSZSetInfo
setArr ("C
tagXSSSZRoleReset
seatArr (
setArr (
lhArr ("¶
XSSSZRoomOperInfo
eOper (2.XSSSZRoomOper(
sendInfo (2.tagXSSSZSendPokerInfo!
setInfo (2.tagXSSSZSetInfo%
	resetInfo (2.tagXSSSZRoleReset"O
tagXSSSZStateInfo
	u8GameNum ('
roomOperArr (2.XSSSZRoomOperInfo"
tagLHSSZLogInfo"K
tagLHSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum ("∞
tagLHSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagLHSSZRoleInfo"
roleArr (2.tagLHSSZRoleItem
delArr ("Ñ
tagLHSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("¶
tagLHSSZRoleEndInfo
u8SeatID (
typeArr (2
.LHSSZType
pokerArr ($
comArr (2.tagLHSSZRoleComInfo
pointArr (
n32PointChange ("H
tagLHSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagLHSSZEndInfo
	u8GameNum (%
roleArr (2.tagLHSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagLHSSZGroupInfo"≈
tagLHSSZInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
bSet (
u32WriteTime ( 
endArr (2.tagLHSSZEndInfo
u32InitTime (
bSign	 ("B
tagLHSSZOperInfo
eOper (2.LHSSZRoleOper
paraArr (";
tagLHSSZSendPokerInfo
u8SeatID (
pokerArr ("!
tagLHSSZSetInfo
setArr ("4
tagLHSSZRoleReset
seatArr (
setArr ("¶
LHSSZRoomOperInfo
eOper (2.LHSSZRoomOper(
sendInfo (2.tagLHSSZSendPokerInfo!
setInfo (2.tagLHSSZSetInfo%
	resetInfo (2.tagLHSSZRoleReset"O
tagLHSSZStateInfo
	u8GameNum ('
roomOperArr (2.LHSSZRoomOperInfo"
tagJHSSZLogInfo"p
tagJHSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("∞
tagJHSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagJHSSZRoleInfo"
roleArr (2.tagJHSSZRoleItem
delArr ("Ñ
tagJHSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("Â
tagJHSSZRoleEndInfo
u8SeatID (
bHBL (

u32LHCount (
bFH (
bMaPai (
typeArr (2
.JHSSZType
pokerArr ($
comArr (2.tagJHSSZRoleComInfo
pointArr	 (
n32PointChange
 ("H
tagJHSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagJHSSZEndInfo
	u8GameNum (%
roleArr (2.tagJHSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagJHSSZGroupInfo"÷
tagJHSSZInitInfo
	u8GameNum (
u8MaPai ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
bSet (
u32WriteTime ( 
endArr (2.tagJHSSZEndInfo
u32InitTime (
bSign	 ("B
tagJHSSZOperInfo
eOper (2.JHSSZRoleOper
paraArr ("K
tagJHSSZSendPokerInfo
u8SeatID (
pokerArr (
bMaPai ("!
tagJHSSZSetInfo
setArr ("C
tagJHSSZRoleReset
seatArr (
setArr (
lhArr ("¶
JHSSZRoomOperInfo
eOper (2.JHSSZRoomOper(
sendInfo (2.tagJHSSZSendPokerInfo!
setInfo (2.tagJHSSZSetInfo%
	resetInfo (2.tagJHSSZRoleReset"O
tagJHSSZStateInfo
	u8GameNum ('
roomOperArr (2.JHSSZRoomOperInfo"≈
tagNCMJRoleMJInfo
u8SeatID (
u8MJNum (
mjArr (2.MJValue
lchiArr (2.MJValue
rchiArr (2.MJValue
mchiArr (2.MJValue
pengArr (2.MJValue
minggangArr (2.MJValue
angang	 (2.MJValue
jiagang
 (2.MJValue
chuArr (2.MJValue
tschiArr (2.MJValue"J
tagNCMJRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum ("Ø
tagNCMJRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("D
tagNCMJRoleInfo!
roleArr (2.tagNCMJRoleItem
delArr ("‹
tagNCMJRoleEndInfo
u8SeatID ("
mjInfo (2.tagNCMJRoleMJInfo

n32XJPoint (

n32JFPoint (
n32HuPaiPoint (
n32GangPoint (
n32FinalPoint (
	xjanumArr (
	xjbnumArr	 ("G
tagNCMJGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("Å
tagNCMJEndInfo
	u8GameNum (
u8HuPaiSeatID (
eHuPaiValue (2.MJValue$
roleArr (2.tagNCMJRoleEndInfo
typeArr (2	.NCMJType$
	groupinfo (2.tagNCMJGroupInfo
eXJValueAArr (2.MJValue
eXJValueBArr (2.MJValue"O
tagNCMJOperInfo!
eOper (2.tagMJBaseRoleOper
testArr (2.MJValue"…
tagNCMJRoomOper_GameBegin
	u8GameNum (
u32SeZiNumA (
u32SeZiNumB (
u32SeZiNumC (
eZJValue (2.MJValue
eFJValue (2.MJValue
	eXJValueA (2.MJValue
	eXJValueB (2.MJValue%
	roleMjArr	 (2.tagNCMJRoleMJInfo
seatArr
 (
pointArr (
xjaArr (
xjbArr ("Y
tagNCMJRoomOper
eOper (2.NCMJRoomOper(
info (2.tagNCMJRoomOper_GameBegin"•
tagNCMJStateInfo
	u8GameNum (
u8State ( 
exOper (2.tagNCMJRoomOper'
baseOperArr (2.tagMJBaseRoomOper"
roleOper (2.tagNCMJOperInfo"Y
tagNCMJOperLog#
roomOper (2.tagNCMJStateInfo"
roleOper (2.tagNCMJOperInfo"}
tagNCMJTimeLimit#
roomOper (2.tagNCMJStateInfo"
roleOper (2.tagNCMJOperInfo 
endOper (2.tagNCMJEndInfo"å
tagNCMJLogInfo
	u8GameNum (!
roleArr (2.tagNCMJRoleItem%
	roleMjArr (2.tagNCMJRoleMJInfo
u32SeZiNumA (
u32SeZiNumB (
u32SeZiNumC (
eZJValue (2.MJValue
eFJValue (2.MJValue
	eXJValueA	 (2.MJValue
	eXJValueB
 (2.MJValue
seatArr (
pointArr ('

roleEndArr (2.tagNCMJRoleEndInfo 
operArr (2.tagNCMJOperLog"˜
tagNCMJInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
u8MJNum (
u8BGNum (
u32SeZiNumA (
u32SeZiNumB (
u32SeZiNumC (
eZJValue (2.MJValue
eFJValue	 (2.MJValue%
	roleMjArr
 (2.tagNCMJRoleMJInfo#
roomOper (2.tagNCMJStateInfo
eMoPai (2.MJValue
endArr (2.tagNCMJEndInfo
bSign ("
tagJYSSZLogInfo"p
tagJYSSZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("∞
tagJYSSZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("F
tagJYSSZRoleInfo"
roleArr (2.tagJYSSZRoleItem
delArr ("Ñ
tagJYSSZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("â
tagJYSSZRoleEndInfo
u8SeatID (
bHBL (

u32LHCount (
u32MaPaiRate (
bFH (
typeex (2.JYSSZTSType
typeArr (2
.JYSSZType
pokerArr ($
comArr	 (2.tagJYSSZRoleComInfo
pointArr
 (
n32PointChange ("H
tagJYSSZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("â
tagJYSSZEndInfo
	u8GameNum (%
roleArr (2.tagJYSSZRoleEndInfo
otherPokerArr (%
	groupinfo (2.tagJYSSZGroupInfo"˚
tagJYSSZInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
exType (2.JYSSZTSType
u32exTypePoint (
bSet (
u32WriteTime ( 
endArr (2.tagJYSSZEndInfo
u32InitTime	 (
bSign
 ("B
tagJYSSZOperInfo
eOper (2.JYSSZRoleOper
paraArr ("á
tagJYSSZSendPokerInfo
u8SeatID (
pokerArr (
u32MaPaiRate (
typeex (2.JYSSZTSType
u32exTypePoint ("!
tagJYSSZSetInfo
setArr ("C
tagJYSSZRoleReset
seatArr (
setArr (
lhArr ("¶
JYSSZRoomOperInfo
eOper (2.JYSSZRoomOper(
sendInfo (2.tagJYSSZSendPokerInfo!
setInfo (2.tagJYSSZSetInfo%
	resetInfo (2.tagJYSSZRoleReset"O
tagJYSSZStateInfo
	u8GameNum ('
roomOperArr (2.JYSSZRoomOperInfo"È
tagAQMJRoleMJInfo
u8SeatID (
u8MJNum (
mjArr (2.MJValue
lchiArr (2.MJValue
rchiArr (2.MJValue
mchiArr (2.MJValue
pengArr (2.MJValue
minggangArr (2.MJValue
angang	 (2.MJValue
jiagang
 (2.MJValue
chuArr (2.MJValue
u8BPNum (
u8HuaPaiNum (
huaArr (2.MJValue"J
tagAQMJRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum ("Ø
tagAQMJRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("D
tagAQMJRoleInfo!
roleArr (2.tagAQMJRoleItem
delArr ("◊
tagAQMJRoleEndInfo
u8SeatID (
u32FPeng (
	u32HZPeng (
u32MingGang (
	u32AnGang (
u32FMingGang (

u32FAnGang ("
mjInfo (2.tagAQMJRoleMJInfo!
	hupaitype	 (2.AQMJHuPaiType
n32HuTypePoint
 (
n32GangPoint (
n32HuaPoint (
n32LongZiPoint (
n32PointChange ("G
tagAQMJGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("o
tagAQMJEndInfo
	u8GameNum ($
roleArr (2.tagAQMJRoleEndInfo$
	groupinfo (2.tagAQMJGroupInfo"Î
tagAQMJInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
u8MJNum (
u8BGNum (
u32SeZiNumA (
u32SeZiNumB (
mjBaoPai (2.MJValue
mjBaoPaiMask (2.MJValue
mjHuaPaiArr	 (2.MJValue%
	roleMjArr
 (2.tagAQMJRoleMJInfo#
roomOper (2.tagAQMJStateInfo
endArr (2.tagAQMJEndInfo
bSign ("Å
tagAQMJRoleBuHua
u8SeatID (
eValue (2.MJValue
MoeValue (2.MJValue%

tihuanInfo (2.tagRoleHuPaiInfo"U
AQMJExpRoleOper
eOper (2.AQMJRoleOper$
	roleBuHua (2.tagAQMJRoleBuHua"W
tagAQMJOperInfo!
eOper (2.tagMJBaseRoleOper!
expOper (2.AQMJExpRoleOper"Ç
tagAQMJRoomOper_GameBegin
	u8GameNum (
u32SeZiNumA (
u32SeZiNumB (
mjBaoPaiMask (2.MJValue
mjBaoPaiValue (2.MJValue
mjHuaPaiArr (2.MJValue%
	roleMjArr (2.tagAQMJRoleMJInfo
seatArr (
pointArr	 ("C
tagAQMJRoomOper_BuHua
u8SeatID (
evalue (2.MJValue"Ñ
tagAQMJRoomOper
eOper (2.AQMJRoomOper(
info (2.tagAQMJRoomOper_GameBegin)
	buhuainfo (2.tagAQMJRoomOper_BuHua"•
tagAQMJStateInfo
	u8GameNum (
u8State ( 
exOper (2.tagAQMJRoomOper'
baseOperArr (2.tagMJBaseRoomOper"
roleOper (2.tagAQMJOperInfo"Y
tagAQMJOperLog#
roomOper (2.tagAQMJStateInfo"
roleOper (2.tagAQMJOperInfo"}
tagAQMJTimeLimit#
roomOper (2.tagAQMJStateInfo"
roleOper (2.tagAQMJOperInfo 
endOper (2.tagAQMJEndInfo"Â
tagAQMJLogInfo
	u8GameNum (!
roleArr (2.tagAQMJRoleItem%
	roleMjArr (2.tagAQMJRoleMJInfo
u32SeZiNumA (
u32SeZiNumB (
mjBaoPaiMask (2.MJValue
mjBaoPaiValue (2.MJValue
mjHuaPaiArr (2.MJValue'

roleEndArr	 (2.tagAQMJRoleEndInfo 
operArr
 (2.tagAQMJOperLog
seatArr (
pointArr ("ó
tagKMMJRoleMJInfo
u8SeatID (
u8MJNum (
DingQue (2	.KMMJType
bHuaZhu (
bChaJiao (
mjArr (2.MJValue
pengArr (2.MJValue
minggangArr (2.MJValue
angang	 (2.MJValue
jiagang
 (2.MJValue
chuArr (2.MJValue"J
tagKMMJRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum ("Ø
tagKMMJRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("D
tagKMMJRoleInfo!
roleArr (2.tagKMMJRoleItem
delArr ("§
tagKMMJRoleEndInfo
u8SeatID ("
mjInfo (2.tagKMMJRoleMJInfo
	n32HPoint (

n32FYPoint (
n32FinalPoint (
typeArr (2	.KMMJType"G
tagKMMJGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("o
tagKMMJEndInfo
	u8GameNum ($
roleArr (2.tagKMMJRoleEndInfo$
	groupinfo (2.tagKMMJGroupInfo"˙
tagKMMJInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
u8MJNum (
u8BGNum (

dingQueArr (%
	roleMjArr	 (2.tagKMMJRoleMJInfo#
roomOper
 (2.tagKMMJStateInfo
endArr (2.tagKMMJEndInfo
bSign (">
tagRoleDingQue
u8SeatID (
dingque (2	.KMMJType"U
tagKMMJOperInfo!
eOper (2.tagMJBaseRoleOper
dqOper (2.tagRoleDingQue"i
tagKMMJRoomOper_GameBegin
	u8GameNum (

u32SeZiNum (%
	roleMjArr (2.tagKMMJRoleMJInfo"7
tagKMMJRoomOper_DingQue
	TJdingQue (2	.KMMJType"\
tagKMMJRoomOper_PointChg

chgTypeArr (2	.KMMJType
seatArr (
pointArr ("≥
tagKMMJRoomOper
eOper (2.KMMJRoomOper*
bginfo (2.tagKMMJRoomOper_GameBegin(
dqinfo (2.tagKMMJRoomOper_DingQue,
	pointinfo (2.tagKMMJRoomOper_PointChg"∑
tagKMMJStateInfo
	u8GameNum (
u8State ( 
exOper (2.tagKMMJRoomOper'
baseOperArr (2.tagMJBaseRoomOper"
roleOper (2.tagKMMJOperInfo
u8SeatID ("Y
tagKMMJOperLog#
roomOper (2.tagKMMJStateInfo"
roleOper (2.tagKMMJOperInfo"}
tagKMMJTimeLimit#
roomOper (2.tagKMMJStateInfo"
roleOper (2.tagKMMJOperInfo 
endOper (2.tagKMMJEndInfo"∏
tagKMMJLogInfo
	u8GameNum (!
roleArr (2.tagKMMJRoleItem%
	roleMjArr (2.tagKMMJRoleMJInfo'

roleEndArr (2.tagKMMJRoleEndInfo 
operArr (2.tagKMMJOperLog"@
tagKMMJTempJieSuan
JStype (2	.KMMJType
JSpoint ("ó
tagXZMJRoleMJInfo
u8SeatID (
u8MJNum (
DingQue (2	.XZMJType
bHuaZhu (
bChaJiao (
mjArr (2.MJValue
pengArr (2.MJValue
minggangArr (2.MJValue
angang	 (2.MJValue
jiagang
 (2.MJValue
chuArr (2.MJValue"J
tagXZMJRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum ("Ø
tagXZMJRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("D
tagXZMJRoleInfo!
roleArr (2.tagXZMJRoleItem
delArr ("§
tagXZMJRoleEndInfo
u8SeatID ("
mjInfo (2.tagXZMJRoleMJInfo
	n32HPoint (

n32FYPoint (
n32FinalPoint (
typeArr (2	.XZMJType"G
tagXZMJGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("o
tagXZMJEndInfo
	u8GameNum ($
roleArr (2.tagXZMJRoleEndInfo$
	groupinfo (2.tagXZMJGroupInfo"˙
tagXZMJInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
u8MJNum (
u8BGNum (

dingQueArr (%
	roleMjArr	 (2.tagXZMJRoleMJInfo#
roomOper
 (2.tagXZMJStateInfo
endArr (2.tagXZMJEndInfo
bSign ("B
tagXZMJRoleDingQue
u8SeatID (
dingque (2	.XZMJType"~
tagXZMJOperInfo!
eOper (2.tagMJBaseRoleOper#
dqOper (2.tagXZMJRoleDingQue#
exC3Oper (2.tagXZMJexChange3"{
tagXZMJRoomOper_GameBegin
	u8GameNum (

u32SeZiNum (%
	roleMjArr (2.tagXZMJRoleMJInfo
u8ShunXu ("0
tagXZMJexChange3

roleTJexC3 (2.MJValue"Q
tagXZMJRoomOper_exChange3$
	allTJexC3 (2.tagXZMJexChange3
roleID ("Z
tagXZMJRoomOper_DingQue
	TJdingQue (2	.XZMJType!
ex3arr (2.tagXZMJexChange3"\
tagXZMJRoomOper_PointChg

chgTypeArr (2	.XZMJType
seatArr (
pointArr ("·
tagXZMJRoomOper
eOper (2.XZMJRoomOper*
bginfo (2.tagXZMJRoomOper_GameBegin(
dqinfo (2.tagXZMJRoomOper_DingQue,
	pointinfo (2.tagXZMJRoomOper_PointChg,
exC3info (2.tagXZMJRoomOper_exChange3"∑
tagXZMJStateInfo
	u8GameNum (
u8State ( 
exOper (2.tagXZMJRoomOper'
baseOperArr (2.tagMJBaseRoomOper"
roleOper (2.tagXZMJOperInfo
u8SeatID ("Y
tagXZMJOperLog#
roomOper (2.tagXZMJStateInfo"
roleOper (2.tagXZMJOperInfo"}
tagXZMJTimeLimit#
roomOper (2.tagXZMJStateInfo"
roleOper (2.tagXZMJOperInfo 
endOper (2.tagXZMJEndInfo"∏
tagXZMJLogInfo
	u8GameNum (!
roleArr (2.tagXZMJRoleItem%
	roleMjArr (2.tagXZMJRoleMJInfo'

roleEndArr (2.tagXZMJRoleEndInfo 
operArr (2.tagXZMJOperLog"@
tagXZMJTempJieSuan
JStype (2	.XZMJType
JSpoint ("ó
tagXLMJRoleMJInfo
u8SeatID (
u8MJNum (
DingQue (2	.XLMJType
bHuaZhu (
bChaJiao (
mjArr (2.MJValue
pengArr (2.MJValue
minggangArr (2.MJValue
angang	 (2.MJValue
jiagang
 (2.MJValue
chuArr (2.MJValue"J
tagXLMJRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum ("Ø
tagXLMJRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("D
tagXLMJRoleInfo!
roleArr (2.tagXLMJRoleItem
delArr ("§
tagXLMJRoleEndInfo
u8SeatID ("
mjInfo (2.tagXLMJRoleMJInfo
	n32HPoint (

n32FYPoint (
n32FinalPoint (
typeArr (2	.XLMJType"G
tagXLMJGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("o
tagXLMJEndInfo
	u8GameNum ($
roleArr (2.tagXLMJRoleEndInfo$
	groupinfo (2.tagXLMJGroupInfo"˙
tagXLMJInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
u8MJNum (
u8BGNum (

dingQueArr (%
	roleMjArr	 (2.tagXLMJRoleMJInfo#
roomOper
 (2.tagXLMJStateInfo
endArr (2.tagXLMJEndInfo
bSign ("B
tagXLMJRoleDingQue
u8SeatID (
dingque (2	.XLMJType"~
tagXLMJOperInfo!
eOper (2.tagMJBaseRoleOper#
dqOper (2.tagXLMJRoleDingQue#
exC3Oper (2.tagXLMJexChange3"{
tagXLMJRoomOper_GameBegin
	u8GameNum (

u32SeZiNum (%
	roleMjArr (2.tagXLMJRoleMJInfo
u8ShunXu ("0
tagXLMJexChange3

roleTJexC3 (2.MJValue"Q
tagXLMJRoomOper_exChange3$
	allTJexC3 (2.tagXLMJexChange3
roleID ("Z
tagXLMJRoomOper_DingQue
	TJdingQue (2	.XLMJType!
ex3arr (2.tagXLMJexChange3"\
tagXLMJRoomOper_PointChg

chgTypeArr (2	.XLMJType
seatArr (
pointArr ("·
tagXLMJRoomOper
eOper (2.XLMJRoomOper*
bginfo (2.tagXLMJRoomOper_GameBegin(
dqinfo (2.tagXLMJRoomOper_DingQue,
	pointinfo (2.tagXLMJRoomOper_PointChg,
exC3info (2.tagXLMJRoomOper_exChange3"∑
tagXLMJStateInfo
	u8GameNum (
u8State ( 
exOper (2.tagXLMJRoomOper'
baseOperArr (2.tagMJBaseRoomOper"
roleOper (2.tagXLMJOperInfo
u8SeatID ("Y
tagXLMJOperLog#
roomOper (2.tagXLMJStateInfo"
roleOper (2.tagXLMJOperInfo"}
tagXLMJTimeLimit#
roomOper (2.tagXLMJStateInfo"
roleOper (2.tagXLMJOperInfo 
endOper (2.tagXLMJEndInfo"∏
tagXLMJLogInfo
	u8GameNum (!
roleArr (2.tagXLMJRoleItem%
	roleMjArr (2.tagXLMJRoleMJInfo'

roleEndArr (2.tagXLMJRoleEndInfo 
operArr (2.tagXLMJOperLog"@
tagXLMJTempJieSuan
JStype (2	.XLMJType
JSpoint ("
tagFYBZLogInfo"o
tagFYBZRoomDataInfo
u32SLNum (
u32SBNum (
u32HNum (
	u32HBLNum (
u32DGNum ("Ø
tagFYBZRoleItem
	u32RoleID ("
roleInfo (2.tagRoleRoomInfo
n32Point (
u8SeatID (
bAccpet (
eState (2.RoomRoleState
bDeposit ("D
tagFYBZRoleInfo!
roleArr (2.tagFYBZRoleItem
delArr ("É
tagFYBZRoleComInfo
u8SeatID (
pointArr (
bDG (
n32BasePoint (
u32Rate (
n32FinalPoint ("Œ
tagFYBZRoleEndInfo
u8SeatID (
bHBL (
typeArr (2	.FYBZType
typeex (2.FYBZTSType
pokerArr (#
comArr (2.tagFYBZRoleComInfo
pointArr (
n32PointChange ("G
tagFYBZGroupInfo!
roleArr (2.tagRoleRoomInfo
pointArr ("Ü
tagFYBZEndInfo
	u8GameNum ($
roleArr (2.tagFYBZRoleEndInfo
otherPokerArr ($
	groupinfo (2.tagFYBZGroupInfo"¯
tagFYBZInitInfo
	u8GameNum ("
ruleInfo (2.tagRoomRuleInfo
pokerArr (
exType (2.FYBZTSType
u32exTypePoint (
bSet (
u32WriteTime (
endArr (2.tagFYBZEndInfo
u32InitTime	 (
bSign
 ("@
tagFYBZOperInfo
eOper (2.FYBZRoleOper
paraArr ("o
tagFYBZSendPokerInfo
u8SeatID (
pokerArr (
typeex (2.FYBZTSType
u32exTypePoint (" 
tagFYBZSetInfo
setArr ("3
tagFYBZRoleReset
seatArr (
setArr ("°
FYBZRoomOperInfo
eOper (2.FYBZRoomOper'
sendInfo (2.tagFYBZSendPokerInfo 
setInfo (2.tagFYBZSetInfo$
	resetInfo (2.tagFYBZRoleReset"M
tagFYBZStateInfo
	u8GameNum (&
roomOperArr (2.FYBZRoomOperInfo"6
tagRoomSimLogItem
roleArr (
pointArr ("≥
tagRoomSimLogInfo
	u32OnlyID (
	u32RoomID (
eType (2	.RoomType
n32BeginTime (!
roleArr (2.tagRoleRoomInfo%
	resultArr (2.tagRoomSimLogItem"Û
tagRoomLogInfo
	eRoomType (2	.RoomType
	u32OnlyID (
	u32RoomID (#
	tlsszInfo (2.tagTLSSZLogInfo
nnInfo (2.tagNNLogInfo#
	jxsszInfo (2.tagJXSSZLogInfo#
	jhsszInfo (2.tagJHSSZLogInfo#
	xssszInfo (2.tagXSSSZLogInfo#
	ywsszInfo	 (2.tagYWSSZLogInfo#
	lhsszInfo
 (2.tagLHSSZLogInfo!
ncmjInfo (2.tagNCMJLogInfo#
	jysszInfo (2.tagJYSSZLogInfo!
aqmjInfo (2.tagAQMJLogInfo!
kmmjInfo (2.tagKMMJLogInfo!
xzmjInfo (2.tagXZMJLogInfo!
xlmjInfo (2.tagXLMJLogInfo)

scriptInfo (2.tagScriptRoomLogInfo!
fybzInfo (2.tagFYBZLogInfo"¢
tagRoleRoomDataInfo(
	tlsszinfo (2.tagTLSSZRoomDataInfo"
nninfo (2.tagNNRoomDataInfo(
	jxsszinfo (2.tagJXSSZRoomDataInfo(
	jhsszInfo (2.tagJHSSZRoomDataInfo(
	xssszInfo (2.tagXSSSZRoomDataInfo(
	ywsszInfo (2.tagYWSSZRoomDataInfo(
	lhsszInfo (2.tagLHSSZRoomDataInfo&
ncmjInfo (2.tagNCMJRoomDataInfo(
	jysszInfo	 (2.tagJYSSZRoomDataInfo&
aqmjInfo
 (2.tagAQMJRoomDataInfo&
kmmjInfo (2.tagKMMJRoomDataInfo&
xzmjInfo (2.tagXZMJRoomDataInfo&
xlmjInfo (2.tagXLMJRoomDataInfo(
hzmjInfo (2.tagScriptRoomDataInfo'
ddzInfo (2.tagScriptRoomDataInfo)
	ncmjsInfo (2.tagScriptRoomDataInfo(
szmjInfo (2.tagScriptRoomDataInfo&
fybzInfo (2.tagFYBZRoomDataInfo)
	ketmjInfo (2.tagScriptRoomDataInfo)
	nxzmjInfo (2.tagScriptRoomDataInfo)
	nxlmjInfo (2.tagScriptRoomDataInfo(
hsmjInfo (2.tagScriptRoomDataInfo"ª
tagRoomOperInfo$
	tlsszInfo (2.tagTLSSZOperInfo
nnInfo (2.tagNNOperInfo$
	jxsszInfo (2.tagJXSSZOperInfo$
	jhsszInfo (2.tagJHSSZOperInfo$
	xssszInfo (2.tagXSSSZOperInfo$
	ywsszInfo (2.tagYWSSZOperInfo$
	lhsszInfo (2.tagLHSSZOperInfo"
ncmjInfo (2.tagNCMJOperInfo$
	jysszInfo	 (2.tagJYSSZOperInfo"
aqmjInfo
 (2.tagAQMJOperInfo"
kmmjInfo (2.tagKMMJOperInfo"
xzmjInfo (2.tagXZMJOperInfo"
xlmjInfo (2.tagXLMJOperInfo&

scriptInfo (2.tagScriptRoleOper"
fybzInfo (2.tagFYBZOperInfo"Ÿ
tagRoomInitInfo
	eRoomType (2	.RoomType$
	tlsszInfo (2.tagTLSSZInitInfo
nnInfo (2.tagNNInitInfo$
	jxsszInfo (2.tagJXSSZInitInfo$
	jhsszInfo (2.tagJHSSZInitInfo$
	xssszInfo (2.tagXSSSZInitInfo$
	ywsszInfo (2.tagYWSSZInitInfo$
	lhsszInfo (2.tagLHSSZInitInfo"
ncmjInfo	 (2.tagNCMJInitInfo$
	jysszInfo
 (2.tagJYSSZInitInfo"
aqmjInfo (2.tagAQMJInitInfo"
kmmjInfo (2.tagKMMJInitInfo"
xzmjInfo (2.tagXZMJInitInfo"
xlmjInfo (2.tagXLMJInitInfo&

scriptInfo (2.tagScriptRoomInit"
fybzInfo (2.tagFYBZInitInfo"Õ
tagRoomEndInfo
	eRoomType (2	.RoomType#
	tlsszInfo (2.tagTLSSZEndInfo
nnInfo (2.tagNNEndInfo#
	jxsszInfo (2.tagJXSSZEndInfo#
	jhsszInfo (2.tagJHSSZEndInfo#
	xssszInfo (2.tagXSSSZEndInfo#
	ywsszInfo (2.tagYWSSZEndInfo#
	lhsszInfo (2.tagLHSSZEndInfo!
ncmjInfo	 (2.tagNCMJEndInfo#
	jysszInfo
 (2.tagJYSSZEndInfo!
aqmjInfo (2.tagAQMJEndInfo!
kmmjInfo (2.tagKMMJEndInfo!
xzmjInfo (2.tagXZMJEndInfo!
xlmjInfo (2.tagXLMJEndInfo)

scriptInfo (2.tagScriptRoomEndInfo!
fybzInfo (2.tagFYBZEndInfo"Ë
tagRoomStateInfo
	eRoomType (2	.RoomType%
	tlsszInfo (2.tagTLSSZStateInfo
nnInfo (2.tagNNStateInfo%
	jxsszInfo (2.tagJXSSZStateInfo%
	jhsszInfo (2.tagJHSSZStateInfo%
	xssszInfo (2.tagXSSSZStateInfo%
	ywsszInfo (2.tagYWSSZStateInfo%
	lhsszInfo (2.tagLHSSZStateInfo#
ncmjInfo	 (2.tagNCMJStateInfo%
	jysszInfo
 (2.tagJYSSZStateInfo#
aqmjInfo (2.tagAQMJStateInfo#
kmmjInfo (2.tagKMMJStateInfo#
xzmjInfo (2.tagXZMJStateInfo#
xlmjInfo (2.tagXLMJStateInfo&

scriptInfo (2.tagScriptRoomOper#
fybzInfo (2.tagFYBZStateInfo"›
tagRoomRoleInfo
	eRoomType (2	.RoomType$
	tlsszInfo (2.tagTLSSZRoleInfo
nnInfo (2.tagNNRoleInfo$
	jxsszInfo (2.tagJXSSZRoleInfo$
	jhsszInfo (2.tagJHSSZRoleInfo$
	xssszInfo (2.tagXSSSZRoleInfo$
	ywsszInfo (2.tagYWSSZRoleInfo$
	lhsszInfo (2.tagLHSSZRoleInfo"
ncmjInfo	 (2.tagNCMJRoleInfo$
	jysszInfo
 (2.tagJYSSZRoleInfo"
aqmjInfo (2.tagAQMJRoleInfo"
kmmjInfo (2.tagKMMJRoleInfo"
xzmjInfo (2.tagXZMJRoleInfo"
xlmjInfo (2.tagXLMJRoleInfo*

scriptInfo (2.tagScriptRoomRoleInfo"
fybzInfo (2.tagFYBZRoleInfo"ˆ
tagRoleGroupInfo
u32TotalGameNum (
u32TodayGameNum (
bTodatFirGameReward (
u32ZhuanPanNum (
u32WeekZhuanPanUse (
u32TodayFXRewardNum (
	u32shopid (
u32count (
u32TodayWeiXinFXcount	 ("Ö
tagRoleExInfo&

roomlogArr (2.tagRoomSimLogInfo&
roominfo (2.tagRoleRoomDataInfo$
	groupInfo (2.tagRoleGroupInfo"Ç
tagRoleInfo

strAccount (	
u32Password (
n32FreezeEndTime (
	u32RoleID (
strRoleName (	

strFaceURL (	
n32Gold (

u32YuanBao (
u32RoomCard	 (
n32LastLoginTime
 (
n32LastOnlineTime (
	u32BindID (
	n32UserID (
u32MagicCount (
strIdentity (	
bGender ("

roleexInfo (2.tagRoleExInfo"+
tagRoleRuntimeData
delroomlogarr ("«
tagLogRoleLoginOrOutInfo
	u32RoleID (
	u32BindID (
eType (2
.LoginType
u32YuanBaoNum (
u32RoomCardNum (

n32GoldNum (
bLogOutOrIn (

n32LogTime ("⁄
tagLogRoleJoinOrLeaveRoomInfo
	u32RoleID (
	u32BindID (
eType (2	.RoomType
eState (2.RoomStateType
u32YuanBaoNum (
u32RoomCardNum (

n32GoldNum (
u32UseYuanBaoNum (
u32UseRoomCardNum	 (
bLeaveOrJoin
 (
	u8GameNum (
	u8RoleNum (

n32LogTime (
	u32RoomID ("º
tagRoleCreateRoomInfo
	u32RoleID (
	u32BindID (
eType (2	.RoomType
eState (2.RoomStateType
u32UseYuanBaoNum (
u32UseRoomCardNum (
u32YuanBaoNum (
u32RoomCardNum (

n32GoldNum	 (
	u8GameNum
 (
	u8RoleNum (

n32LogTime (
	u32RoomID ("ª
tagRoleRenewRoomInfo
	u32RoleID (
	u32BindID (
eType (2	.RoomType
eState (2.RoomStateType
	u8GameNum (
	u8RoleNum (
u32UseYuanBaoNum (
u32UseRoomCardNum (
u32YuanBaoNum	 (
u32RoomCardNum
 (

n32GoldNum (

n32LogTime (
	u32RoomID ("†
tagRoleYuanBaoChangeInfo
	u32RoleID (
	u32BindID (
eState (2.YuanBaoState
n32ChangeNum (
u32YuanBaoNum (

n32LogTime ("£
tagRoleRoomCardChangeInfo
	u32RoleID (
	u32BindID (
eState (2.RoomCardState
n32ChangeNum (
u32RoomCardNum (

n32LogTime ("•
tagRoleCreateOrderInfo
	u32RoleID (
	u32BindID (

u64OrderID (
	u32ShopID (
	u32RMBNum (
eType (2.PayType

n32LogTime ("î
tagRoleSucessOrderInfo
	u32RoleID (
	u32BindID (

u64OrderID (
eType (2.PayType

strPayInfo (	
	u32RMBNum (
	u32ShopID (
u32AddYuanBaoNum (
u32AddRoomCardNum	 (

n32LogTime
 (
	n32UserID (
	n32BigUid ("e
tagErrorOrderInfo

u64OrderID (

strPayInfo (	
strErrorInfo (	

n32LogTime ("ô
tagRoomCloseInfo
	u32RoomID (
eType (2	.RoomType
eState (2.RoomStateType
	u8GameNum (
	u8RoleNum (

n32LogTime ("¡
tagRoomStopInfo
	u32RoomID (
eType (2	.RoomType
eState (2.RoomStateType
	u8GameNum (
u8NowGameNum (
	u8RoleNum (
	u32RoleID (

n32LogTime ("W
tagGMOperInfo
saccount (	
n32ip (

n32LogTime (
	sdescript (	"±
tagRoomRoleLogInfo
	u32RoomID (
eType (2	.RoomType
eState (2.RoomStateType

strLogInfo (	
	u32RoleID (
strRoleName (	

n32LogTime ("Ã

tagLogInfo+
loginArr (2.tagLogRoleLoginOrOutInfo/
roomArr (2.tagLogRoleJoinOrLeaveRoomInfo-
createroomArr (2.tagRoleCreateRoomInfo'
renewArr (2.tagRoleRenewRoomInfo-

yuanbaoArr (2.tagRoleYuanBaoChangeInfo/
roomcardArr (2.tagRoleRoomCardChangeInfo/
createorderArr (2.tagRoleCreateOrderInfo/
sucessorderArr (2.tagRoleSucessOrderInfo)
errororderArr	 (2.tagErrorOrderInfo'
roomcloseArr
 (2.tagRoomCloseInfo%
roomstopArr (2.tagRoomStopInfo!
	gmoperArr (2.tagGMOperInfo(
roomroleArr (2.tagRoomRoleLogInfo*[
VoteType
VoteType_Leave
VoteType_Kick
VoteType_Close
VoteType_IPCheck*;
PayType
PayType_SFB

PayType_JY
PayType_IOS*J
	LoginType
LoginType_QQ
LoginType_WeiXin
LoginType_Account*¬
RoleInfoType
RoleInfoType_Login
RoleInfoType_GameLog
RoleInfoType_TLSSZ
RoleInfoType_NN
RoleInfoType_JXSSZ
RoleInfoType_JHSSZ
RoleInfoType_LHSSZ
RoleInfoType_XSSSZ
RoleInfoType_YWSSZ	
RoleInfoType_JYSSZ

RoleInfoType_NCMJ
RoleInfoType_HZMJ
RoleInfoType_AQMJ
RoleInfoType_KMMJ
RoleInfoType_XZMJ
RoleInfoType_XLMJ
RoleInfoType_DDZ
RoleInfoType_NCMJS
RoleInfoType_SZMJ
RoleInfoType_FYBZ
RoleInfoType_KETMJ
RoleInfoType_NXZMJ
RoleInfoType_NXLMJ
RoleInfoType_HSMJ*V
RoomRoleState
RoomRoleState_OL
RoomRoleState_Leave
RoomRoleState_Drop*«
RoomType
RoomType_YHMJ
RoomType_TLSSZ
RoomType_NN
RoomType_YWSSZ
RoomType_XSSSZ
RoomType_LHSSZ
RoomType_JXSSZ
RoomType_JHSSZ
RoomType_AQMJ	
RoomType_KMMJ

RoomType_NCMJ
RoomType_JYSSZ
RoomType_XZMJ
RoomType_XLMJ
RoomType_HZMJ
RoomType_DDZ
RoomType_NCMJS
RoomType_SZMJ
RoomType_FYBZ
RoomType_KETMJ
RoomType_NXZMJ
RoomType_NXLMJ
RoomType_HSMJ*v
RoomStateType
RoomStateType_Normal
RoomStateType_AARoom
RoomStateType_System
RoomStateType_Match*ò
MJValue
MJValue_Error 
MJValue_Tiao_1
MJValue_Tiao_2
MJValue_Tiao_3
MJValue_Tiao_4
MJValue_Tiao_5
MJValue_Tiao_6
MJValue_Tiao_7
MJValue_Tiao_8
MJValue_Tiao_9	
MJValue_Wan_1

MJValue_Wan_2
MJValue_Wan_3
MJValue_Wan_4
MJValue_Wan_5
MJValue_Wan_6
MJValue_Wan_7
MJValue_Wan_8
MJValue_Wan_9
MJValue_Tong_1
MJValue_Tong_2
MJValue_Tong_3
MJValue_Tong_4
MJValue_Tong_5
MJValue_Tong_6
MJValue_Tong_7
MJValue_Tong_8
MJValue_Tong_9
MJValue_Feng_Dong
MJValue_Feng_Nan
MJValue_Feng_Xi
MJValue_Feng_Bei
MJValue_Jian_Zhong 
MJValue_Jian_Fa!
MJValue_Jian_Bai"
MJValue_Hua_Chun#
MJValue_Hua_Xia$
MJValue_Hua_Qiu%
MJValue_Hua_Dong&
MJValue_Hua_Mei'
MJValue_Hua_Lan(
MJValue_Hua_Zhu)
MJValue_Hua_Ju*
MJValue_Max+

MJValue_LZ,
MJValue_All-

MJValue_DZ.

MJValue_SZ/

MJValue_KZ0
MJValue_13L1

MJValue_HP2
MJValue_FYS3
MJValue_JYS4*B
	HuPaiType
HuPaiType_3N
HuPaiType_7D
HuPaiType_13L* 

MJRoleOper
RoleOper_ChuPai
RoleOper_LChiPai
RoleOper_RChiPai
RoleOper_MChiPai
RoleOper_PengPai
RoleOper_GangPai
RoleOper_MoPai
RoleOper_TingPai
RoleOper_HuPai	
RoleOper_QiangGang

RoleOper_KaiGang
RoleOper_JiaGang
RoleOper_Guo
RoleOper_GangMo
RoleOper_Max*µ

MJRoomOper
RoomOper_ChuPai
RoomOper_LChiPai
RoomOper_RChiPai
RoomOper_MChiPai
RoomOper_PengPai
RoomOper_GangPai
RoomOper_MoPai
RoomOper_TingPai
RoomOper_HuPai	
RoomOper_QiangGang

RoomOper_KaiGang
RoomOper_JiaGang
RoomOper_Guo
RoomOper_Max*i
NNZJType
NNZJType_Index
NNZJType_Rank
NNZJType_Non
NNZJType_Poker
NNZJType_Win*x

NCMJXJType
NCMJXJType_KJSXFJ
NCMJXJType_TYSG
NCMJXJType_ZJSXFJ
NCMJXJType_WXJ
NCMJXJType_HTYX*ü
DDZRoomOper
DDZRoomOper_JiaoDiZhu
DDZRoomOper_QiangDiZhu
DDZRoomOper_FaPai
DDZRoomOper_SetDiZhu
DDZRoomOper_ChuPai
DDZRoomOper_RateChg
DDZRoomOper_GameStar
DDZRoomOper_GameStop
DDZRoomOper_Reset	
DDZRoomOper_MingPai

DDZRoomOper_Guo*ä
DDZRoleOper
DDZRoleOper_MingPai
DDZRoleOper_JiaoDiZhu
DDZRoleOper_QiangDiZhu
DDZRoleOper_ChuPai
DDZRoleOper_Guo*v
DDZRoomState
DDZRoomState_Non 
DDZRoomState_JiaoDiZhu
DDZRoomState_QiangDiZhu
DDZRoomState_ChuPai*™
DDZPokerType
DDZPokerType_Err 
DDZPokerType_HJ
DDZPokerType_ZD
DDZPokerType_FJSDY
DDZPokerType_FJSDL
DDZPokerType_SDL
DDZPokerType_SSZ
DDZPokerType_LSZ
DDZPokerType_SDY
DDZPokerType_SZ	
DDZPokerType_SP

DDZPokerType_DZ
DDZPokerType_ST*ë
MJRoleOperS
MJRoleOperS_Error 
MJRoleOperS_MoPai
MJRoleOperS_LChiPai
MJRoleOperS_RChiPai
MJRoleOperS_MChiPai
MJRoleOperS_PengPai
MJRoleOperS_GangPai
MJRoleOperS_KaiGang
MJRoleOperS_JiaGang
MJRoleOperS_GangMo	
MJRoleOperS_QiangGang

MJRoleOperS_HuPai
MJRoleOperS_ChuPai
MJRoleOperS_ZMHuPai
MJRoleOperS_BeQiangGang
MJRoleOperS_Guo
MJRoleOperS_DQ
MJRoleOperS_Huan3Zhang
MJRoleOperS_YPDX
MJRoleOperS_PointChg
MJRoleOperS_LiangPai*Ü
MJRoomOperS
MJRoomOperS_Error 
MJRoomOperS_MoPai
MJRoomOperS_LChiPai
MJRoomOperS_RChiPai
MJRoomOperS_MChiPai
MJRoomOperS_PengPai
MJRoomOperS_GangPai
MJRoomOperS_KaiGang
MJRoomOperS_JiaGang
MJRoomOperS_GangMo	
MJRoomOperS_QiangGang

MJRoomOperS_HuPai
MJRoomOperS_ChuPai
MJRoomOperS_ZMHuPai
MJRoomOperS_Guo
MJRoomOperS_Star
MJRoomOperS_Stop
MJRoomOperS_DQ
MJRoomOperS_Huan3Zhang
MJRoomOperS_YPDX
MJRoomOperS_LiangPai*◊

MJInfoType
MJInfoType_Err 
MJInfoType_PH
MJInfoType_DDP
MJInfoType_JYS
MJInfoType_FYS
MJInfoType_QYS
MJInfoType_QQR
MJInfoType_QGH
MJInfoType_GSKH
MJInfoType_HDLY	
MJInfoType_KK

MJInfoType_HZG
MJInfoType_FCG
MJInfoType_LZG
MJInfoType_LZPG
MJInfoType_AG
MJInfoType_MG
MJInfoType_JG
MJInfoType_MQQ
MJInfoType_DP
MJInfoType_ZM
MJInfoType_YP
MJInfoType_CB
MJInfoType_BCB
MJInfoType_YZM
MJInfoType_RZM
MJInfoType_YLY
MJInfoType_RLY
MJInfoType_CT
MJInfoType_SJF
MJInfoType_XJF
MJInfoType_BWJ
MJInfoType_GJ 
MJInfoType_DG!
MJInfoType_JHY"
MJInfoType_DZD#
MJInfoType_JD$
MJInfoType_ZJ%
MJInfoType_TH&
MJInfoType_DH'
MJInfoType_DQD(
MJInfoType_XQD)
MJInfoType_SSL*
MJInfoType_QXSSL+
MJInfoType_CZ,
MJInfoType_QD-
MJInfoType_HHQD.
MJInfoType_LHHQD/
MJInfoType_SHHQD0
MJInfoType_BT1
MJInfoType_CP2
MJInfoType_GB3
MJInfoType_GP4
MJInfoType_PG5
MJInfoType_GSP6
MJInfoType_YPDX7
MJInfoType_QDDH8
MJInfoType_QQD9
MJInfoType_LQD:
MJInfoType_QLQD;
MJInfoType_JGD<
MJInfoType_QJGD=
MJInfoType_JJGD>
MJInfoType_JDH?
MJInfoType_QDY@
MJInfoType_QYJA
MJInfoType_SBLHB
MJInfoType_QSBLHC
MJInfoType_GFD
MJInfoType_XYE
MJInfoType_HJZYF
MJInfoType_HZG
MJInfoType_CJH
MJInfoType_DQTiaoI
MJInfoType_DQWanJ
MJInfoType_DQTongK
MJInfoType_GenL
MJInfoType_LiangPaiM
MJInfoType_SanPuDaoN
MJInfoType_DaHuO*>

BZRoomOper
BZRoomOper_GameBegin
BZRoomOper_GameEnd*<

BZRoleOper
BZRoleOper_SetPoker
BZRoleOper_DiuPai*f
BZType
BZType_Error 
	BZType_SP
	BZType_DZ
	BZType_SZ
	BZType_ZD

BZType_THS*e
BZTSType
BZTSType_Error 
BZTSType_SSZ
BZTSType_TZ
BZTSType_SDZ
BZTSType_YTL*A
SSZRoomOper
SSZRoomOper_GameBegin
SSZRoomOper_GameEnd*?
SSZRoleOper
SSZRoleOper_SetPoker
SSZRoleOper_DiuPai*≠
SSZType
SSZType_Error 

SSZType_SP

SSZType_DZ

SSZType_LD

SSZType_ST

SSZType_SZ

SSZType_TH

SSZType_HL

SSZType_ZD
SSZType_THS	*Ø
	SSZTSType
SSZTSType_Error 
SSZTSType_SSZ
SSZTSType_STH
SSZTSType_LDB
SSZTSType_QD8
SSZTSType_QD9
SSZTSType_QD10
SSZTSType_QDJ
SSZTSType_WDYK
SSZTSType_QBYDR	
SSZTSType_QRYDB

SSZTSType_YTL
SSZTSType_QB
SSZTSType_QR
SSZTSType_ZZQL*¡
	TLSSZType
TLSSZType_Err 
TLSSZType_SP
TLSSZType_DZ
TLSSZType_LD
TLSSZType_ST
TLSSZType_SZ
TLSSZType_TH
TLSSZType_HL
TLSSZType_ZD
TLSSZType_THS	*¯
TLSSZTSType
TLSSZTSType_Err 
TLSSZTSType_SSZ
TLSSZTSType_STH
TLSSZTSType_LDB
TLSSZTSType_WDYK
TLSSZTSType_QBYDR
TLSSZTSType_QRYDB
TLSSZTSType_YTL
TLSSZTSType_QB
TLSSZTSType_QR	
TLSSZTSType_ZZQL
*M
TLSSZRoleOper
TLSSZRoleOper_SetAllFinish
TLSSZRoleOper_SetTSPoker*d
TLSSZRoomOper
TLSSZRoomOper_SendPoker
TLSSZRoomOper_RoleSet
TLSSZRoomOper_RoleReset*Ï
NNType
	NNType_WN
	NNType_N1
	NNType_N2
	NNType_N3
	NNType_N4
	NNType_N5
	NNType_N6
	NNType_N7
	NNType_N8	
	NNType_N9

	NNType_NN

NNType_SHN

NNType_WHN

NNType_WXN
	NNType_ZD*c
NNRoomState
NNRoomState_Null 
NNRoomState_QZ
NNRoomState_Rate
NNRoomState_Send*f
NNRoleState
NNRoleState_QZ
NNRoleState_Rate
NNRoleState_Set
NNRoleState_GameStar*¡
	JXSSZType
JXSSZType_Err 
JXSSZType_SP
JXSSZType_DZ
JXSSZType_LD
JXSSZType_ST
JXSSZType_SZ
JXSSZType_TH
JXSSZType_HL
JXSSZType_ZD
JXSSZType_THS	*Õ
JXSSZTSType
JXSSZTSType_Err 
JXSSZTSType_SSZ
JXSSZTSType_STH
JXSSZTSType_LDB
JXSSZTSType_QD8
JXSSZTSType_QD9
JXSSZTSType_QD10
JXSSZTSType_QDJ
JXSSZTSType_WDYK
JXSSZTSType_QBYDR	
JXSSZTSType_QRYDB

JXSSZTSType_YTL
JXSSZTSType_QB
JXSSZTSType_QR
JXSSZTSType_ZZQL*M
JXSSZRoleOper
JXSSZRoleOper_SetAllFinish
JXSSZRoleOper_SetTSPoker*d
JXSSZRoomOper
JXSSZRoomOper_SendPoker
JXSSZRoomOper_RoleSet
JXSSZRoomOper_RoleReset*¡
	YWSSZType
YWSSZType_Err 
YWSSZType_SP
YWSSZType_DZ
YWSSZType_LD
YWSSZType_ST
YWSSZType_SZ
YWSSZType_TH
YWSSZType_HL
YWSSZType_ZD
YWSSZType_THS	*¯
YWSSZTSType
YWSSZTSType_Err 
YWSSZTSType_SSZ
YWSSZTSType_STH
YWSSZTSType_LDB
YWSSZTSType_WDYK
YWSSZTSType_QBYDR
YWSSZTSType_QRYDB
YWSSZTSType_YTL
YWSSZTSType_QB
YWSSZTSType_QR	
YWSSZTSType_ZZQL
*M
YWSSZRoleOper
YWSSZRoleOper_SetAllFinish
YWSSZRoleOper_SetTSPoker*d
YWSSZRoomOper
YWSSZRoomOper_SendPoker
YWSSZRoomOper_RoleSet
YWSSZRoomOper_RoleReset*¡
	XSSSZType
XSSSZType_Err 
XSSSZType_SP
XSSSZType_DZ
XSSSZType_LD
XSSSZType_ST
XSSSZType_SZ
XSSSZType_TH
XSSSZType_HL
XSSSZType_ZD
XSSSZType_THS	*/
XSSSZRoleOper
XSSSZRoleOper_SetAllFinish*d
XSSSZRoomOper
XSSSZRoomOper_SendPoker
XSSSZRoomOper_RoleSet
XSSSZRoomOper_RoleReset*¡
	LHSSZType
LHSSZType_Err 
LHSSZType_SP
LHSSZType_DZ
LHSSZType_LD
LHSSZType_ST
LHSSZType_SZ
LHSSZType_TH
LHSSZType_HL
LHSSZType_ZD
LHSSZType_THS	*/
LHSSZRoleOper
LHSSZRoleOper_SetAllFinish*d
LHSSZRoomOper
LHSSZRoomOper_SendPoker
LHSSZRoomOper_RoleSet
LHSSZRoomOper_RoleReset*¡
	JHSSZType
JHSSZType_Err 
JHSSZType_SP
JHSSZType_DZ
JHSSZType_LD
JHSSZType_ST
JHSSZType_SZ
JHSSZType_TH
JHSSZType_HL
JHSSZType_ZD
JHSSZType_THS	*/
JHSSZRoleOper
JHSSZRoleOper_SetAllFinish*d
JHSSZRoomOper
JHSSZRoomOper_SendPoker
JHSSZRoomOper_RoleSet
JHSSZRoomOper_RoleReset*Å
NCMJType
NCMJType_ZM
NCMJType_GSKH
NCMJType_QGH
NCMJType_DP
NCMJType_JD
NCMJType_TH
NCMJType_DH
NCMJType_JDTH
NCMJType_JDDH	
NCMJType_JBHP

NCMJType_QDD
NCMJType_QXD
NCMJType_SSL
NCMJType_QXSSL
NCMJType_CZ
NCMJType_BWJ
NCMJType_GJ
NCMJType_DG
NCMJType_DZD
NCMJType_JHY
NCMJType_ZJ**
NCMJRoomOper
NCMJRoomOper_GameBegin*¡
	JYSSZType
JYSSZType_Err 
JYSSZType_SP
JYSSZType_DZ
JYSSZType_LD
JYSSZType_ST
JYSSZType_SZ
JYSSZType_TH
JYSSZType_HL
JYSSZType_ZD
JYSSZType_THS	*¯
JYSSZTSType
JYSSZTSType_Err 
JYSSZTSType_SSZ
JYSSZTSType_STH
JYSSZTSType_LDB
JYSSZTSType_WDYK
JYSSZTSType_QBYDR
JYSSZTSType_QRYDB
JYSSZTSType_YTL
JYSSZTSType_QB
JYSSZTSType_QR	
JYSSZTSType_ZZQL
*M
JYSSZRoleOper
JYSSZRoleOper_SetAllFinish
JYSSZRoleOper_SetTSPoker*d
JYSSZRoomOper
JYSSZRoomOper_SendPoker
JYSSZRoomOper_RoleSet
JYSSZRoomOper_RoleReset*á
AQMJHuPaiType

AQMJType_0 
AQMJType_PingHu
AQMJType_ZiMo
AQMJType_ShiSanLan
AQMJType_BaoDiaoTou
AQMJType_QingYiSe
AQMJType_PengPengHu
AQMJType_QiangGangHu
AQMJType_QiDui
AQMJType_HunYiSe	
AQMJType_GangShangHua
*&
AQMJRoleOper
AQMJRoleOper_BuHua*B
AQMJRoomOper
AQMJRoomOper_GameBegin
AQMJRoomOper_BuHua*œ
KMMJType
KMMJType_ER 
KMMJType_ZM
KMMJType_GSKH
KMMJType_GSP
KMMJType_QGH
KMMJType_BQGH
KMMJType_PH
KMMJType_QYS
KMMJType_DDH
KMMJType_QDDH	
KMMJType_QD

KMMJType_QQD
KMMJType_LQD
KMMJType_QLQD
KMMJType_JGD
KMMJType_YPDX
KMMJType_ZJ
KMMJType_GF
KMMJType_XY
KMMJType_DQTiao
KMMJType_DQWan
KMMJType_DQTong
KMMJType_HZ
KMMJType_CJ
KMMJType_HD*_
KMMJRoomOper
KMMJRoomOper_GameBegin
KMMJRoomOper_DingQue
KMMJRoomOper_PointChg*ã
XZMJType
XZMJType_ER 
XZMJType_ZM
XZMJType_GSKH
XZMJType_GSP
XZMJType_QGH
XZMJType_BQGH
XZMJType_PH
XZMJType_QYS
XZMJType_DDH
XZMJType_QDDH	
XZMJType_QD

XZMJType_QQD
XZMJType_LQD
XZMJType_QLQD
XZMJType_JGD
XZMJType_YPDX
XZMJType_ZJ
XZMJType_GF
XZMJType_XY
XZMJType_DQTiao
XZMJType_DQWan
XZMJType_DQTong
XZMJType_HZ
XZMJType_CJ
XZMJType_HJZY
XZMJType_TH
XZMJType_DH
XZMJType_QDYH
XZMJType_QYJH
XZMJType_JDH
XZMJType_JJGDH
XZMJType_QJGDH 
XZMJYype_SBLH!
XZMJYype_QSBLH"
XZMJType_HD#*{
XZMJRoomOper
XZMJRoomOper_GameBegin
XZMJRoomOper_DingQue
XZMJRoomOper_PointChg
XZMJRoomOper_exChange3*ã
XLMJType
XLMJType_ER 
XLMJType_ZM
XLMJType_GSKH
XLMJType_GSP
XLMJType_QGH
XLMJType_BQGH
XLMJType_PH
XLMJType_QYS
XLMJType_DDH
XLMJType_QDDH	
XLMJType_QD

XLMJType_QQD
XLMJType_LQD
XLMJType_QLQD
XLMJType_JGD
XLMJType_YPDX
XLMJType_ZJ
XLMJType_GF
XLMJType_XY
XLMJType_DQTiao
XLMJType_DQWan
XLMJType_DQTong
XLMJType_HZ
XLMJType_CJ
XLMJType_HJZY
XLMJType_TH
XLMJType_DH
XLMJType_QDYH
XLMJType_QYJH
XLMJType_JDH
XLMJType_JJGDH
XLMJType_QJGDH 
XLMJType_SBLH!
XLMJType_QSBLH"
XLMJType_HD#*{
XLMJRoomOper
XLMJRoomOper_GameBegin
XLMJRoomOper_DingQue
XLMJRoomOper_PointChg
XLMJRoomOper_exChange3*t
FYBZType
FYBZType_Error 
FYBZType_SP
FYBZType_DZ
FYBZType_SZ
FYBZType_ZD
FYBZType_THS*q

FYBZTSType
FYBZTSType_Error 
FYBZTSType_SSZ
FYBZTSType_TZ
FYBZTSType_SDZ
FYBZTSType_YTL*f
FYBZRoleOper
FYBZRoleOper_SetAllFinish
FYBZRoleOper_SetTSPoker
FYBZRoleState_GameStar*`
FYBZRoomOper
FYBZRoomOper_SendPoker
FYBZRoomOper_RoleSet
FYBZRoomOper_RoleReset*b
	RoleState
RoleState_Leave
RoleState_Cache
RoleState_CacheEx
RoleState_OnLine*0
SaveType
SaveType_DB
SaveType_Client*Ñ
YuanBaoState
YuanBaoState_CreateRoom
YuanBaoState_SignRoom
YuanBaoState_RenewRoom
YuanBaoState_CloseRoom
YuanBaoState_Pay
YuanBaoState_CreateFailed
YuanBaoState_SignFailed
YuanBaoState_RenewFailed
YuanBaoState_Charm	
YuanBaoState_ToDayFirGame

YuanBaoState_ToDayFXReward
YuanBaoState_GM
YuanBaoState_Action
YuanBaoState_Give
YuanBaoState_BeGive
YuanBaoState_ZhuanPanCost
YuanBaoState_ZhuanPanReward
YuanBaoState_ZhuanPanFailed*Ø
RoomCardState
RoomCardState_CreateRoom
RoomCardState_SignRoom
RoomCardState_RenewRoom
RoomCardState_CloseRoom
RoomCardState_Pay
RoomCardState_CreateFailed
RoomCardState_SignFailed
RoomCardState_RenewFailed
RoomCardState_GM	 
RoomCardState_WeiXinFXReward
*¬
RoleLoginResult
RoleLoginResult_Sucess
RoleLoginResult_Freeze
RoleLoginResult_PassErr
RoleLoginResult_TokenErr
RoleLoginResult_IsLogin
RoleLoginResult_SystemLimit*Õ
CreateRoomResult
CreateRoomResult_Sucess 
CreateRoomResult_RoomTypeErr
CreateRoomResult_IsInRoom 
CreateRoomResult_NonRoomCard
CreateRoomResult_NonYuanBao
CreateRoomResult_NonCost
CreateRoomResult_System
CreateRoomResult_NonLogin 
CreateRoomResult_GameNonRoom	
CreateRoomResult_NonGame
*¶
JoinRoomResult
JoinRoomResult_Sucess
JoinRoomResult_RoomErr
JoinRoomResult_IsInRoom
JoinRoomResult_RoomIsFull
JoinRoomResult_RoomLimit
JoinRoomResult_System
JoinRoomResult_NonRoomCard
JoinRoomResult_NonYuanBao
JoinRoomResult_NonCost	
JoinRoomResult_NonLogin

JoinRoomResult_NonGame
JoinRoomResult_NonRoom
JoinRoomResult_NeedRenew
JoinRoomResult_IPLimit*»
LeaveRoomResult
LeaveRoomResult_Sucess
LeaveRoomResult_NotInRoom
LeaveRoomResult_NonGame
LeaveRoomResult_VoteErr
LeaveRoomResult_ProtecdTime
LeaveRoomResult_VoteProtecd*q
BeLoginLeaveType
BeLoginLeaveType_ResetLogin
BeLoginLeaveType_ServerKick
BeLoginLeaveType_Freeze*≤
BeRemoveRoomType
BeRemoveRoomType_GameLeave
BeRemoveRoomType_MasterKick
BeRemoveRoomType_RoomClose
BeRemoveRoomType_NonSign
BeRemoveRoomType_PointLimit 
BeRemoveRoomType_RoleBeLeave
BeRemoveRoomType_VoteKick
BeRemoveRoomType_VoteLeave
BeRemoveRoomType_NonRenew	*î
KickRoomRoleResult
KickRoomRoleResult_Sucess 
KickRoomRoleResult_NonMaster
KickRoomRoleResult_NonRoom
KickRoomRoleResult_TypeErr
KickRoomRoleResult_InGame
KickRoomRoleResult_KickMe
KickRoomRoleResult_RoleNum
KickRoomRoleResult_RoomKick*ù
AddRoomGameNumResult
AddRoomGameNumResult_Sucess 
AddRoomGameNumResult_NonRoom 
AddRoomGameNumResult_NonCard 
AddRoomGameNumResult_TypeErr*›
RenewRoomResult
RenewRoomResult_Sucess
RenewRoomResult_NonRoomCard
RenewRoomResult_NonYuanBao
RenewRoomResult_NonCost
RenewRoomResult_NonRoom
RenewRoomResult_IsRenew
RenewRoomResult_SystemRoom
RenewRoomResult_NonRenew
RenewRoomResult_IsSign	
RenewRoomResult_NonGame

RenewRoomResult_RoomTypeErr*C
RoomInfoResult
RoomInfoResult_Sucess
RoomInfoResult_Non*x
BindIDResult
BindIDResult_Sucess
BindIDResult_IsBind
BindIDResult_BindIDErr
BindIDResult_UserIDErr*û
ShopPayResult
ShopPayResult_Sucess
ShopPayResult_TokenErr
ShopPayResult_ShopIDErr
ShopPayResult_PriceErr
ShopPayResult_TokenTimeOut*Ω
CloseRoomResult
CloseRoomResult_Sucess
CloseRoomResult_NonMaster
CloseRoomResult_IsSystem
CloseRoomResult_IsAA
CloseRoomResult_IsRule
CloseRoomResult_NonRoom*å
	PayResult
PayResult_Sucess
PayResult_OrderErr
PayResult_PriceErr
PayResult_SignErr
PayResult_WebErr
PayResult_WebSucess
PayResult_NonBind
PayResult_NonLogin
PayResult_NonShop	
PayResult_AppIDErr

PayResult_TimeOut*à
RoleCharmResult
RoleCharmResult_Sucess
RoleCharmResult_NonLogin
RoleCharmResult_NonYuanBao
RoleCharmResult_NonRoom*|
TodayFirRewardResult
TodayFirRewardResult_Sucess 
TodayFirRewardResult_NonGame!
TodayFirRewardResult_IsReward*V
RoleZhuanPanResult
RoleZhuanPanResult_Sucess!
RoleZhuanPanResult_NonYuanBao*¢
RoleEntityItemResult
RoleEntityItemResult_Sucess!
RoleEntityItemResult_PhoneErr"
RoleEntityItemResult_NonReward"
RoleEntityItemResult_LingJiang*H
FXRewardResult
FXRewardResult_Sucess
FXRewardResult_IsReward*{
WeiXinFXRewardResult
WeiXinFXRewardResult_Sucess!
WeiXinFXRewardResult_IsReward
WeiXinFXRewardResult_Failed*I
ShiMingIDResult
ShiMingIDResult_Sucess
ShiMingIDResult_Failed*S
GiveYuanBaoResult
GiveYuanBaoResult_Sucess 
GiveYuanBaoResult_NonYuanBao