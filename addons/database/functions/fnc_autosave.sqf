#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Recursive function to save data according to the auto save setting.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call aor_database_fnc_autosave
 *
 * Public: No
 */

INFO("Starting autosave");

[{
    [QGVAR(save)] call CBA_fnc_localEvent;
    call FUNC(autosave);
}, nil, GVAR(autosaveTimer)] call CBA_fnc_waitAndExecute;

nil;
