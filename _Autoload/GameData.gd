extends Node

# just checking
var enemys_alive = 0
# Do you have stupid ? 
var money = 100
var health_points = 10



#/   _\/ \/ ___\/   _\/  _ \
#|  /  | ||    \|  /  | / \|
#|  \__| |\___ ||  \_ | \_/|
#\____/\_/\____/\____/\____/


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
		"damage": 50,
		"rof": 5,
		"range": 100,
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

