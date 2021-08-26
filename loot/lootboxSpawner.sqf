// args = [str _spawnZone, int _lootTier, int _spawnCount]
// returns nothing

// Whenever the player enters a new zone loot spawns in that zone. This script
// determines which waypoints to use to spawn loot based on the spawnZone arg.
// Then, it uses the spawnCount arg to spawn that many empty ammo boxes and
// calls the lootPicker function to select items to populate those ammo boxes.


// Spawn Locations
private _allSpawnZones = [
	["lopatino", [
		"loot_lopatino_1",
		"loot_lopatino_2",
		"loot_lopatino_3",
		"loot_lopatino_4",
		"loot_lopatino_5"
	]],
	["airfield1", [
		"loot_airfield1_1",
		"loot_airfield1_2",
		"loot_airfield1_3",
		"loot_airfield1_4",
		"loot_airfield1_5",
		"loot_airfield1_6",
		"loot_airfield1_7"
	]]
];


// define zone specific variables
private ["_thisZone", "_thisZoneFirstMarker", "_thisZoneRemainingMarkers"];
for [{private _i = 0}, {_i < count _allSpawnZones}, {_i = _i + 1}] do {
	if (((_allSpawnZones select _i)select 0) isEqualTo (_this select 0)) then {
		_thisZone = (_allSpawnZones select _i);
		_thisZoneFirstMarker = (_thisZone select 1) select 0;
		_thisZoneRemainingMarkers = (_thisZone select 1);
	};
};

private _thisZoneSpawnCount = (_this select 2);

// check if new tier unlocked
if (_thisZoneSpawnCount < currentTier) then {
	currentTier = _thisZoneSpawnCount;
	publicVariable "currentTier";
};

// spawn loot crates and fill with loot
for [{private _i = 0}, {_i < _thisZoneSpawnCount}, {_i = _i + 1}] do {
	// Spawn crate
	_lootCrate = createVehicle [
		"CUP_BOX_RU_Ammo_F",
		getMarkerPos _thisZoneFirstMarker,
		_thisZoneRemainingMarkers,
		0,
		"NONE"
	];
	if (isNull _lootCrate) then {systemChat (str _i + "failed to create");};

	// move crate random distance and direction away from center
	private _dist = (10 + floor(random 100));
	private _dir = [0,359] call BIS_fnc_randomInt;
	private _newPos = [_lootCrate, _dist, _dir] call BIS_fnc_relPos;
	_lootCrate setPos _newPos;

	// clear crate inventory
	clearItemCargo _lootCrate;
	clearWeaponCargo _lootCrate;
	clearMagazineCargo _lootCrate;

	// call loot spawner script
	private _lootSpawn = (_this select 1) call lootPicker;

	// add loot to crate
	for [{private _i = 0}, {_i < count _lootSpawn}, {_i = _i + 1}] do {
		_lootCrate addItemCargo (_lootSpawn select _i);
	};
};
