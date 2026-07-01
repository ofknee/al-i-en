extends RigidBody2D
class_name Eye

var info: EyeInfo 
@onready var sprite: Sprite2D = $Sprite2D

func create(type: EyeInfo) -> void:
	info = type
	sprite.texture = info.texture
	scale = Vector2.ONE * info.size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass#if  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func type(info : EyeInfo) -> void:
	pass
