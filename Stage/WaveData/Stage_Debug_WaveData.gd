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
	[
		
	["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],
	["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],
	],
	
	
	"Wave_2" = 
	[
	["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],
	["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],["Basic",3,2],
	]
	
	
	}

#

func get_wave_data():
	return wave_data

func get_wave_count():
	return wave_data.size()

func get_starting_money():
	return money
