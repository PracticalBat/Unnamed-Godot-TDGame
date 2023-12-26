extends PathFollow2D


var isdead: bool = false 
var onetime: bool = true 
var onetime_progress: bool = true 

@export var Healthbar: TextureProgressBar
@export var AnimP: AnimationPlayer
@export var HurtS: AudioStreamPlayer
@export var DeathS: AudioStreamPlayer
@export var Collision: CollisionShape2D
@export var Body: CharacterBody2D
@export var Sprite: Sprite2D

@export var Type: String = "Basic"

#onready 
@onready var hp : int   = GameData.mob_data[Type]["hp"]
@onready var speed: int = GameData.mob_data[Type]["speed"]
@onready var money: int = GameData.mob_data[Type]["money"]

# var that keeps track of what status effect it had and slowly returns to normal over lerp or tween 


func _ready() -> void:
	rand_scale_pos()
	#_spawn()
	Healthbar.max_value= hp
	Healthbar.value = hp

func rand_scale_pos():
	randomize()
	var size : float = Body.scale.x +randf_range(-0.2, 0.2)
	Body.scale = Vector2 (size,size)
	Body.position = Vector2 (randf_range(-3, 3),(randf_range(-3, 3)))



	#poison_timer = 10; // poison life
	#alarm[0] = 1; // start poisoning right away
	#
#if poison_timer > 0 {
	#poison_timer -= 1;
	#hp -= posion_damage; // whatever damage you want
	#alarm[0] = room_speed; // wait for 1 second before dealing poison damage again
#} 

#tick_wait_time , tick_ammount , damage

func poison(tick_wait_time , tick_ammount , damage):

	AnimP.speed_scale = 0.5
	self.modulate = Color.GREEN_YELLOW

	if not get_tree().paused:
		for i in tick_ammount:
			on_hit(damage)
			await not get_tree().paused
			await get_tree().create_timer(tick_wait_time).timeout

	AnimP.speed_scale = 1
	self.modulate = Color.WHITE



func freeze(freeze_time, damage):
	on_hit(damage)
	
	isdead = true
	AnimP.pause()
	self.modulate = Color.SKY_BLUE
	await get_tree().create_timer(freeze_time).timeout
	AnimP.play()
	isdead = false
	self.modulate = Color.WHITE


#func _spawn() -> void:
	#isdead = true 
	#AnimP.play("SPAWN")
	#await AnimP.animation_finished
	#isdead = false


func _process(delta):
	if hp <= 0:
		is_dead_check()
	if isdead == false:
		progress += (speed * delta)
	if get_progress_ratio() == 1 and onetime_progress:
			onetime_progress = false
			GameData.health_points -= 1
			on_hit(99999)

# How the ENEMY takes damage
func on_hit(damage):
	is_dead_check()
	HurtS.set_pitch_scale(randf_range(0.1,2.0))
	HurtS.play()
	hp -= damage
	Healthbar.value = hp


func is_dead_check() -> void:
	if hp <= 0 and isdead == false:
		isdead = true
		Collision.disabled = true
		on_destroy()


func on_destroy():
	AnimP.play("DEATH")
	DeathS.play()
	await AnimP.animation_finished
	if onetime:
		onetime = false
		deduct()
		add_money()
	self.queue_free()


func deduct():
	print("DEBUG : Enemy Destroyed " +str(Type))
	GameData.enemys_alive -= 1


func add_money():
	GameData.money += money
