extends Node2D
class_name Eye

@onready var sprite: Sprite2D = $Sprite2D
@onready var coll: CollisionShape2D = $CollisionShape2D
var og_sprite_scale = 0.03
var og_coll_scale = 12.7
var level : int

@export var info: EyeInfo = null

func _ready() -> void:
	type()
	#await self.sleeping == true
	#print ("asleep")

func type() -> void:
	if info == null:
		return
	sprite.texture = info.texture
	var scale_factor = 1.0 + ((info.level**1.9)/10.0)
	level = info.level
	scale(scale_factor)
	
func scale(factor):
	sprite.scale = Vector2(og_sprite_scale*factor, og_sprite_scale*factor) 
	coll.shape.radius = og_coll_scale*factor

func _on_body_entered(body: Node) -> void: ##"merge"
	if body is Eye:
		if body.level == level:
			if name > body.name: 
				SignalBus.merge_eye.emit(level+1, position)
			queue_free()
