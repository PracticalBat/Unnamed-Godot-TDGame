extends PathFollow2D

#Booleans
var ALIVE: bool = true 
var REACHED_END: bool = false 

@export_category("/////Enemy_Name/////")

@export var Enemy_Typ: String = "Basic"

@export var The_Damage_The_Enemy_Dose_To_The_Player_When_It_Reaches_The_End: int = 1

@export_category("/////Code_Refrences/////")

@export var Healthbar: TextureProgressBar

@export var Movement_AnimationPlayer: AnimationPlayer
@export var Effects_AnimationPlayer: AnimationPlayer

@export var EnemyCollison: CollisionShape2D
@export var CharacterBody: CharacterBody2D
@export var Sprite: Sprite2D

@export_category("/////Sound_FX/////")
@export var HurtSound: AudioStreamPlayer
@export var DeathSound: AudioStreamPlayer


#Init the Enemy Values via GameData
@onready var HP : int   = GameData.mob_data[Enemy_Typ]["hp"]
@onready var SPEED: int = GameData.mob_data[Enemy_Typ]["speed"]
@onready var MONEY: int = GameData.mob_data[Enemy_Typ]["money"]



# var that keeps track of what status effect it had and slowly returns to normal over lerp or tween 

func _process(delta):

	if ALIVE:
		progress += (SPEED * delta)

	if HP <= 0:
		is_dead_check()


func _ready() -> void:
	print("Cowabanga")
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
		await not get_tree().paused
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
	






	if get_progress_ratio() == 1 and not REACHED_END:
		REACHED_END = true
		GameData.health_points -= The_Damage_The_Enemy_Dose_To_The_Player_When_It_Reaches_The_End
		on_hit(99999999)



# How the ENEMY takes damage
func on_hit(damage):
	if HP <= 0:
		is_dead_check()
	HP -= damage
	Healthbar.value = HP

	if HurtSound.playing == false:
		HurtSound.set_pitch_scale(randf_range(0.5,2.0))
		HurtSound.play()

	Effects_AnimationPlayer.play("hit_flash")

func is_dead_check() -> void:

	if HP <= 0 and ALIVE:
		ALIVE = false
		EnemyCollison.disabled = true
		on_destroy()


func on_destroy():
	var onetime : bool = true
	print("WOOOOOOOOO")
	DeathSound.play()
	Movement_AnimationPlayer.play("DEATH")
	
	if onetime:
		onetime = false
		GameData.enemys_alive -= 1
		if REACHED_END == false:
			GameData.money += MONEY
		else: print("no money for loosers")
	
	await Movement_AnimationPlayer.animation_finished
	self.queue_free()
