/// @description Send a packet
messageMap = net_CreateMessageMap(NetMessageType.connect, "name", "logan", "age", 12, "pass", "something");
net_SendMessage(messageMap, "127.0.0.1", serverPort);