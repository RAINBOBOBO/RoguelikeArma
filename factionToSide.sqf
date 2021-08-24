// args = str _faction
// returns string like "civilian"

// This is a simple script to convert the factions in this world into their
// respective arma 3 sides.


private _faction = _this
private _side = "";
switch (_faction) do {
	case "survivors": {_side = "civilian"};
	case "anarchists": {_side = "independent"};
	case "raiders": {_side = "independent"};
	case "isolationists": {_side = "independent"};
	case "kingdom": {_side = "east"};
	case "rebuilders": {_side = "west"};
};

_side
