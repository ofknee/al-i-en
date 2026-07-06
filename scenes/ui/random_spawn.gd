extends TextureButton

@onready var label = $RichTextLabel
@onready var coins : int = Global.coins
#@onready var eye_collection = EyeManager.eye_collection
@export var level1 : EyeInfo
@export var level2 : EyeInfo
@export var level3 : EyeInfo

@onready var eye_collection = [level1, level2, level3]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


## interaction tweens
const COLOR_PRESSED := Color(0.9, 0.9, 0.9, 1.0)
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


func _on_pressed() -> void:
	var type = eye_collection[randi_range(0,eye_collection.size()-1)]
	SignalBus.spawn_eye.emit(type.level, "random")
