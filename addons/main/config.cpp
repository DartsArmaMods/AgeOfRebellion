#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "DartRuffian";
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Data_F_Decade_Loadorder",
            "cba_main"
        };
        units[] = {};
        weapons[] = {"AOR_item_base"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgEventHandlers.hpp"
