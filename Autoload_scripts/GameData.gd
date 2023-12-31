extends Node

#__________Jakob Stuff______________ (DO NOT TOUCH!!!)
var is_dragging = false
#__________Jakob Stuff______________(end)
# just checking


#var enemys_alive = 0
#var money = 100
#var health_points = 10


var sell_percentage: float = 0.50


#/   _\/ \/ ___\/   _\/  _ \
#|  /  | ||    \|  /  | / \|
#|  \__| |\___ ||  \_ | \_/|
#\____/\_/\____/\____/\____/




var projectile = {
	
	"ghost": {
		"damage": 5,
		"speed": 50,
		"pierce": 0,
		"send_back": 50,
		"stun_time": 4
},
	
	"freeze": {
		"damage": 0,
		"speed": 150,
		"pierce": 2,
		"stun_time": 3,
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

	"Ghost_7": {
		"damage": 5, #obsolet
		"rof": 30,
		"range": 200, #obsolet
		"cost" : 300
		#projectile bubble
		},


}
# B : Basic 
# F : Fast 
# H : Heavy 
# T : Tank
# SB : Spider Basic
# SBoss : Spider Boss 


