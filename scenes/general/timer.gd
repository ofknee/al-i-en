extends Control

@onready var timer = $Timer
@onready var bar = $MarginContainer/TimerBar

func _ready() -> void:
	SignalBus.start_cooldown.connect(start_cooldown)
	
func _process(delta: float) -> void:
	bar.value = 100 - timer.time_left/timer.wait_time * 100 # percentage of time left
	
func start_cooldown(duration:float) -> void:
	timer.start(duration)
	Global.cooldown = true
	
func _on_timer_timeout() -> void:
	Global.cooldown = false
