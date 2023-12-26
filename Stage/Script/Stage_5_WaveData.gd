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
	["Tank",1,1],["Tank",1,2]
	],

	"Wave_2" = 
	[["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],
	["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],["Spider_Basic",1,1],],

	"Wave_3" = 
	[["Spider_Basic",0.5,2],["Spider_Basic",0.5,2],["Spider_Basic",0.5,1],["Spider_Basic",0.5,1],
	["Spider_Basic",0.5,2],["Spider_Basic",0.5,2],["Spider_Basic",0.5,1],["Spider_Basic",0.5,1],
	["Spider_Basic",0.5,2],["Spider_Basic",0.5,2],["Spider_Basic",0.5,1],["Spider_Basic",0.5,1],
	["Spider_Basic",0.5,2],["Spider_Basic",0.5,2],["Spider_Basic",0.5,1],["Spider_Basic",0.5,1],
	["Spider_Basic",0.5,2],["Spider_Basic",0.5,2],["Spider_Basic",0.5,1],["Spider_Basic",0.5,1],
	["Spider_Basic",0.5,2],["Spider_Basic",0.5,2],["Spider_Basic",0.5,1],["Spider_Basic",0.5,1],],
	
	"Wave_4" = 
	[],
	}

func get_wave_data():
	return wave_data

func get_wave_count():
	return wave_data.size()

func get_starting_money():
	return money
