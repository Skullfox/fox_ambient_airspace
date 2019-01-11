[]spawn{
  diag_log format["%1 Loop started",getText(configFile >> "fox_ambient_airspace" >> "warning" )];

  sleep 10;
  while {true} do {
    _vehicles = missionNamespace getVariable ["fox_ambient_airspace_vehicles",getArray(configFile >> "fox_ambient_airspace" >> "base" )];
    _timer = missionNamespace getVariable ["fox_ambient_airspace_timer", random (300) +  getNumber(configFile >> "fox_ambient_airspace" >> "timer" )];
    sleep _timer;
    [_vehicles,false] call fox_ambient_airspace_fnc_spawn;
  };
}
