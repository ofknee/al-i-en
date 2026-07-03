extends Control

@onready var timer = $Timer
@onready var bar = $MarginContainer/TimerBar

func _ready() -> void:
	SignalBus.start_timer.connect(start_timer)
	
	
func _process(delta: float) -> void:
	bar.value = 100 - timer.time_left/timer.wait_time * 100 # percentage of time left
	
func start_timer(duration:float) -> void:
	timer.start(duration)
	
func _on_timer_timeout() -> void:
	SignalBus.timer_done.emit() #does nothing as of rn
	SignalBus.force_kill.emit()
