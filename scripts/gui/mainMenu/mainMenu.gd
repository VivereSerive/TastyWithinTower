### mainMenu.gd
## TODO: Work on the Main Menu
class_name mainMenu
extends Control

## Parameters
# References
# const START = preload("") # TODO: Tutorial/Last Saved Scene
const INDEV = preload("uid://c3xt7je8lj34o")

## Functions
# btnInDev TODO: Remove or Hide when publishing
func _on_btn_in_dev_pressed() -> void:
	get_tree().change_scene_to_packed(INDEV)

# btnStart
func _on_btn_start_pressed() -> void:
	#get_tree().change_scene_to_packed(START) # TODO: Swap this out when finished with the recent one
	pass

#btnSettings
func _on_btn_settings_pressed() -> void:
	pass # TODO: Instead of Changing Scene Initialize or Activate the Settings GUI

#btnExit
func _on_btn_exit_pressed() -> void:
	get_tree().quit()
