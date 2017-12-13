_recievedJson		    = buffer_read(async_load[? "buffer"], buffer_string);		// Get the text from the recieved buffer
recievedMessage		    = json_decode(_recievedJson);								// Convert the json_string to a ds_map
_recievedMessageType    = recievedMessage[? TYPE_OF_PACKET];						// Get the message type out of the map
_handlerScript          = global.networkMessageHandlers[? _recievedMessageType];

// Execute the network handler script associated with the message type of this packet

if (script_exists(_handlerScript))
	script_execute(global.networkMessageHandlers[? _recievedMessageType]);
else
	show_error("There is no script assigned to handle the network message type recieved.", false);
