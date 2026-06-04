#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Reads a value from the INIDB2 database.
 * Note that INIDBI2 will return false for non-existent value, be mindful when trying to fetch a boolean value from the database.
 *
 * Arguments:
 * 0: The section of the value <STRING>
 * 1: The key name <STRING>
 * 2: Default value <STRING|NUMBER|ARRAY|BOOL>
 *
 * Return Value:
 * The key's value, or default value if value does not exist (optional, default: false) <STRING|NUMBER|ARRAY|BOOL>
 *
 * Example:
 * [["meta", "lastLaunched"] call aor_database_fnc_read
 *
 * Public: Yes
 */

params [
    ["_section", "", [""]],
    ["_key", "", [""]],
    ["_defaultValue", false, ["", 0, [], true]]
];
TRACE_3("fnc_read",_key,_section,_defaultValue);

if (_section == "" || _key == "") exitWith {};

if !(isServer) exitWith {
    WARNING("fnc_read called from non-server context");
};

private _value = ["read", [_section, _key]] call GVAR(saveData);
// isEqualTo since it could be multiple data-types
if (_value isEqualTo false) then {
    _value = _defaultValue;
};

_value;
