/// @description Create Connect Packet

net_Init(get_integer("What port to use on your computer?", 3223));
serverPort = get_integer("What port do you want to send data to?", 3224);

net_AddMessageHandler(NetMessageType.connect, net_HandleConnectRequest);
net_AddMessageHandler(NetMessageType.disconnect, net_HandleDisconnect);


