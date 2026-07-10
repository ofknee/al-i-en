extends HBoxContainer

@export var eye_type : EyeInfo
@onready var left_button = $LeftButton
@onready var right_button = $RightButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_button.setup(eye_type)
	right_button.setup(eye_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
