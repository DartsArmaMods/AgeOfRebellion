// Global toggles for caching/logging
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_MODE_FULL
#define DEBUG_SYNCHRONOUS

#include "\x\cba\addons\main\script_macros_common.hpp"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#undef PREP
#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {_this call FUNC(x)}
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
    #define PREP_RECOMPILE_START    if (isNil "ACE_PREP_RECOMPILE") then {ACE_RECOMPILES = []; ACE_PREP_RECOMPILE = {{call _x} forEach ACE_RECOMPILES;}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; ACE_RECOMPILES pushBack _recomp;
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
    #define PREP_RECOMPILE_START ; /* disabled */
    #define PREP_RECOMPILE_END ; /* disabled */
#endif

#define CLASS(var1) DOUBLES(PREFIX,var1)
#define QCLASS(var1) QUOTE(CLASS(var1))
#define QQCLASS(var1) QUOTE(QCLASS(var1))

#define FACTION(var1) CLASS(DOUBLES(Faction,var1))
#define QFACTION(var1) QCLASS(DOUBLES(Faction,var1))
#define EDCAT(var1) CLASS(DOUBLES(EdCat,var1))
#define QEDCAT(var1) QCLASS(DOUBLES(EdCat,var1))
#define EDSUBCAT(var1) CLASS(DOUBLES(EdSubCat,var1))
#define QEDSUBCAT(var1) QCLASS(DOUBLES(EdSubCat,var1))

#define ADDON_LOADED(var1) isClass (configFile >> 'CfgPatches' >> QUOTE(var1))

#ifdef SUBCOMPONENT
    #define EDITOR_PREVIEW(var1) QPATHTOF(SUBCOMPONENT\data\previews\CLASS(var1).jpg)
#else
    #define EDITOR_PREVIEW(var1) QPATHTOF(data\previews\CLASS(var1).jpg)
#endif
#define EEDITOR_PREVIEW(var1,var2) QUOTE(PATHTOF_SYS(PREFIX,var1,data\previews\CLASS(var2).jpg))

#define QQPATHTOF(var1) QUOTE(QPATHTOF(var1))
#define QQPATHTOEF(var1,var2) QUOTE(QPATHTOEF(var1,var2))

#define IGUI_GVAR(var1) DOUBLES(IGUI,GVAR(var1))
#define QIGUI_GVAR(var1) QUOTE(IGUI_GVAR(var1))
#define QQIGUI_GVAR(var1) QUOTE(QIGUI_GVAR(var1))

// Inventory & Loadouts
#define ITEM_2(a) a, a
#define ITEM_3(a) a, a, a
#define ITEM_4(a) a, a, a, a
#define ITEM_5(a) a, a, a, a, a
#define ITEM_6(a) a, a, a, a, a, a
#define ITEM_7(a) a, a, a, a, a, a, a
#define ITEM_8(a) a, a, a, a, a, a, a, a
#define ITEM_9(a) a, a, a, a, a, a, a, a, a
#define ITEM_10(a) a, a, a, a, a, a, a, a, a, a

#define WEAP_XX(WEAP, COUNT) class DOUBLES(_xx,WEAP) { \
    weapon = QUOTE(WEAP); \
    count = COUNT; \
}

#define MAG_XX(MAG, COUNT) class DOUBLES(_xx,MAG) { \
    magazine = QUOTE(MAG); \
    count = COUNT; \
}

#define ITEM_XX(ITEM, COUNT) class DOUBLES(_xx,ITEM) { \
    name = QUOTE(ITEM); \
    count = COUNT; \
}

#define GROUND_CLASS(WEAP_NAME) DOUBLES(Ground,CLASS(WEAP_NAME))
#define QGROUND_CLASS(WEAP_NAME) QUOTE(GROUND_CLASS(WEAP_NAME))
#define GROUND_HOLDER(WEAP_NAME, DISPLAY_NAME) class GROUND_CLASS(WEAP_NAME): GROUND_CLASS(Holder_Base) { \
    SCOPE_PUBLIC; \
    displayName = DISPLAY_NAME; \
    class TransportItems { \
        ITEM_XX(CLASS(WEAP_NAME),1); \
    }; \
}

// Conditions
#define IS_STOPPED(var1) speed var1 < 1 and {speed var1 > -1}

// Statements
#define CLAMP(var1,lower,upper) lower max (var1 min upper)

#include "defines.hpp"
