extends PathFollow2D

var ALIVE: bool = true 
var REACHED_END: bool = false 

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
		progress += (SPEED * delta)

	if HP <= 0:
		is_dead_check()

	if get_progress_ratio() == 1 and REACHED_END == false:
		REACHED_END = true
		GameData.health_points -= The_damage_the_enemy_does_to_the_player_when_he_reaches_the_end
		on_hit(99999999)



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
	
	change_color(Color.SKY_BLUE,freeze_time)
	
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
	DeathSFX.play()
	if onetime:
		onetime = false
		GameData.enemys_alive -= 1
		if REACHED_END == false:
			GameData.money += MONEY
		else: print("no money for loooooooosers git gut bozo")
	Movement_AnimationPlayer.stop()
	FX_AnimationPlayer.clear_queue()
	FX_AnimationPlayer.queue("on_death")
