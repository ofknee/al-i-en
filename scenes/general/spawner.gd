extends Node2D

@export var eye_scene: PackedScene
@onready var spawn_point: Vector2 = $SpawnPoint.global_position

@export var level1eye: EyeInfo
@export var level2eye: EyeInfo
@export var level3eye: EyeInfo
@export var level4eye: EyeInfo
@export var level5eye: EyeInfo
@export var level6eye: EyeInfo
@onready var eye_collection = [ #TODO AUTOMATE THIS?
	level1eye,
	level2eye,
	level3eye,
	level4eye,
	level5eye,
	level6eye,
]

var value_dampening = 2

func _ready() -> void:
	SignalBus.spawn_eye.connect(spawn_new)
	SignalBus.merge_eye.connect(spawn_merged) 
	SignalBus.force_kill.connect(kill_all_eyes)


func _process(delta: float) -> void:
	pass

func spawn_new(level: int) -> void: ##spawn eye @ top
	var inst: Eye = eye_scene.instantiate()
	inst.info = eye_collection[level-1]
	#print("spawning level",eye_collection[level-1].level)
	add_child(inst)
	inst.position = Vector2(randf_range(0.0,40.0), randf_range(-10.0,40.0))
	
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
	Global.coins += tally_coins/value_dampening
	Global.round += 1
	print("round:",Global.round)
