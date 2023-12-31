extends PathFollow2D

var ALIVE: bool = true 
var REACHED_END: bool = false 

var Total_DMG : int = 0
var global_dmg_color : Color = Color.WHITE


@onready var Damage_Number = preload("res://Damage_Num/damage_indicator.tscn")




@export_category("/////Enemy_Data/////")

@export var Data : Node 

@export var The_damage_the_enemy_does_to_the_player_when_he_reaches_the_end: int = 1
#Temp (Joke)

@export_category("/////Code_Refrences/////")

@export var Healthbar: TextureProgressBar

@export var Movement_AnimationPlayer: AnimationPlayer
@export var FX_AnimationPlayer: AnimationPlayer

@export var EnemyCollison: CollisionShape2D
@export var CharacterBody: CharacterBody2D
@export var Sprite: Sprite2D

@export_category("/////Sound_SFX/////")
@export var HurtSFX: AudioStreamPlayer
@export var DeathSFX: AudioStreamPlayer


#Init the Enemy Values via GameData
@onready var NAME: String  = Data.NAME
@onready var HP : int   = Data.HP
@onready var SPEED: int = Data.SPEED
@onready var MONEY: int = Data.MONEY_ON_DEFEAT



# var that keeps track of what status effect it had and slowly returns to normal over lerp or tween 

func _process(delta):
	if HP != Data.HP:
		Healthbar.visible = true
	
	if ALIVE:
		progress += ( SPEED * delta )

	if HP <= 0:
		is_dead_check()

	if get_progress_ratio() == 1 and REACHED_END == false:
		on_end_of_path_reached()
		REACHED_END = true



func _ready() -> void:
	print("Spawned : + "+ str(NAME))
	randomize_pos_and_scale()
	Healthbar.max_value = HP
	Healthbar.value = HP


func randomize_pos_and_scale():

	randomize()
	
	var size :float = CharacterBody.scale.x +randf_range(-0.2, 0.2)
	CharacterBody.scale = Vector2 (size,size)
	CharacterBody.position = Vector2 (randi_range(-4, 4),(randi_range(-4, 4)))


func change_color(color,keep_time):
	global_dmg_color = color
	CharacterBody.set_modulate(color)
	await get_tree().create_timer(keep_time,false).timeout
	CharacterBody.set_modulate(Color.WHITE)


func poison(tick_wait_time , tick_ammount , damage):

	Movement_AnimationPlayer.speed_scale = 0.5
	#change_color(Color.GREEN_YELLOW,tick_wait_time * tick_ammount)
	print(tick_wait_time * tick_ammount)
	for i in tick_ammount:
		change_color(Color.GREEN_YELLOW,0.3) #Temp 
		on_hit(damage)
		await get_tree().create_timer(tick_wait_time,false).timeout

	Movement_AnimationPlayer.speed_scale = 1


func freeze(freeze_time, damage):

	on_hit(damage)
	
	ALIVE = false
	
	Movement_AnimationPlayer.pause()
	
	change_color(Color.ROYAL_BLUE,freeze_time)
	
	await get_tree().create_timer(freeze_time, false).timeout
	
	ALIVE = true
	
	Movement_AnimationPlayer.play()

func go_home(send_back, damage, stun_time):
	on_hit(damage)
	change_color(Color.REBECCA_PURPLE,stun_time)
	Movement_AnimationPlayer.pause()
	var initP = get_progress()
	if initP - send_back <= 0:
		set_progress(0)
	else: 
		set_progress(initP - send_back)
		
	ALIVE = false
	await get_tree().create_timer(stun_time, false).timeout
	Movement_AnimationPlayer.play()
	ALIVE = true



# How the ENEMY takes damage
func on_hit(damage):
	Total_DMG += damage
	$DMG_Display_Timer.start()
	if HP <= 0:
		is_dead_check()
	HP -= damage
	Healthbar.value = HP

	if HurtSFX.playing == false:
		HurtSFX.set_pitch_scale(randf_range(0.5,2.0))
		HurtSFX.play()

	FX_AnimationPlayer.queue("hit_flash")


func is_dead_check() -> void:

	if HP <= 0 and ALIVE:
		ALIVE = false
		EnemyCollison.disabled = true
		on_destroy()


func on_destroy():
	var onetime : bool = true
	if onetime:
		_on_damage_number_timer_timeout()
		DeathSFX.play()
		onetime = false
		StageData.enemys_alive -= 1
		#if REACHED_END == false:
			#GameData.money += MONEY
		#else: print("no money for loooooooosers git gut bozo")
	Movement_AnimationPlayer.stop()
	FX_AnimationPlayer.clear_queue()
	FX_AnimationPlayer.queue("on_death")

func on_end_of_path_reached():
	StageData.health_points -= The_damage_the_enemy_does_to_the_player_when_he_reaches_the_end
	StageData.enemys_alive -= 1
	Movement_AnimationPlayer.stop()
	FX_AnimationPlayer.clear_queue()
	FX_AnimationPlayer.queue("on_death")



func _on_damage_number_timer_timeout() -> void:
	spawn_dmg_num(Total_DMG)

func instance_damage_number():
	return Damage_Number.instantiate()


# we  need to create a timer that resets after taking damage again, so that there arent too many numberts on scrren at once 
# and if that timer timeout thene there should be the added numebr spawned

func spawn_dmg_num(damage):
	Total_DMG = 0 
	var damage_number = instance_damage_number()
	var val = str(round(damage))
	var pos = $CharacterBody2D/Damage_number_spawn_Pos.position
	var height = 30
	var spread = 50
	add_child(damage_number,true)
	damage_number.set_and_animate(val,pos,height, spread , global_dmg_color)
	global_dmg_color =  Color.WHITE # problem for later :D
	# Problem is that diffrent damage color overwrite each other 
	
