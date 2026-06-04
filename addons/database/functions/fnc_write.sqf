#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Writes a value to the INIDB2 database.
 *
 * Arguments:
 * 0: The section of the value <STRING>
 * 1: The key name <STRING>
 * 2: Value for the key <STRING|NUMBER|ARRAY|BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["meta", "lastLaunched", systemTime] call call AOR_database_fnc_write
 *
 * Public: Yes
 */

params [
    ["_section", "", [""]],
    ["_key", "", [""]],
    ["_value", nil, ["", 0, [], true]]
];
TRACE_3("fnc_write",_key,_section,_value);

if (_section == "" || _key == "" || isNil "_value") exitWith {};

if !(isServer) exitWith {
    WARNING("fnc_write called from non-server context");
};

["write", [_section, _key, _value]] call GVAR(saveData);
nil;
