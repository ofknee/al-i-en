extends Node

var sells : int = 0

var cooldown : bool = false

signal currency_changed(new_currency: int)
var coins: int = 67: ##starting money
	set(val):
		coins = val
		score += val
		currency_changed.emit(val)
var score : int = 0
