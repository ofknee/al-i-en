extends Node2D

@export var move_range := Vector2(200, 150) # max movement from start
@export var move_time := Vector2(6.0, 12.0) # min/max seconds per move

var start_pos: Vector2

func _ready() -> void:
	start_pos = position
	move()

func move() -> void:
	var target = start_pos + Vector2(
		randf_range(-move_range.x, move_range.x),
		randf_range(-move_range.y, move_range.y)
	)

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(
		self,
		"position",
		target,
		randf_range(move_time.x, move_time.y)
	)

	tween.finished.connect(move)
