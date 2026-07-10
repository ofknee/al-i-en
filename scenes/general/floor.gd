extends Area2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		print("entered")
		Global.cooldown = true
		await get_tree().create_timer(1.0).timeout
		Global.cooldown = true
		await get_tree().create_timer(1.0).timeout

		SignalBus.force_kill.emit() # Replace with function body.
