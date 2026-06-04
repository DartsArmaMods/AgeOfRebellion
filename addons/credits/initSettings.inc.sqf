[
    QGVAR(defaultBalance),
    "SLIDER",
    [LLSTRING(defaultBalanceSetting), LLSTRING(defaultBalanceTooltip)],
    [LELSTRING(main,modName), LLSTRING(componentName)],
    [0, 500, 100, -1],
    TRUE
] call CBA_fnc_addSetting;
