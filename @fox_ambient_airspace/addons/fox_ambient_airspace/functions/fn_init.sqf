if (!isServer)  exitwith {
  diag_log format["%1 Only works on server or local",getText(configFile >> "fox_ambient_airspace" >> "warning" )];
};
if (missionNamespace getVariable ["fox_ambient_airspace_disabled",false])  exitwith {
  diag_log format["%1 Addon disabled",getText(configFile >> "fox_ambient_airspace" >> "warning" )];
};

fox_ambient_airspace_ready = false;

diag_log format["%1 version: %2",getNumber(configfile >> "CfgPatches" >> "fox_ambient_airspace" >> "version" )] ;
diag_log format["%1 Setup vehicles",getText(configFile >> "fox_ambient_airspace" >> "warning" )] ;

//Check addons and build vehicle array
_vehicles = [];

_vehicles = _vehicles +  getArray(configFile >> "fox_ambient_airspace" >> "base" );
_vehicles = _vehicles + getArray(configFile >> "fox_ambient_airspace" >> "customAddon" );

if(isClass (configFile >> "CfgPatches" >> "rhs_c_air") )then{
  //RHS AFRF
  diag_log format["%1 RHS AFRF loaded",getText(configFile >> "fox_ambient_airspace" >> "warning" )] ;
  _vehicles = _vehicles + getArray(configFile >> "fox_ambient_airspace" >> "rhs_afrf" );
};

if(isClass (configFile >> "CfgPatches" >> "rhsgref_c_air") )then{
  //RHS GREF
  diag_log format["%1 RHS GREF loaded",getText(configFile >> "fox_ambient_airspace" >> "warning" )] ;
  _vehicles = _vehicles + getArray(configFile >> "fox_ambient_airspace" >> "rhs_gref" );
};

if(isClass (configFile >> "CfgPatches" >> "CUP_AirVehicles_Core") )then{
  //CUP
  diag_log format["%1 CUP loaded",getText(configFile >> "fox_ambient_airspace" >> "warning" )] ;
  _vehicles = _vehicles + getArray(configFile >> "fox_ambient_airspace" >> "cup" );
};

diag_log format["%1 vehicles loaded: %2",getText(configFile >> "fox_ambient_airspace" >> "warning" ),str _vehicles] ;

missionNamespace setVariable ["fox_ambient_airspace_vehicles",_vehicles];

fox_ambient_airspace_ready = true;

[] call fox_ambient_airspace_fnc_loop;
