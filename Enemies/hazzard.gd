extends Area2D



func _on_hazzard_body_entered(body):
	get_tree().call_group("GameState", "hurt")
