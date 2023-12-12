extends Node

# just checking
var enemys_alive = 0
# Do you have stupid ? 
var money = 10000
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
		"cost" : 55
},
	"Tower_2": {
		"damage": 30,
		"rof": 5,
		"range": 20,
		"cost" : 250
},
	"Tower_3_Bee": {
		"damage": 1,
		"rof": 1,
		"range": 200,
		"cost" : 0
} 
}
# Mob Attributes
var mob_data = {
	"Basic": {
		"speed": 2 *10,
		"hp": 25,
		"money": 5,
		},
	"Fast": {
		"speed": 4 *10,
		"hp": 15,
		"money": 10,
		},
	"Bulky": {
		"speed": 10,
		"hp": 50,
		"money": 20,
		},
		
	"Tank": {
		"speed": 5,
		"hp": 50,
		"money": 25,
		}
		
}





# String to Spawn Enemys
# We Have Basic ; Bulky ; Fast
var wave_data = {
	"Wave_0" = 
	[["Basic",1]],
	
	"Wave_1" = [["Fast",2],["Bulky",2],["Tank",2],["Basic",2]],

	"Wave_2" = 
	[["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2]],

	"Wave_3" = 
	[["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2]],
	
	"Wave_4" = 
	[["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2],
	 ["Basic",1], ["Basic",2]],

	}
