extends Node2D


func _init() -> void:
	randomize()
	
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next"):
		get_tree().paused = true

var ScenePause: String = "res://Menus/PauseMenu.tscn"
var paused: Object = null
	
func _on_PauseButton_pressed():
	if paused == null:
		paused = load(ScenePause).instance()
		$UI.add_child(paused)
		paused.connect("unpause", self, "on_paused_exit")
		get_tree().paused = true
	pass
	
func on_paused_exit() -> void:
	paused = null
	pass
