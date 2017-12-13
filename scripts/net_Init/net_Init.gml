/// @desc Initialize Networking Variables
/// @function net_Init(yourPort)
/// @param {real} port Your port to use for networking

var yourPort   = argument0;

socket = network_create_socket_ext(network_socket_udp, yourPort);

global.networkMessageHandlers = ds_map_create();