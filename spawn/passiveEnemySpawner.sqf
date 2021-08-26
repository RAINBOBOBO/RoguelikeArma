// args = none
// returns nothing

// This script constantly spawns enemies near the player and deletes enemies
// that are too far away from the player.


private _spawnTarget = playerCharacter;
private _spawnDistMin = 400;
private _spawnDistVariance = 300;
private _deleteDistance = 1500;
private _maxEnemyGroupsSpawned = 8;

private _spawnMaxDelay = 30;
private _spawnAvgDelay = 90;
private _spawnMinDelay = 180;

while {true} do {
	if (passiveEnemyCount < _maxEnemyGroupsSpawned) then {
		// determine spawn position
		private _spawnDistance = (floor(random _spawnDistVariance) + _spawnDistMin);
		private _spawnPos = _spawnTarget getRelPos [_spawnDistance, floor(random 360)];

		// TODO: determine available factions by map position
		private _allFactions = ["survivors", "anarchists"];
		private _pickedFactions = ["survivors"];

		// determine amount to spawn by faction and currentTier
		// TODO: determine by faction
		private _amountToSpawn = 0;
		switch (currentTier) do {
			case 4: {_amountToSpawn = (floor(random 3) + 1)};
			case 3: {_amountToSpawn = (floor(random 4) + 1)};
			case 2: {_amountToSpawn = (floor(random 5) + 1)};
			case 1: {_amountToSpawn = (floor(random 8) + 1)};
		};

		// DEBUG
		_amountToSpawn = 1;

		private _newGroup = [
			_spawnPos,
			_pickedFactions,
			_amountToSpawn
		] call enemySpawner;

		_newGroup setVariable ["passiveSpawned", true];

		_newGroup setBehaviour "SAFE";
		_newGroup setSpeedMode "NORMAL";
		_newGroup setCombatMode "RED";
		[_newGroup, _spawnPos, 300] call BIS_fnc_taskPatrol;
	};

	// delete units that are too far
	private _spawnedGroups = [];
	{
		if (_x getVariable "passiveSpawned") then {_spawnedGroups = _spawnedGroups + [_x]};
	} forEach allGroups;

	{
		_editGroup = _x;
		{
			if (_spawnTarget distance _x > _deleteDistance) then {deleteVehicle _x}
		} forEach units _editGroup;
		
		// if group is empty, delete
		if (count units _x == 0) then {deleteGroup _x};

	} forEach _spawnedGroups;
	passiveEnemyCount = count _spawnedGroups;
	publicVariable "passiveEnemyCount";


	private _currentSpawnDelay = (
		random [_spawnMinDelay, _spawnAvgDelay, _spawnMaxDelay]
	);

	// DEBUG
	// systemChat str _currentSpawnDelay;
	// _currentSpawnDelay = 1;

	sleep _currentSpawnDelay;
};