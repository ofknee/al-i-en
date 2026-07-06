extends Node

@warning_ignore("unused_signal")
signal spawn_eye(level: int, location : String)
@warning_ignore("unused_signal")
signal merge_eye(level: int, merge_position : Vector2)
@warning_ignore("unused_signal")
signal force_kill() # make disable psawning and wait until everything done moving to kill
@warning_ignore("unused_signal")
signal start_timer(duration: float)
@warning_ignore("unused_signal")
signal timer_done()

#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
##SignalBus.change_odds.connect(inc_odds)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
##		SignalBus.change_odds.emit(-(INFO[type]["strength"]))
