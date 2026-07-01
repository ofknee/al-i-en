extends RigidBody2D
class_name Eye

@onready var sprite: Sprite2D = $Sprite2D

@export var info: EyeInfo = null
func _ready() -> void:
	type()



func type() -> void:
	if info == null:
		return
	
	sprite.texture = info.texture
	scale = Vector2.ONE * info.size
	
