#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "aor_database",
            "JLTS_C_Credits"
        };
        units[] = {};
        weapons[] = {
            "AOR_CreditCard"
        };
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgEventHandlers.hpp"
