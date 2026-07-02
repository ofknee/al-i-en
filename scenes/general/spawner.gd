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
	SignalBus.spawn_eye.connect(spawn) # Replace with function body.

func _process(delta: float) -> void:
	pass

func spawn(level_temp: int) -> void: ##spawn eye of level at marker2d
	var inst: Eye = eye_scene.instantiate()
	inst.info = eye_collection[level_temp-1]
	print("spawning level",eye_collection[level_temp-1].level)
	add_child(inst)
	inst.position = Vector2(0.0, randf_range(-10.0,10.0))
	
