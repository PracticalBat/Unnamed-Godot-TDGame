extends Node

@export var money : int = 200

@export var wave_data = {
	"Wave_0" = 
	[["Basic",3],["Basic",3],["Basic",3]],
	
	"Wave_1" = 
	[
	["Basic",2],["Basic",2],["Basic",2],
	["Basic",2],["Basic",2],["Basic",2],
	],

	"Wave_2" = 
	[
	["Basic",1], ["Basic",3],
	["Basic",1], ["Basic",3],
	["Basic",1], ["Basic",3],
	["Basic",1], ["Basic",3]
	],

	"Wave_3" = 
	[
	["Fast",1],
	["Basic",1], ["Basic",1],
	["Basic",1], ["Basic",1],
	["Basic",1], ["Basic",1],
	["Basic",1], ["Basic",1],
	["Fast",1]
	],
	
	"Wave_4" = 
	[
	["Fast",0.5], ["Fast",0.5],
	["Fast",0.5], ["Fast",0.5],
	["Fast",0.5], ["Fast",10],
	["Fast",0.5], ["Fast",0.5],
	["Fast",0.5], ["Fast",0.5],
	["Fast",0.5], ["Fast",10]
	],

	"Wave_5" = 
	[
	["Fast",0.5], ["Fast",0.5],["Fast",0.5],
	["Bulky",5], ["Bulky",5],["Bulky",5],["Bulky",5], ["Bulky",10],
	["Basic",0.5], ["Basic",0.5],
	["Basic",0.5], ["Basic",0.5],
	["Fast",0.5], ["Fast",0.5],["Fast",0.5],
	["Fast",0.5], ["Fast",0.5],["Fast",0.5],
	],
"Wave_6" = 
	[
	["Basic",0.2], ["Basic",0.2],["Basic",0.2], ["Basic",0.2],["Basic",0.2], ["Basic",0.2],["Basic",0.2], ["Basic",0.2],
	["Bulky",5], ["Bulky",5],
	["Basic",0.2], ["Basic",0.2],["Basic",0.2], ["Basic",0.2],["Basic",0.2], ["Basic",0.2],["Basic",0.2], ["Basic",0.2],
	["Bulky",5], ["Bulky",5],
	["Fast",0.5], ["Fast",0.5],["Fast",0.5],
	["Fast",0.5], ["Fast",0.5],["Fast",0.5],
	["Fast",0.5], ["Fast",0.5],["Fast",0.5],
	],


	}

func wavedata():
	return wave_data


func starting_money():
	return money


