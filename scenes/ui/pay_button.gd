##general button to buy eye
extends Button

##paybutton type
@export var type: EyeInfo

##paying/price
var price: int
@onready var label = $RichTextLabel
var location: String
@onready var coins: int = Global.coins


##hover overlay
const COLOR_PRESSED := Color(0.85, 0.85, 0.85, 1.0)
var tween: Tween

func _ready() -> void:
	location = get_location()
	Global.currency_changed.connect(payable_redirect) #HACK
	
	#HACK stylebox
	var normal_style = get_theme_stylebox("normal")
	add_theme_stylebox_override("hover", normal_style)
	add_theme_stylebox_override("pressed", normal_style)
	add_theme_stylebox_override("focus", normal_style)
		

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
	if payable():
			Global.coins -= price
			SignalBus.spawn_eye.emit(type.level, location)
			update_price()
			SignalBus.start_cooldown.emit(0.4) #cooldown between buttons
	else:
		print("ur broke lol")

func payable() -> bool:
	if price > Global.coins:
		make_unavailable()
		#SET SFx TO ERROR TODO
		return false
	elif Global.cooldown:
		#make_unavailable()
		return false
	else:
		modulate.a = 1.0
		modulate = Color.WHITE
		return true
		# SET SFX TO PURCHASE TODO

func update_price():
	price *= 1.5
	update_label()

func reset_price():
	#price = type.value
	#label.text = str(price)
	pass

func get_location() -> String:
	if name.contains("Left"):
		return "left"
	elif name.contains("Right"):
		return "right"
	else:
		print("Location of button %s not defined!!" %[name])
		return "random"
		
func setup(new_type: EyeInfo) -> void:
	type = new_type
	price = type.value*2
	update_label()
	payable()

func update_label() -> void:
	label.text = "LEVEL %d EYE\n[outline_size=2][outline_color=black]d%d[/outline_color][/outline_size]\nSPAWN %s" % [
		type.level,
		price,
		location.to_upper()
	]
	
func payable_redirect(temp : int):
	payable()
	
func make_unavailable():
	modulate.a = 0.75
	modulate = Color.CADET_BLUE
