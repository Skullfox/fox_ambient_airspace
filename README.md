## fox_ambient_airspace

| missionNamespace        | desc           | default  |
| ------------- |:-------:|:-----:|
| fox_ambient_airspace_vehicles      | array with air vehicles | ["C_Heli_Light_01_civil_F","C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F","C_IDAP_Heli_Transport_02_F"]|
| fox_ambient_airspace_timer      | timer for next spawn      |   900 |
| fox_ambient_airspace_baseHeight | flyInHeight (_baseHeight * selectRandom [0.6,0.8,1,1.2,1.4] )    | 300

### Inbuild support for:
* CUP
* RHS
* Additional support via addon patch or script

### Custom vehicles

#### Script
Not recommend !!!   
```javascript
/*
  Run this only on the server
*/

if (isServer)then{   
  []spawn{   
  fox_ambient_airspace_ready = false;   
  waitUntil{fox_ambient_airspace_ready};   
  
  // Use only 1 or 2 do not copy/pasta this snippet blindly !!!
  
  // 1) overwrite all vehicles with custom classes   
  missionNamespace setVariable ["fox_ambient_airspace_vehicles", [class1,class2,...]];   
    
  // 2) extend loaded vehicles with custom classes   
  _vehicles = missionNamespace getVariable ["fox_ambient_airspace_vehicles",getArray(configFile >> "fox_ambient_airspace" >> "base" )];   
  _vehicles = _vehicles + ["customClass1","customClass2"];   
  missionNamespace setVariable ["fox_ambient_airspace_vehicles",_vehicles ]];   
  
  };   
};   
```

#### Addon


[See example in folder](https://github.com/Skullfox/fox_ambient_airspace/tree/master/%40fox_ambient_airspace/addons/fox_ambient_airspace_xxx)

