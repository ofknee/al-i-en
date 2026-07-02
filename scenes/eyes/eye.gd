extends Node2D
class_name Eye

@onready var sprite: Sprite2D = $Sprite2D

@export var info: EyeInfo = null

func _ready() -> void:
	type()

func type() -> void:
	if info == null:
		return
	sprite.texture = info.texture
	var scale_factor = 1.0 + info.level * 0.5
	scale = Vector2.ONE * scale_factor
