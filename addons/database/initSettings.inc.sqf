[
    QGVAR(autosaveTimer),
    "TIME",
    [LLSTRING(autosaveTimerSetting), LLSTRING(autosaveTimerTooltip)],
    [LELSTRING(main,modName), LELSTRING(main,componentName)],
    [60, 600, 180],
    TRUE
] call CBA_fnc_addSetting;
