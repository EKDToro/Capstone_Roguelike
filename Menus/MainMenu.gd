extends Control

onready var menu = $MarginContainer/Menu
onready var options = $Options
onready var video = $Video
onready var audio = $Audio

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
		
func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_Start_pressed():
	toggle()
	get_tree().change_scene("Game.tscn")
	
func _on_Options_pressed():
	show_and_hide(options, menu)
	
func show_and_hide(first, second):
	first.show()
	second.hide()
	
func _on_Exit_pressed():
	get_tree().quit()

func _on_Video_pressed():
	show_and_hide(video, options)

func _on_Audio_pressed():
	show_and_hide(audio, options)

func _on_BackFromOptions_pressed():
	show_and_hide(menu, options)

func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed

func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed

func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed

func _on_BackFromVideo_pressed():
	show_and_hide(options, video)

func _on_Master_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_Music_value_changed(value):
	volume(1, value)

func _on_Sound_FX_value_changed(value):
	volume(2, value)

func _on_BackFromAudio_pressed():
	show_and_hide(options, audio)
