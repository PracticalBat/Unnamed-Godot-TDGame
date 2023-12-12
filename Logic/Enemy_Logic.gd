extends PathFollow2D


var isdead: bool = false 
var onetime: bool = true 
var onetime_progress: bool = true 


@export var Healthbar: TextureProgressBar
@export var AnimP: AnimationPlayer
@export var HurtS: AudioStreamPlayer
@export var DeathS: AudioStreamPlayer
@export var Collision: CollisionShape2D


@export var Type: String = "Basic"

#onready 
@onready var hp : int   = GameData.mob_data[Type]["hp"]
@onready var speed: int = GameData.mob_data[Type]["speed"]
@onready var money: int = GameData.mob_data[Type]["money"]


func _ready() -> void:
	#_spawn()
	Healthbar.max_value= hp
	Healthbar.value = hp


#func _spawn() -> void:
	#isdead = true 
	#AnimP.play("SPAWN")
	#await AnimP.animation_finished
	#isdead = false


func _process(delta):
	if hp <= 0:
		is_dead_check()
	if isdead == false:
		set_progress(get_progress()+speed * delta)
	if get_progress_ratio() == 1 and onetime_progress:
			onetime_progress = false
			GameData.health_points -= 1
			on_hit(99999)

#Tower
func on_hit(damage):
	is_dead_check()
	HurtS.set_pitch_scale(randf_range(0.1,2))
	HurtS.play()
	hp -= damage
	Healthbar.value = hp


func is_dead_check() -> void:
	if hp <= 0 and isdead == false:
		isdead = true
		Collision.disabled = true
		destroy()


func destroy():
	print("WOW")
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
