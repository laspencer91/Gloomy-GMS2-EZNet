/// @description Create Connect Packet

success = net_Init(3224, 3300);

if (success)
	show_message("Successfully created socket on port " + string(global.myNetPort));
else
	show_error("Unable to find available port in giving range, no socket created", false);

serverPort = get_integer("What port do you want to send data to?", 3224);

net_AddMessageHandler(NetMessageType.connect, net_HandleConnectRequest);
net_AddMessageHandler(NetMessageType.disconnect, net_HandleDisconnect);


