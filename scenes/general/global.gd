extends Node

var sells : int = 0

var cooldown : bool = false

signal currency_changed(new_currency: int)
var coins: int = 67: ##starting money
	set(val):
		coins = val
		currency_changed.emit(val)

signal score_changed(new_currency: int)
var score : int = 0:
	set(val):
		score = val
		score_changed.emit(val)
