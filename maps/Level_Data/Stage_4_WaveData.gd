extends Node

@export var money : int = 200

@export var wave_data = {
	"Wave_0" = 
	[["Spider_Basic",1],["Spider_Basic",1]],
	
	"Wave_1" = 
	[["Spider_Basic",1],["Spider_Basic",1],["Spider_Basic",1],["Spider_Basic",1]],

	"Wave_2" = 
	[],

	"Wave_3" = 
	[],
	
	"Wave_4" = 
	[],

	}

func wavedata():
	return wave_data


func starting_money():
	return money

