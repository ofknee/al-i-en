extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.score_changed.connect(update_text)
	update_text(0) # initial starting currency

func update_text(val:int):
	text = str(Global.score)
