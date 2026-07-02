extends Node2D

@export var eye_scene: PackedScene
@onready var spawn_point: Vector2 = $SpawnPoint.global_position

@export var level1eye: EyeInfo
@export var level2eye: EyeInfo
@export var level3eye: EyeInfo

@onready var eye_collection = [
	level1eye,
	level2eye,
	level3eye,
]

func _ready() -> void:
	SignalBus.spawn_eye.connect(spawn_new)
	SignalBus.merge_eye.connect(spawn_merged) 


func _process(delta: float) -> void:
	pass

func spawn_new(level: int) -> void: ##spawn eye @ top
	var inst: Eye = eye_scene.instantiate()
	inst.info = eye_collection[level-1]
	print("spawning level",eye_collection[level-1].level)
	add_child(inst)
	inst.position = Vector2(0.0, randf_range(-10.0,10.0))
	
func spawn_merged(level: int, merge_position : Vector2):
	var inst: Eye = eye_scene.instantiate()
	inst.info = eye_collection[level-1]
	print("spawning level",eye_collection[level-1].level)
	add_child(inst)
	inst.position = merge_position
