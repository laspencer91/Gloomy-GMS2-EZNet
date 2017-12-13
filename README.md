# Gloomy-GMS2-EZNet
Easily send networked messages back and forth using an easy to read format. Create "Message Types" and assign scripts that should fire when you recieve a message of that type over the network.


## About
This project allows you to easily write data using `["Key"] -> [Value]` pairs. For instance, you can store a variable name as a key, and store its "value" as the value that key maps to. This system takes care of the buffer serialization and packet sending so you do not have to worry about those complicated things.

The framework is setup so that you send assign a message type when wanting to send a packet over the network. Lets see a quick example of how easy this actually is.


## Simple Example 
Lets say that I want to send a message to update a server of my players position. I would simply use this:

	// This is just constructing a ds_map that holds the keys and values of your message
    message = net_CreateMessageMap(MessageType.posUpdate, "x", Player.x, "y", Player.y);

Next I need to send the message so I add the second line.

	// In step event of client or wherever this needs to be sent from
    message = net_CreateMessageMap(MessageType.posUpdate, "x", Player.x, "y", Player.y);
    net_SendMessage(message, serverIp, serverPort);

This simply sends the message we created to the servers IP and at the servers Port. MessageType is just an enum that could just be placed in a script like this.

	// This can be placed in a script and left alone, enums do not have to be placed in an object
    enum MessageType {
    	connect,
    	disconnect,
    	posUpdate
    }

Now how do we handle the message when the server receives it? Well it is simple to just add some code that could handle it. First we need to Init the networking system

    // NetworkManager create event
    net_Init(portYouWantToUse);

Then we need to tell GM to look out for incoming packets in the networking event.

    //NetworkManager Async-Network event
    net_RecievePacket();

Next we create a handler that handles packets based on type and add it to our handlers. `incomingMessage` is the variable name that the incoming data is assigned to.

    // A script I will call net_handlePositionUpdate
    // This will simply use the map create up top as keys in a map to get values from.
    clientsNewX = incomingMessage[? "x"];
    clientsNewY = incomingMessage[? "y"];

And finally we need to tell our game to execute this script when it receives a message with the type `MessageType.posUpdate`

    // NetworkManager create event
    net_AddMessageHandler(MessageType.posUpdate, net_handlePositionUpdate);

And thats it! Now you can send a position update message and will receive the packet on another instance that is on a different port, and it will execute that script as you told it to!
