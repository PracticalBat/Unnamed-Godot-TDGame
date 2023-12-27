extends Node

@export var money : int = 200

# Dict explained 
#0 = type 
#1 = Time between next spawn
#2 = lane spawn 


# Enemys:
#Spider_Basic 
#Spider_Boss
#Basic
#Fast 
#Bulky 
#Tank 


@export var wave_data = {
	"Wave_1" = 
	[["Spider_Boss",1,1],["Spider_Boss",1,1],
	["Spider_Boss",1,2],["Spider_Boss",1,2],
	["Spider_Boss",1,1],["Spider_Boss",1,2]
	],

	"Wave_2" = 
	[],

	"Wave_3" = 
	[],
	
	"Wave_4" = 
	[],
	}

func get_wave_data():
	return wave_data

func get_wave_count():
	return wave_data.size()

func get_starting_money():
	return money
