extends Button

func _on_pressed() -> void:
	SignalBus.force_kill.emit()
