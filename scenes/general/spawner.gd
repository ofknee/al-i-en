extends Node2D

@export var eye_scene: PackedScene
@onready var spawn_point: Vector2 = $SpawnPoint.global_position

func _ready() -> void:
	SignalBus.spawn_eye.connect(spawn) # Replace with function body.

func _process(delta: float) -> void:
	pass

func spawn(info: EyeInfo) -> void:
	var inst = eye_scene.instantiate()
	inst.info = info
	inst.global_position = spawn_point
	add_child(inst)
