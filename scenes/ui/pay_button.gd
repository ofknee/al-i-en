extends TextureButton


#COLORS BC WE WHIMSY (not really though over here :((( )

const COLOR_PRESSED := Color(0.9, 0.9, 0.9, 1.0)
@export var type: EyeInfo
var tween: Tween

func _on_mouse_entered() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2(1.15, 1.15), 0.4)


func _on_mouse_exited() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUINT)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 0.2)

func _on_button_down() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
	self_modulate = COLOR_PRESSED


func _on_button_up() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.15, 1.15), 0.1)
	self_modulate = Color.WHITE


func _on_pressed() -> void:
	SignalBus.spawn_eye.emit(type.level)
