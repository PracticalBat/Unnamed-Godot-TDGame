extends Node

# just checking
var enemys_alive = 0
# Do you have stupid ? 
var money = 100
var health_points = 10

var Camera_in_Quadrant = 1

#/   _\/ \/ ___\/   _\/  _ \
#|  /  | ||    \|  /  | / \|
#|  \__| |\___ ||  \_ | \_/|
#\____/\_/\____/\____/\____/



var projectile = {
	
	"freeze": {
		"damage": 10,
		"speed": 100,
		"pierce": 3,
},

	"bubble": {
		"damage": 5,
		"speed": 100,
		"pierce": 3,
},


	"poison": {
		"damage": 1,
		"speed": 50,
		"pierce": 0,
},
}

# Tower Attributes
var tower_data = {

	"Tower_1": {
		"damage": 10,
		"rof": 1,
		"range": 30,
		"cost" : 50
},
	"Tower_2": {
		"damage": 50,
		"rof": 5,
		"range": 20,
		"cost" : 150
},
	"Tower_4": {
		"damage": 5,
		"rof": 5,
		"range": 100,
		"cost" : 0
		
},
	"Tower_5": {
		"damage": 5,
		"rof": 5,
		"range": 600,
		"cost" : 0
		
		
},
	"Tower_6": {
		"damage": 5,
		"rof": 2,
		"range": 600,
		"cost" : 0
		
		
},
	"Tower_3_Bee": {
		"damage": 5,
		"rof": 2,
		"range": 200,
		"cost" : 100
		
		
		
}

}
# B : Basic 
# F : Fast 
# H : Heavy 
# T : Tank
# SB : Spider Basic
# SBoss : Spider Boss 
var mob_data = {

	"Basic": {
		"speed" :20,
		"hp": 50,
		"money": 5,
		},

	"Fast": {
		"speed": 40,
		"hp": 25,
		"money": 5,
		},

	"Heavy": {
		"speed": 10,
		"hp": 150,
		"money": 20,
		},

	"Tank": {
		"speed": 10,
		"hp": 500,
		"money": 20,
		},
		

	"Spider_Basic": {
		"speed": 30,
		"hp": 50,
		"money": 5,
		},

	"Spider_Boss": {
		"speed": 5,
		"hp": 1000,
		"money": 200,
		}

}

