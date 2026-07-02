extends Node

var round : int = 0

signal currency_changed(new_currency: int)
var coins: int = 100: ##starting money
	set(val):
		coins = val
		currency_changed.emit(val)
