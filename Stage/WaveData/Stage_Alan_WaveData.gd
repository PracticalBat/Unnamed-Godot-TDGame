extends Node

@export var money : int = 300

# ::::Dict explained::::
#["Spider_Boss",1,1]
#0 = type 
#1 = Time between next spawn
#2 = lane spawn 


# :::::Enemys:::::
#Spider_Basic 
#Spider_Boss
#Basic
#Fast 
#Bulky 
#Tank 


@export var wave_data = {

#
	"Wave_1" = 
	[
		
	["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],
	["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],
	["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],
	["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],["Basic",1,2],
	
#
#
#
	##"Wave_3" = 
	##[
	##
	##["Spider_Basic",1,2],["Spider_Basic",1,2],["Spider_Basic",1,1],["Spider_Basic",1,1],
	##["Basic",1,1],["Basic",1,1],["Basic",1,2],["Basic",1,2],
	##
	##],
##
##
##
	##"Wave_4" = 
	##[
	##
	##["Spider_Basic",1,2],["Spider_Basic",1,2],["Spider_Basic",1,1],["Spider_Basic",1,1],
	##["Basic",1,1],["Basic",1,1],["Basic",1,2],["Basic",1,2],
	##
	##],
	##
	##"Wave_5" = 
	##[
	##
	##["Spider_Basic",1,2],["Spider_Basic",1,2],["Spider_Basic",1,1],["Spider_Basic",1,1],
	##["Basic",1,1],["Basic",1,1],["Basic",1,2],["Basic",1,2],
	##
	##],
	##"Wave_6" = 
	##[
	##
	##["Spider_Basic",1,2],["Spider_Basic",1,2],["Spider_Basic",1,1],["Spider_Basic",1,1],
	##["Basic",1,1],["Basic",1,1],["Basic",1,2],["Basic",1,2],
	##
	##],
	#
	#"Wave_3" = 
	#[
	#
	#["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],
	#["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],["Spider_Boss",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],
	#["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],["Fast",0.5,2],["Fast",0.5,1],
	#
	#
	#],
	#
	#"Wave_4" = 
	#[
	#
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],["Spider_Basic",0.8,1],["Spider_Basic",0.8,2],
	#
	#],
	#
	#"Wave_5" = 
	#[
	#
	#["Tank",1,2],["Tank",1,2],["Tank",1,1],["Tank",1,1],
	#["Tank",1,1],["Tank",1,1],["Tank",1,2],["Tank",1,2],
	#
	#],
	#
	#"Wave_6" = 
	#[
	#
	#["Spider_Boss",5,2],["Spider_Boss",5,1],["Spider_Boss",5,1],["Spider_Boss",5,2],
	#
	
	],
	

	}

func get_wave_data():
	return wave_data

func get_wave_count():
	return wave_data.size()

func get_starting_money():
	return money
