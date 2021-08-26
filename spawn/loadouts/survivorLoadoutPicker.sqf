// args = 
// returns Unit Loadout Array


hint "IS THIS THING ON";
// Primary weapon
private _primaryPool = [
	[]
];
private _selectedPrimary = _primaryPool select (
	floor(random count _primaryPool)
);


// Secondary weapon
private _secondaryPool = [
	[]
];
private _selectedSecondary = _secondaryPool select (
	floor(random count _secondaryPool)
);


private _hGunPoolCFG = [
	["CUP_hgun_M9", "CUP_15Rnd_9x19_M9", 15],
	["CUP_hgun_Glock17_blk", "CUP_17Rnd_9x19_glock17", 17],
	["hgun_Pistol_heavy_01_F", "11Rnd_45ACP_Mag", 11],
	["hlc_pistol_P226US", "hlc_15Rnd_9x19_JHP_P226", 15]
];
private _selectedHGunCFG = _hGunPoolCFG select (
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

// TODO: rewrite this better pls
// Uniform pool
private _uniformPool = [
	[
		"UK3CB_CHC_C_U_WOOD_01",
		[[(_selectedHGunCFG select 1), (_selectedHGunCFG select 2), 1]]
	],
	[
		"UK3CB_CHC_C_U_WOOD_02",
		[[(_selectedHGunCFG select 1), (_selectedHGunCFG select 2), 1]]
	],
	[
		"UK3CB_CHC_C_U_WOOD_03",
		[[(_selectedHGunCFG select 1), (_selectedHGunCFG select 2), 1]]
	],
	[
		"UK3CB_CHC_C_U_WOOD_04",
		[[(_selectedHGunCFG select 1)), (_selectedHGunCFG select 2), 1]]
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
