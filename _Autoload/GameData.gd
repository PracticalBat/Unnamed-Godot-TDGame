extends Node

# just checking
var enemys_alive = 0
# Do you have stupid ? 
var money = 100
var health_points = 10
var CameraPos : Vector2

#/   _\/ \/ ___\/   _\/  _ \
#|  /  | ||    \|  /  | / \|
#|  \__| |\___ ||  \_ | \_/|
#\____/\_/\____/\____/\____/



var projectile = {
	
	"freeze": {
		"damage": 0,
		"speed": 150,
		"pierce": 2,
},

	"bubble": {
		"damage": 2,
		"speed": 20,
		"pierce": 3,
},


	"poison": {
		"damage": 1,
		"speed": 300,
		"pierce": 0,
},
}

# Tower Attributes 
# range dosen't do anything, yet!!
var tower_data = {

	"T_1": {
		"damage": 10,
		"rof": 1,
		"range": 200, #obsolet
		"cost" : 50
		#hitscan
		},
		
		
	"T_2": {
		"damage": 50,
		"rof": 5,
		"range": 200, #obsolet
		"cost" : 125
		#hitscan
		},
		
		
	"Tree_3": {
		"damage": 5,
		"rof": 1,
		"range": 200, #obsolet
		"cost" : 35
		#idn area ?
		},
		
		
	"Ice_4": {
		"damage": 0, #obsolet
		"rof": 5,
		"range": 200, #obsolet
		"cost" : 100
		#projectile freeze
		},
		
		
	"Flower_5": {
		"damage": 5, #obsolet
		"rof": 4,
		"range": 200, #obsolet
		"cost" : 75
		#projectile posion
		},
		
		
	"Axolotl_6": {
		"damage": 5, #obsolet
		"rof": 3,
		"range": 200, #obsolet
		"cost" : 150
		#projectile bubble
		},
		
		


}
# B : Basic 
# F : Fast 
# H : Heavy 
# T : Tank
# SB : Spider Basic
# SBoss : Spider Boss 
var mob_data = {

# Planned another stat called resistance that lists the said resistances of the specific enemy
# the resistance disables the func inside the enemy script 
	"Basic": {
		"speed" :20,
		"hp": 100,
		"money": 5,
		},

	"Fast": {
		"speed": 75,
		"hp": 15,
		"money": 2,
		},

	"Heavy": {
		"speed": 10,
		"hp": 150,
		"money": 5,
		},

	"Tank": {
		"speed": 10,
		"hp": 1000,
		"money": 25,
		},
		

	"Spider_Basic": {
		"speed": 30,
		"hp": 75,
		"money": 5,
		},

	"Spider_Boss": {
		"speed": 15,
		"hp": 1200,
		"money": 100,
		}

}

