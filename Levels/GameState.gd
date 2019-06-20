extends Node2D

export var lives : int = 3


func _ready():
	add_to_group("GameState")

func hurt():
	lives -= 1
	$Player.hurt()
	if lives < 0:
		end_game()
		

func fall_out():
	end_game()

		
func end_game():
	var errors = get_tree().change_scene("res://Levels/GameOver.tscn")
	if errors:
		print(errors)
	