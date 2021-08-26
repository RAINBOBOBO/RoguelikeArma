// args = [
//	str _spawnZone,
//	arr[str] _factionPool,
//	int _spawnCount,
//	int _minSpawnCount (0 if not random),
//	int _maxSpawnCount (0 if not random)
//]
// returns nothing

//

systemChat "eLS";
// Spawn Locations
private _allSpawnZones = [
	["loggingCamp1", [
		"enemy_loggingCamp1_1",
		"enemy_loggingCamp1_2"
	]]
];

// define zone specific variables
private ["_thisZone", "_thisZoneMarkers"];
for [{private _i = 0}, {_i < count _allSpawnZones}, {_i = _i + 1}] do {
	if (((_allSpawnZones select _i)select 0) isEqualTo (_this select 0)) then {
		_thisZone = (_allSpawnZones select _i);
		_thisZoneMarkers = (_thisZone select 1);
	};
};

private _factionPool = _this select 1;
private _spawnCount = _this select 2;
private _minSpawnCount = _this select 3;
private _maxSpawnCount = _this select 4;

private _amountToSpawn = if ((_minSpawnCount == 0) && (_maxSpawnCount == 0)) 
	then [ {_spawnCount}, {
		// "+ 1" because floor(random) starts at 0
		private _spawnVariance = (_maxSpawnCount - _minSpawnCount) + 1;
		floor(random _spawnVariance) + _minSpawnCount;
	}];

private _enemiesPerMarker = floor(_amountToSpawn / (count _thisZoneMarkers));

for [{private _i = 0}, {_i < count _thisZoneMarkers}, {_i = _i + 1}] do {
	systemChat format["loop number %1", _i];
	private _thisSpawnPoint = (getMarkerPos (_thisZoneMarkers select _i));
	private _newGroup = [
		_thisSpawnPoint,
		_factionPool,
		_enemiesPerMarker
	] call enemySpawner;

	_newGroup setBehaviour "SAFE";
	_newGroup setSpeedMode "NORMAL";
	_newGroup setCombatMode "RED";
	[_newGroup, _thisSpawnPoint, 300] call BIS_fnc_taskPatrol;
};
