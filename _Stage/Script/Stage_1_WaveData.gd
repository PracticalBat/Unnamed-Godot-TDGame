extends Node

@export var money : int = 200

@export var wave_data = {
	"Wave_1" = 
	[["Spider_Boss",1,1],["Basic",1,2],["Basic",1,3],["Basic",1,1]],

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
