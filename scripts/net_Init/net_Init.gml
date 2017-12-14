/// @desc Initialize Networking Variables
/// You can give no port and use default values, give 1 port, to try
/// to set that as your specified port, or two ports to search a range.
/// @function net_Init(yourPort)
/// @param {real} [beginPort] First Port To Try To Use
/// @param {real} [endPort] Final Port To Check
/// @returns {real} True if Socket Init Success or False if failed

// These variables are available for you to use
// The socket is the socket you use to send data
// The networkMessageHandlers is the mapping of (MessageType, script_to_execute)

// Default ports range if none are given
var _minPort = 3220;
var _maxPort = 3900;

// These variables can be used from anywhere after initialization
global.myNetPort	   = -1;              // Set in net_CreateSocket
global.myNetSocket     = -1;
global.messageHandlers = ds_map_create();

// Try to create our socket
if (argument_count > 0)
{
	_minPort = argument[0];

	if (argument_count > 1)
		_maxPort = argument[1];
	else
		_maxPort = _minPort;
}

global.myNetSocket = net_CreateSocket(_minPort, _maxPort);
	
return (global.myNetSocket != noone);