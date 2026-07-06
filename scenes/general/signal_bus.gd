extends Node

@warning_ignore("unused_signal")
signal spawn_eye(level: int, location : String)
@warning_ignore("unused_signal")
signal merge_eye(level: int, merge_position : Vector2)
@warning_ignore("unused_signal")
signal force_kill() # make disable psawning and wait until everything done moving to kill
@warning_ignore("unused_signal")
signal start_cooldown(duration: float)
