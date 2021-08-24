//Global Variables
currentTier = 4;

// Functions
lootPicker = compile preprocessFileLineNumbers "lootPicker.sqf";
enemySpawner = compile preprocessFileLineNumbers "enemySpawner.sqf";
factionToSide = compile preprocessFileLineNumbers "factionToSide.sqf";


// Remove 2 out of the 4 starter boxes
switch(floor(random 6)) do {   
	case 0: {deleteVehicle startBox1; deleteVehicle startBox2};   
	case 1: {deleteVehicle startBox1; deleteVehicle startBox3};   
	case 2: {deleteVehicle startBox1; deleteVehicle startBox4}; 
	case 3: {deleteVehicle startBox2; deleteVehicle startBox3}; 
	case 4: {deleteVehicle startBox2; deleteVehicle startBox4}; 
	case 5: {deleteVehicle startBox3; deleteVehicle startBox4};  
};

// Set faction relations
civilian setFriend[east, 0];  
civilian setFriend[west, 0];  
civilian setFriend[resistance, 0];  
east setFriend[resistance, 0];  
west setFriend[resistance, 0];
