#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {};
		steamId = 0;
		url = "https://discordapp.com/invite/bTBUVBB";
		version  = VERSION;
	};
};

class ADDON{
	timer = 900;
	base[] = {"C_Heli_Light_01_civil_F","C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F","C_IDAP_Heli_Transport_02_F"};
  rhs_afrf[] = {"RHS_Mi8amt_civilian"};
  rhs_gref[] = {"rhs_uh1h_idap"};
	rhs_usaf[] = {""};
	rhs_saf[] = {""};
	cup[] = {"CUP_C_AN2_AEROSCHROT_TK_CIV","CUP_C_AN2_AIRTAK_TK_CIV","CUP_C_MI6A_RU","CUP_C_MI6T_RU","CUP_C_Mi17_Civilian_RU","CUP_C_Mi17_VIV_RU","CUP_C_AN2_CIV","CUP_C_C47_CIV","CUP_C_Plane_Orbit","CUP_C_DC3_CIV","CUP_C_DC3_TanoAir_CIV","CUP_C_Cessna_172_CIV_BLUE","CUP_C_Cessna_172_CIV_GREEN","CUP_C_Cessna_172_CIV"};
	customAddon[] = {};
	warning = ">>> FOX Ambient Airspace |";
	baseHeight = 300;
};


class CfgFunctions
{
	class ADDON
	{
		class COMPONENT
		{
			file="\fox_ambient_airspace\functions";
			class init{postInit = 1;};
			class loop{};
			class spawn{};
		};
	};
};
