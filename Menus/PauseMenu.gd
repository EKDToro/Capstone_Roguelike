extends Control

signal unpause

func _on_Continue_pressed():
	get_tree().paused = false
	emit_signal("unpause")
	self.queue_free()
	pass

func _on_Exit_pressed():
	get_tree().quit()
	pass
