extends Control

@onready var overlay = $Overlay
@onready var margin_container = $MarginContainer

var margin_start_position: Vector2

func _ready() -> void:
	SignalBus.force_kill.connect(game_over)
	
	margin_start_position = margin_container.position
	
	await get_tree().process_frame
	margin_container.pivot_offset = margin_container.size / 2.0
	
	overlay.modulate.a = 0.0
	margin_container.modulate.a = 0.0
	
	hide()


func game_over() -> void:
	print("called")
	show()
	
	overlay.modulate.a = 0.0
	margin_container.modulate.a = 1.0
	
	margin_container.position = margin_start_position
	margin_container.scale = Vector2(0.25, 1.6)
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(overlay, "modulate:a", 0.85, 0.25)
	
	tween.tween_property(
		margin_container,
		"scale",
		Vector2(1.0, 1.0),
		0.75
	).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
