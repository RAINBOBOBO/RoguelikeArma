// args = [position _spawnPos, arr[str] _factionPool, int _amountToSpawn]
// returns a group

// Enemies are given gear and skill level specific to their faction so this 
// function creates a new group and adds units to it with their loadouts and 
// skill edited.


// Faction Skill Ranges ["name", min, max]
private _factionSkillRanges = [
	["survivors", 20, 100],
	["anarchists", 25, 45],
	["raiders", 35, 50],
	["isolationists", 30, 60],
	["kingdom", 50, 100],
	["rebuilders", 60, 100]
];


private _spawnPos = (_this select 0);
private _factionPool = (_this select 1);

// select a side from the pool
// TODO: tag the new group with their faction 
private _pickedFaction = (
	_factionPool select (floor(random count _factionPool))
);
private _pickedSide = _pickedFaction call factionToSide;

private ["_pickedFactionSkills", "_fSkillMin", "_fSkillMax"];
for [{private _i = 0}, {_i < count _factionSkillRanges}, {_i = _i + 1}] do {
	if (_pickedFaction == (_factionSkillRanges select _i)select 0) then {
		_pickedFactionSkills = _factionSkillRanges select _i;
		_fSkillMin = _pickedFactionSkills select 1;
		_fSkillMax = _pickedFactionSkills select 2;
	};
};

private "_unitToSpawn";
switch (_pickedFaction) do {
	case "survivors": {_unitToSpawn = "CUP_C_R_Woodlander_01"};
	case "anarchists": {_unitToSpawn = "I_C_Soldier_Bandit_7_F"};
	case "raiders": {_unitToSpawn = "I_C_Soldier_Bandit_7_F"};
	case "isolationists": {_unitToSpawn = "I_C_Soldier_Bandit_7_F"};
	case "kingdom": {_unitToSpawn = "rhs_rva_crew"};
	case "rebuilders": {_unitToSpawn = "B_Soldier_A_F"};
};

private _newGroup = createGroup [_pickedSide, true];

for [{private _i = 0}, {_i < _amountToSpawn}, {_i = _i + 1}] do {
	private _newUnit = _newGroup createUnit [
		_unitToSpawn,
		_spawnPos,
		[],
		0,
		"CAN_COLLIDE"
	];

	if (_pickedSide isEqualTo "civilian") then {_newUnit addRating -10000};
	
	private _skillVariance = ((_fSkillMax) - (_fSkillMin) + 1);
	private _pickedSkill = (floor(random _skillVariance) + _fSkillMin);
	_newUnit setSkill _pickedSkill;
	
	private "_pickedLoadout";
	switch (_pickedFaction) do {
		case "survivors": {_pickedLoadout = call survivorLoadoutPicker};
		case "anarchists": {_pickedLoadout = call anarchistLoadoutPicker};
		case "raiders": {_pickedLoadout = call raiderLoadoutPicker};
		case "isolationists": {_pickedLoadout = call isolationistLoadoutPicker};
		case "kingdom": {_pickedLoadout = call kingdomLoadoutPicker};
		case "rebuilders": {_pickedLoadout = call rebuilderLoadoutPicker};
	};
	_newUnit setUnitLoadout _pickedLoadout;

	// DEBUG
	// systemChat ("spawned a unit at " + str _spawnPos);
};

_newGroup
