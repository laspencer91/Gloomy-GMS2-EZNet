/// @description Disconnect Message
var message = net_CreateMessage(NetMessageType.disconnect);
net_SendMessage(message, "127.0.0.1", serverPort);