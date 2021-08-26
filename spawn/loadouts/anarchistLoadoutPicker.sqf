// args = 
// returns Unit Loadout Array


hint "aLP";

private _weaponChoice = floor(random 2);

private "_selectedARifleCFG";
if (_weaponChoice == 0) then {
	// Primary weapon
	private _aRiflePoolCFG = [
		["CUP_sgun_CZ584_RIS", "CUP_1Rnd_12Gauge_Pellets_No00_Buck", 1],
		["rhs_weap_kar98k", "rhsgref_5Rnd_792x57_kar98k", 5]
	];
	_selectedARifleCFG = _aRiflePoolCFG select (
		floor(random count _aRiflePoolCFG)
	);
	private _selectedPrimary = [
		(_selectedARifleCFG select 0),
		"",
		"",
		"",
		[(_selectedARifleCFG select 1), (_selectedARifleCFG select 2)],
		[],
		""
	];
}


// Secondary weapon
private _secondaryPool = [
	[]
];
private _selectedSecondary = _secondaryPool select (
	floor(random count _secondaryPool)
);


private "_selectedHGunCFG";
if (_weaponChoice == 1) then {
	private _hGunPoolCFG = [
		["CUP_hgun_M9", "CUP_15Rnd_9x19_M9", 15],
		["CUP_hgun_Glock17_blk", "CUP_17Rnd_9x19_glock17", 17],
		["hgun_Pistol_heavy_01_F", "11Rnd_45ACP_Mag", 11],
		["hlc_pistol_P226US", "hlc_15Rnd_9x19_JHP_P226", 15]
	];
	_selectedHGunCFG = _hGunPoolCFG select (
		floor(random count _hGunPoolCFG)
	);
	private _selectedHandGun = [
		(_selectedHGunCFG select 0),
		"",
		"",
		"",
		[(_selectedHGunCFG select 1), (_selectedHGunCFG select 2)],
		[],
		""
	];
}


private ["_selectedWeaponCFG", "_magCount"];
if (_weaponChoice == 0) then {
	_selectedWeaponCFG = _selectedARifleCFG;
	if (_selectedWeaponCFG)
} else {
	_selectedWeaponCFG =	_selectedHGunCFG;
	_magCount = 2;
};

// Uniform pool
private _uniformPool = [
	[
		"U_BG_Guerilla2_1",
		[[(_selectedWeaponCFG select 1), (_selectedWeaponCFG select 2), _magCount]]
	],
	[
		"U_BG_Guerilla2_2",
		[[(_selectedWeaponCFG select 1), (_selectedWeaponCFG select 2), _magCount]]
	],
	[
		"U_BG_Guerilla2_3",
		[[(_selectedWeaponCFG select 1), (_selectedWeaponCFG select 2), _magCount]]
	],
	[
		"U_BG_Guerilla3_1",
		[[(_selectedWeaponCFG select 1), (_selectedWeaponCFG select 2), _magCount]]
	]
];
private _selectedUniform = _uniformPool select (
	floor(random count _uniformPool)
);


// Vest pool
private _vestPool = [
	[]
];
private _selectedVest = _vestPool select (
	floor(random count _vestPool)
);


// Backpack pool
private _backpackPool = [
	[]
];
private _selectedBackpack = _backpackPool select (
	floor(random count _backpackPool)
);


// Headgear pool
private _headgearPool = [
	"milgp_h_cap_backwards_01_khk",
	"milgp_h_cap_backwards_01_AOR1",
	"milgp_h_cap_backwards_01_AOR2",
	"milgp_h_cap_backwards_01_CB",
	"milgp_h_cap_backwards_01_MC",
	"milgp_h_cap_backwards_01_RGR",
	"milgp_h_cap_01_khk",
	"milgp_h_cap_01_AOR1",
	"milgp_h_cap_01_AOR2",
	"milgp_h_cap_01_CB",
	"milgp_h_cap_01_MC",
	"milgp_h_cap_01_RGR",
	"rds_Woodlander_cap1",
	"rds_Woodlander_cap2",
	"rds_Woodlander_cap3",
	"rds_Woodlander_cap4",
	""
];
private _selectedHeadgear = _headgearPool select (
	floor(random count _headgearPool)
);


// Facewear pool
private _facewearPool = [
	""
];
private _selectedFacewear = _facewearPool select (
	floor(random count _facewearPool)
);


private _survivorLoadout = [
	_selectedPrimary,
	_selectedSecondary,
	_selectedHandGun,
	_selectedUniform,
	_selectedVest,
	_selectedBackpack,
	_selectedHeadgear,
	_selectedFacewear,
	[],
	["", "", "", "", "", ""]
];

_survivorLoadout