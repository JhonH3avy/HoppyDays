extends Node2D

export var lives : int = 3
export var coins : int
export var target_coins : int = 10


func _ready():
	add_to_group("GameState")
	update_GUI()

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()


func coin_up():
	coins += 1
	var multiple_of_coins = (coins % target_coins) == 0 && coins != 0
	if multiple_of_coins:
		life_up()
	update_GUI()


func life_up():
	lives += 1


func update_GUI():
	get_tree().call_group("GUI","update_lives",lives)
	get_tree().call_group("GUI","update_coins", coins)


func fall_out():
	end_game()

		
func end_game():
	var errors = get_tree().change_scene("res://Levels/GameOver.tscn")
	if errors:
		print(errors)
	