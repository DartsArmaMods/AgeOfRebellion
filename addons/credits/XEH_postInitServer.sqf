#include "script_component.hpp"

([QUOTE(COMPONENT), "creditCards", [[], []]] call EFUNC(database,read)) params ["_keys", "_values"];
GVAR(creditCards) = _keys createHashMapFromArray _values;
GVAR(nextCreditCardId) = [QUOTE(COMPONENT), "nextCreditCardId", 1] call EFUNC(database,read);

EGVAR(database,savedVariables) append [QGVAR(creditCards), QGVAR(nextCreditCardId)];

[QGVAR(createCard), {
    params ["_unit", "_id"];
    TRACE_2("createCard EH",_unit,_id);
    _unit call FUNC(createCard);
}] call CBA_fnc_addEventHandler;
