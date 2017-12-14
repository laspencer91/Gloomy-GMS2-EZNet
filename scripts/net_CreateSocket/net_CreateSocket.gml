/// @description Search a given (or default) range of ports to find an available one
/// @function net_CreateSocket()
/// @param {real} minPort Minimum port to search
/// @param {real} maxPort Maximum port to search

// Default Ports
var _result	 = noone;
var _minPort = argument0;
var _maxPort = argument1;

// Search for a port between the port range above
for (var _i = _minPort; _i <= _maxPort; _i++)
{
	_result = network_create_socket_ext(network_socket_udp, _i);
	
	if (_result >= 0)
	{
		global.myNetPort = _i;
		return _result; // Return successful socket creation
	}
}

// If we found a successful port we would have returned out 
// of this script by now.
return noone;