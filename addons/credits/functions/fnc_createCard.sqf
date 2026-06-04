#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Creates a credit card item and gives it the specified unit.
 *
 * Arguments:
 * 0: Unit recieving the card <OBJECT>
 * 1: Id to use (optional, default: -1) <NUMBER>
 *      - If id is negative, last unused id is used
 *
 * Return Value:
 * The id for the new card <NUMBER>
 *
 * Example:
 * _unit call aor_credits_fnc_createCard;
 *
 * Public: No
 */

params ["_unit", ["_id", -1]];

if !(isServer && {("AOR_CreditCard" in items _unit)}) exitWith {};

TRACE_2("fnc_createCard",_unit,_id);

if (_id < 0) then {
    TRACE_1("negative id, using latest id",GVAR(nextCreditCardId));
    _id = GVAR(nextCreditCardId);
    GVAR(nextCreditCardId) = GVAR(nextCreditCardId) + 1;
};

if (_id > CREDITCARD_MAXID) exitWith {
    WARNING_1("Invalid credit card id passed (%1)",_id);
};

INFO_2("Gave credit card with id %1 to %2",_id,_unit);
_unit removeItem "AOR_CreditCard";
_unit addItem format ["AOR_CreditCard_%1", _id];

// Don't overwrite an existing balance
GVAR(creditCards) set [_id, [GVAR(defaultBalance), name _unit], true];
_id;
