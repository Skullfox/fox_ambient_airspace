#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"fox_ambient_airspace"};
	};
};

class fox_ambient_airspace{
	customAddon[] += {"deathglider_normal","sga_needlethreader_normal"};
};
