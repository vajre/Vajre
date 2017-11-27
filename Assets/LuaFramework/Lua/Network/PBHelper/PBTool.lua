require "3rd.pblua.MessageCommon_pb"
require "3rd.pblua.MessageClient_pb"

PBTool = {}

PBTool[MessageClient_pb.CS_RoleLogin] = MessageClient_pb.CS_Cmd_RoleLogin
PBTool[MessageClient_pb.SC_RoleLogin] = MessageClient_pb.SC_Cmd_RoleLogin
PBTool[MessageClient_pb.CS_RoomOper] = MessageClient_pb.CS_Cmd_RoomOper
PBTool[MessageClient_pb.CS_CreateRoom] = MessageClient_pb.CS_Cmd_CreateRoom

PBTool[MessageClient_pb.SC_RoomRoleInfo] = MessageClient_pb.SC_Cmd_RoomRoleInfo
PBTool[MessageClient_pb.SC_RoomStateInfo] = MessageClient_pb.SC_Cmd_RoomStateInfo