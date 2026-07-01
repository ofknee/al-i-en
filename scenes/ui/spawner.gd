extends Node2D
@export var eye_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.spawn_eye.connect(spawn) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn(type: String) -> void:
	var inst = eye_scene.instantiate()
	add_child(inst)
