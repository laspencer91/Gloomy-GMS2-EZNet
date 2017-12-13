/// @desc Add a message handling script to the networking message handler
/// @param {enum/string} MessageType Must be a unique identifier
/// @param {script} Script to execute when this message is incoming

var _messageType	 = argument0;
var _scriptReference = argument1;

global.networkMessageHandlers[? _messageType] = _scriptReference;