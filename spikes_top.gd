extends Area2D



func _on_spikes_top_body_entered(body):
	get_tree().call_group("GameState", "hurt")
