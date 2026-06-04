#include "script_component.hpp"

if (!isServer) exitWith {};

// Array of variables to save to the database
GVAR(savedVariables) = [];

if (isNil "OO_INIDBI") exitWith {
    ERROR("INIDBI2 is not loaded, it is required for persistent player and server data");
};

GVAR(saveData) = ["new", format [QGVARMAIN(saveData_%1), worldName]] call OO_INIDBI;
["meta", "lastLaunched", systemTime] call FUNC(write);

if !("exists" call GVAR(saveData)) exitWith {
    ERROR("Unable to create/load saveData from INIDBI2!");
};

["CBA_settingsInitialized", {
    [QGVAR(save), { [] call FUNC(saveServerData) }] call CBA_fnc_addEventHandler;
    addMissionEventHandler ["Ended", { [] call FUNC(saveServerData) }];
    [] call FUNC(autosave);
}] call CBA_fnc_addEventHandler;
