extends Node2D
class_name EyeManager

@export var eye_scene: PackedScene
@onready var spawn_point: Vector2 = $SpawnPoint.global_position

@export var level1eye: EyeInfo
@export var level2eye: EyeInfo
@export var level3eye: EyeInfo
@export var level4eye: EyeInfo
@export var level5eye: EyeInfo
@export var level6eye: EyeInfo
@export var level7eye: EyeInfo
@export var level8eye: EyeInfo
@export var level9eye: EyeInfo
@onready var eye_collection = [ #TODO AUTOMATE THIS?
	level1eye,
	level2eye,
	level3eye,
	level4eye,
	level5eye,
	level6eye,
	level7eye,
	level8eye,
	level9eye
] ##TODO IS THERE A BETTER WAY TO DO THIS????

var half_width = 150

var value_dampening = 2

func _ready() -> void:
	SignalBus.spawn_eye.connect(spawn_new)
	SignalBus.merge_eye.connect(spawn_merged) 
	SignalBus.force_kill.connect(kill_all_eyes)


func _process(_delta: float) -> void:
	pass

func spawn_new(level: int, location : String) -> void: ##spawn eye @ top
	var inst: Eye = eye_scene.instantiate()
	inst.info = eye_collection[level-1]
	#print("spawning level",eye_collection[level-1].level)
	add_child(inst)
	match location:
		"left":
			inst.position = Vector2(randf_range(-1*(half_width),0.0), 0.0)
		"right":
			inst.position = Vector2(randf_range(0.0,half_width), 0.0)
		"random":
			inst.position = Vector2(randf_range(-1*(half_width),half_width), 0.0)
	
	
func spawn_merged(level: int, merge_position : Vector2):
	var inst: Eye = eye_scene.instantiate()
	inst.info = eye_collection[level-1]
	add_child(inst)
	inst.position = merge_position

func kill_all_eyes():
	var tally_coins : int = 0
	for child in get_children():
		if child is Eye: 
			tally_coins += child.info.value
			child.queue_free()
	@warning_ignore("integer_division")
	Global.coins += tally_coins/value_dampening
	Global.sells += 1
	SignalBus.start_timer.emit(20.0) ##HACK TESTING FIXME TODO
