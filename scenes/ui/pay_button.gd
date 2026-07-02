##general button to buy eye
extends TextureButton

#hover overlay
const COLOR_PRESSED := Color(0.9, 0.9, 0.9, 1.0)
@export var type: EyeInfo
var tween: Tween

func _on_mouse_entered() -> void: ##hover tween
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.2)
func _on_mouse_exited() -> void: ##normal tween
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_QUINT)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 0.2)
func _on_button_down() -> void: ##pressed tween
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), 0.1)
	self_modulate = COLOR_PRESSED
func _on_button_up() -> void: ##pressed to hover tween
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
	self_modulate = Color.WHITE

func _on_pressed() -> void:  ##spawn eye laccording to button type
	SignalBus.spawn_eye.emit(type.level)

func payable() -> bool:
	return false
