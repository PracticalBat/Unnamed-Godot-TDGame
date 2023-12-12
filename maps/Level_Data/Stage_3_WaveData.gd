extends Node
@export var money : int = 200

@export var wave_data = {
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

func wavedata():
	return wave_data


func starting_money():
	return money


