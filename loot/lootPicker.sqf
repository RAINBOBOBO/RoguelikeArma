// args = int _lootTier
// returns array of arrays like [["lootName", count], ...]

// Loot comes in 4 tiers. Each tier contains the loot pool from the previous
// tier along with new stuff. Within each tier, there are 4 rarities: common,
// uncommon, rare, and legendary. This function is told what loot tier to pick
// from and randomly selects an array of item(s) and returns that array.


// Tier 4
private _tier4Common = [
	[["CUP_15Rnd_9x19_M9", 2]],
	[["CUP_17Rnd_9x19_glock17", 2]],
	[["11Rnd_45ACP_Mag", 3]],
	[["hlc_15Rnd_9x19_JHP_P226", 1], ["hlc_15Rnd_9x19_SD_P226", 1]]
];

private _tier4Uncommon = [
	[["rhsgref_5Rnd_762x54_m38", 3]],
	[["rhsgref_5Rnd_792x57_kar98k", 3]],
	[["CUP_1Rnd_12Gauge_Pellets_No00_Buck", 15]],
	[["CUP_5Rnd_B_Saiga12_Buck_00", 2], ["CUP_5Rnd_B_Saiga12_Slug", 1]]
];

private _tier4Rare = [
	[["FirstAidKit", 1]],
	[["Binocular", 1]]
];

private _tier4Legendary = [
	[["rhs_weap_m38_rail", 1], ["rhsgref_5Rnd_762x54_m38", 1]],
	[["rhs_weap_kar98k", 1], ["rhsgref_5Rnd_792x57_kar98k", 1]],
	[["CUP_sgun_CZ584_RIS", 1], ["CUP_1Rnd_12Gauge_Pellets_No00_Buck", 1]],
	[["CUP_sgun_Saiga12K_top_rail", 1], ["CUP_5Rnd_B_Saiga12_Buck_00", 1]]
];

private _tier4 = [
	_tier4Common,
	_tier4Uncommon,
	_tier4Rare,
	_tier4Legendary
];

// Tier 3
private _tier3Common =  _tier4Common + [
	[["hlc_muzzle_Evo40", 1]],
	[["hlc_muzzle_Octane9", 1]]
];

private _tier3Uncommon = _tier4Uncommon + [
	[["HLC_optic_DocterV", 1]],
	[["optic_MRD", 1]],
	[["HLC_Optic_Docter_CADEX", 1]],
	[["optic_Aco", 1]],
	[["rhsusf_acc_ACOG", 1]]
];

private _tier3Rare = _tier4Rare + [
	[["V_Bandollier_blk", 1]],
	[["V_TacVest_blk", 1]],
	[["V_PlateCarrier2_rgr_noflag_F", 1]],
	[["rhsusf_spc_patchless", 1]],
	[["V_PlateCarrierGL_rgr", 1]],
	[["rhs_6b7_1m_emr", 1]],
	[["CUP_H_RUS_K6_3_Shield_Down", 1]],
	[["CUP_H_RUS_SSH68_olive", 1]]
];

private _tier3Legendary = _tier4Legendary + [
	[["B_Carryall_cbr", 1]],
	[["B_AssaultPack_khk", 1]],
	[["B_Bergen_mcamo_F", 1]],
	[["ItemGPS", 1]],
	[["NVGoggles_OPFOR", 1]]
];

private _tier3 = [
	_tier3Common,
	_tier3Uncommon,
	_tier3Rare,
	_tier3Legendary
];

// Tier 2
private _tier2Common = _tier3Common + [
	[["CUP_30Rnd_9x19_MP5", 2]],
	[["30Rnd_45ACP_Mag_SMG_01", 1], ["30Rnd_45ACP_Mag_SMG_01_tracer_green", 1]],
	[["CUP_64Rnd_9x19_Bizon_M", 2]]
];

private _tier2Uncommon = _tier3Uncommon + [
	[["CUP_PG7V_M", 2]],
	[["CUP_MAAWS_HEAT_M", 2]]
];

private _tier2Rare = _tier3Rare + [
	[["CUP_smg_MP5A5", 1], ["CUP_30Rnd_9x19_MP5", 1]],
	[["SMG_01_F", 1], ["30Rnd_45ACP_Mag_SMG_01", 1]],
	[["CUP_smg_bizon", 1], ["CUP_64Rnd_9x19_Bizon_M", 1]],
	[["muzzle_snds_L", 1]],
	[["muzzle_snds_acp", 1]],
	[["CUP_optic_ekp_8_02", 1]],
	[["CUP_muzzle_Bizon", 1]],
	[["CUP_optic_MAAWS_scope", 1]]
];

private _tier2Legendary = _tier3Legendary + [
	[["CUP_launch_RPG7V", 1], ["CUP_PG7V_M", 1]],
	[["CUP_launch_MAAWS", 1], ["CUP_MAAWS_HEAT_M", 1]]
];

private _tier2 = [
	_tier2Common,
	_tier2Uncommon,
	_tier2Rare,
	_tier2Legendary
];

// Tier 1
private _tier1Common = _tier2Common + [
	[["CUP_30Rnd_762x39_AK103_bakelite_M", 3]],
	[["CUP_30Rnd_680x43_Stanag", 1], ["CUP_30Rnd_680x43_Stanag_Tracer_Red", 2]],
	[["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 2]],
	[["20Rnd_762x51_Mag", 3]]
];

private _tier1Uncommon = _tier2Uncommon + [
	[["CUP_5Rnd_86x70_L115A1", 3]],
	[["CUP_10Rnd_127x99_m107", 3]]
];

private _tier1Rare = _tier2Rare + [
	[["CUP_arifle_AK103", 1], ["CUP_30Rnd_762x39_AK103_bakelite_M", 1]],
	[["CUP_arifle_ACR_blk_68", 1], ["CUP_30Rnd_680x43_Stanag", 1]],
	[["CUP_lmg_M249_E2", 1], ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 1]],
	[["arifle_SPAR_03_blk_F", 1], ["20Rnd_762x51_Mag", 1]],
	[["CUP_muzzle_mfsup_Flashhider_762x39_Black", 1]],
	[["CUP_muzzle_snds_68SPC", 1]],
	[["muzzle_snds_M", 1]],
	[["CUP_optic_HensoldtZO_RDS", 1]],
	[["muzzle_snds_B", 1]],
	[["CUP_bipod_Harris_1A2_L_BLK", 1]],
	[["optic_lrps", 1]],
	[["RKSL_optic_PMII_525", 1]],
	[["CUP_muzzle_snds_AWM", 1]],
	[["CUP_muzzle_mfsup_Suppressor_M107_Black", 1]]
];

private _tier1Legendary = _tier2Legendary + [
	[["CUP_srifle_AWM_wdl", 1], ["CUP_5Rnd_86x70_L115A1", 1]],
	[["CUP_srifle_M107_Base", 1], ["CUP_10Rnd_127x99_m107", 1]],
	[["Rangefinder", 1]]
];

private _tier1 = [
	_tier1Common,
	_tier1Uncommon,
	_tier1Rare,
	_tier1Legendary
];


// Define loot tier
private "_thisLootTier";
switch (_this) do {
	case 1: {_thisLootTier = _tier1};
	case 2: {_thisLootTier = _tier2};
	case 3: {_thisLootTier = _tier3};
	case 4: {_thisLootTier = _tier4};
};

// 0 = common, 1 = uncommon, 2 = rare, 3 = legendary
// common = 65%, uncommon = 20%, rare = 12%, legendary = 3%
private "_lootRarity";
private _lootRoll = floor(random 100);
if ((_lootRoll >= 0) && (_lootRoll <= 64)) then {_lootRarity = 0;};
if ((_lootRoll >= 65) && (_lootRoll <= 84)) then {_lootRarity = 1;};
if ((_lootRoll >= 85) && (_lootRoll <= 96)) then {_lootRarity = 2;};
if ((_lootRoll >= 97) && (_lootRoll <= 99)) then {_lootRarity = 3;};
private _lootPool = (_thisLootTier select _lootRarity);

//DEBUG
//_lootPool = (_thisLootTier select 0);

// Fill container with loot
private _lootIndex = floor(random (count _lootPool));
private _selectedLoot = (_lootPool select _lootIndex);

_selectedLoot
