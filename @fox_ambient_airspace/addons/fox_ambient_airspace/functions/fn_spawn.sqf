/*
	Author: Phil
  Steam: https://steamcommunity.com/id/xshiragamix/

	Description:
	Random flyby

  Note:
  If you using custom code, you need to delete the crew and vehicle by yourself !

	Parameter(s):
		0 Optional: Classname of the vehicle or Array of Classnems, crew will be created automaticly
      Recommend to only use planes or helis

    1 Optional: Custom center, Type object

    3 Custom code passed as array [{1},{2}]
      1) Code on start waypoint
        Access the vehicle with _vehicle = param[0];
      2) Code on end waypoint
        Access the vehicle with _vehicle = param[0];

        To only use waypoint end code use [{},{code}]

----------------------------------->

    Examples:

    o) Basic

      []execVM "fox_ambientFlyby.sqf";

    o) Advanced

      [
        ["C_Heli_Light_01_civil_F","B_Plane_CAS_01_F","O_T_VTOL_02_infantry_F"],
        false,
        [
        {
          _smoke = "SmokeShellGreen" createVehicle [0,0,0];
          _smoke attachTo[_this select 0,[0,0,0]];
        },
        {
          {deleteVehicle _x;} forEach crew (_this select 0);deleteVehicle (_this select 0);
        }
        ]
      ]execVM "fox_ambientFlyby.sqf";

----------------------------------->

    You can copy pasta the code below directly in the 3den debug window to test it.

*/

_vehicleClass = param[0,["C_Plane_Civil_01_F","C_Heli_Light_01_civil_F"]];
_objectCenter = param[1,false];
_customCode = param[2,[{
  _veh = param[0,objNull];
  _baseHeight = missionNamespace getVariable ["fox_ambient_airspace_baseHeight",getNumber(configFile >> "fox_ambient_airspace" >> "baseHeight" )];
  _veh flyInHeight (_baseHeight * selectRandom [0.4,0.6,0.8,1,1.2,1.4] );
},
  {
    _veh = param[0,objNull];
    {deleteVehicle _x;} forEach crew _veh;
    deleteVehicle _veh;
  }
]];

if(( typeName _vehicleClass ) isEqualTo "ARRAY") then{
  _vehicleClass = _vehicleClass call BIS_fnc_selectRandom;
};

_center = getArray(configfile >> "CfgWorlds" >> worldname >> "centerPosition");

_mBottomLeft = [0 - 1500,0 - 1500,0];
_mTopLeft = [0 - 1500,( (_center select 0) * 2) - 1500,0];
_mTopRight = [ ( (_center select 0) * 2 ) + 1500,( (_center select 1) * 2 ) + 1500,0];
_mBottomRight = [( (_center select 0) * 2 ) + 1500,0 - 1500,0];

_pos1 = [_mBottomLeft,_mTopLeft] call BIS_fnc_selectRandom;
_pos2 = [_center] call BIS_fnc_selectRandom;
_pos3 = [_mTopRight,_mBottomRight] call BIS_fnc_selectRandom;

_startPos = [_pos1,_pos3] call BIS_fnc_selectRandom;
_endPos = [_pos1,_pos3] - [_startPos];

_veh = createVehicle [_vehicleClass,_startPos, [], 0, "FLY"];
createVehicleCrew _veh;

_centerRandom = _center getPos [((_center select 0) / 2) * sqrt random 1, random 360];
_wp1 = (group _veh) addWaypoint [_startPos, 0];

if(( typeName _objectCenter ) isEqualTo "OBJECT")then{
  _wp2 = (group _veh) addWaypoint [getPos _objectCenter, 0];
}else{
  _wp2 = (group _veh) addWaypoint [_centerRandom, 0];
};

_wp3 = (group _veh) addWaypoint [_endPos select 0, 0];

_waypointStartCode = _customCode select 0;
_waypointEndCode = _customCode select 1;

_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointStatements ["true",  format["[vehicle this] call %1",_waypointStartCode]];
_wp3 setWaypointStatements ["true",  format["[vehicle this] call %1",_waypointEndCode]];
