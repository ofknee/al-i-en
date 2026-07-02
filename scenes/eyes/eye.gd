extends Node2D
class_name Eye

@onready var sprite: Sprite2D = $Sprite2D
@onready var coll: CollisionShape2D = $CollisionShape2D
var og_sprite_scale = 0.04
var og_coll_scale = 17

@export var info: EyeInfo = null


func _ready() -> void:
	type()

func type() -> void:
	if info == null:
		return
	sprite.texture = info.texture
	var scale_factor = 1.0 + ((info.level**2)/8.0)
	print(scale_factor)
	scale(scale_factor)
	
func scale(factor):
	sprite.scale = Vector2(og_sprite_scale*factor, og_sprite_scale*factor) 
	coll.shape.radius = og_coll_scale*factor
