extends CanvasLayer


func update_lives(lives):
	if typeof(lives) == 4:
		$Control/TextureRect/HBoxContainer/LifeCount.text = lives
	else:
		$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives)
	
func update_coins(coins):
	if typeof(coins) == 4:
		$Control/TextureRect/HBoxContainer/CoinCount.text = coins
	else:
		$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)