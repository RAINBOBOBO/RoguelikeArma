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
		"I_C_Soldier_Bandit_7_F",
		_spawnPos,
		[],
		0,
		"CAN_COLLIDE"
	];
	_newUnit setUnitLoadout (getUnitLoadout ICD1);
	_newUnit setSkill 0.3;
};

_newGroup
