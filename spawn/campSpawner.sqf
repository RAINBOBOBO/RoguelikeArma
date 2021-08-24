// DELETE THIS

_coreGroup1 = createGroup[independent, true];
[_coreGroup1, getMarkerPos "campSpawn1", 5] call BIS_fnc_taskPatrol;
_coreGroup2 = createGroup[independent, true];
[_coreGroup2, getMarkerPos "campSpawn5", 5] call BIS_fnc_taskPatrol;
_coreGroup3 = createGroup[independent, true];
[_coreGroup3, getMarkerPos "campSpawn6", 5] call BIS_fnc_taskPatrol;

_core1 = _coreGroup1 createUnit["I_C_Soldier_Bandit_7_F", getMarkerPos "campSpawn1", [], 0, "CAN_COLLIDE"];
_core1 setUnitLoadout (getUnitLoadout ICD1);
_core1 setSkill 0.3;

_core2 = _coreGroup2 createUnit["I_C_Soldier_Bandit_7_F", getMarkerPos "campSpawn5", [], 0, "CAN_COLLIDE"];
_core2 setUnitLoadout (getUnitLoadout ICD2);
_core2 setSkill 0.35;

_core3 = _coreGroup3 createUnit["I_C_Soldier_Bandit_7_F", getMarkerPos "campSpawn6", [], 0, "CAN_COLLIDE"];
_core3 setUnitLoadout (getUnitLoadout ICD3);
_core3 setSkill 0.4;


switch (floor(random 3)) do {
case 0: {
_patrolGroup1 = createGroup[independent, true];
_patrol1Unit1 = _patrolGroup1 createUnit["I_C_Soldier_Bandit_7_F", getMarkerPos "campSpawn3", [], 0, "CAN_COLLIDE"];
_patrol1Unit1 setUnitLoadout (getUnitLoadout ICD2);
_patrol1Unit1 setSkill 0.35;

_patrol1_1 = _patrolGroup1 addWaypoint [getMarkerPos "patrol1.1", 0];
	_patrol1_1 setWaypointType "MOVE";
	_patrol1_1 setWaypointSpeed "LIMITED";
	_patrol1_1 setWaypointBehaviour "SAFE";

_patrol1_2 = _patrolGroup1 addWaypoint [getMarkerPos "patrol1.2", 0];
	_patrol1_2 setWaypointType "MOVE";
	_patrol1_2 setWaypointSpeed "LIMITED";
	_patrol1_2 setWaypointBehaviour "SAFE";

_patrol1_3 = _patrolGroup1 addWaypoint [getMarkerPos "patrol1.3", 0];
	_patrol1_3 setWaypointType "MOVE";
	_patrol1_3 setWaypointSpeed "LIMITED";
	_patrol1_3 setWaypointBehaviour "SAFE";

_patrol1_4 = _patrolGroup1 addWaypoint [getMarkerPos "campSpawn3", 0];
	_patrol1_4 setWaypointType "CYCLE";
	_patrol1_4 setWaypointSpeed "LIMITED";
	_patrol1_4 setWaypointBehaviour "SAFE";
};};


switch (floor(random 3)) do {
case 0: {
_patrolGroup2 = createGroup[independent, true];
_patrol2Unit1 = _patrolGroup2 createUnit["I_C_Soldier_Bandit_7_F", getMarkerPos "campSpawn2", [], 0, "CAN_COLLIDE"];
_patrol2Unit1 setUnitLoadout (getUnitLoadout ICD1);
_patrol2Unit1 setSkill 0.3;

_patrol2_1 = _patrolGroup2 addWaypoint [getMarkerPos "patrol2.1", 0];
	_patrol2_1 setWaypointType "MOVE";
	_patrol2_1 setWaypointSpeed "LIMITED";
	_patrol2_1 setWaypointBehaviour "SAFE";

_patrol2_2 = _patrolGroup2 addWaypoint [getMarkerPos "patrol2.2", 0];
	_patrol2_2 setWaypointType "MOVE";
	_patrol2_2 setWaypointSpeed "LIMITED";
	_patrol2_2 setWaypointBehaviour "SAFE";

_patrol2_3 = _patrolGroup2 addWaypoint [getMarkerPos "patrol2.3", 0];
	_patrol2_3 setWaypointType "MOVE";
	_patrol2_3 setWaypointSpeed "LIMITED";
	_patrol2_3 setWaypointBehaviour "SAFE";

_patrol2_4 = _patrolGroup2 addWaypoint [getMarkerPos "patrol2.3", 0];
	_patrol2_4 setWaypointType "CYCLE";
	_patrol2_4 setWaypointSpeed "LIMITED";
	_patrol2_4 setWaypointBehaviour "SAFE";
};};


switch (floor(random 3)) do {
case 0: {
_patrolGroup3 = createGroup[independent, true];
_patrolGroup3, getMarkerPos "campSpawn4", 5] call BIS_fnc_taskPatrol;
_patrol3Unit1 = _patrolGroup3 createUnit["I_C_Soldier_Bandit_7_F", getMarkerPos "campSpawn4", [], 0, "CAN_COLLIDE"];
_patrol3Unit1 setUnitLoadout (getUnitLoadout ICD3);
_patrol3Unit1 setSkill 0.4;
};};
