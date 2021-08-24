// args = [position _spawnPos, arr[str] _factionPool, int _amountToSpawn]
// returns a group

// Enemies are given gear and skill level specific to their faction so this 
// function creates a new group and adds units to it with their loadouts and 
// skill edited.



private _spawnPos = (_this select 0);
private _factionPool = (_this select 1);

// select a side from the pool
// TODO: tag the new group with their faction 
private _pickedFaction = (
	_factionPool select (floor(random count _factionPool))
);
private _pickedSide = _pickedFaction call factionToSide;

private _newGroup = createGroup [_pickedSide, true];

for [{private _i = 0}, {_i < _amountToSpawn}, {_i = _i + 1}] do {
	private _newUnit = _newGroup createUnit [
		"UK3CB_CHC_C_WOOD",
		_spawnPos,
		[],
		0,
		"CAN_COLLIDE"
	];
	_newUnit addRating -10000;
	_newUnit setSkill 0.3;
	
	private _pickedLoadout = call survivorLoadoutPicker;
	_newUnit setUnitLoadout _pickedLoadout;

	// DEBUG
	// systemChat ("spawned a unit at " + str _spawnPos);
};

_newGroup
