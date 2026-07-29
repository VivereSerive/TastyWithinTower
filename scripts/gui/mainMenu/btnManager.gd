### btnManager
## Script Manages Tween Animation
extends VBoxContainer

## Parameters
var tweens: Dictionary = {} # Button -> Tween, since each button needs its own tween state

## Main Program
func _ready() -> void:
	for child in get_children():
		if child is Button:
			child.pivot_offset_ratio = Vector2(0.5, 0.5)
			child.mouse_entered.connect(userHover.bind(child))
			child.mouse_exited.connect(userUnHover.bind(child))

## Function Decleration
func userHover(btn: Button) -> void:
	if tweens.has(btn) and tweens[btn].is_running():
		tweens[btn].kill()
	
	var tween: Tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)

	# Squash
	tween.tween_property(btn, "transform_offset_scale:x", 1.2, 0.1)
	tween.tween_property(btn, "transform_offset_scale:y", 0.75, 0.13)
	tween.tween_property(btn, "rotation_degrees", randf_range(5.0, 10.0) * [-1.0, 1.0].pick_random(), 0.1)
	
	# Stretch
	tween.chain().tween_property(btn, "transform_offset_scale:x", 1.1, 0.15)
	tween.tween_property(btn, "transform_offset_scale:y", 1.1, 0.15)
	tween.tween_property(btn, "rotation_degrees", 0.0, 0.1)

func userUnHover(btn: Button) -> void:
	if tweens.has(btn) and tweens[btn].is_running():
		tweens[btn].kill()
	
	var tween: Tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel(true)
	
	tween.tween_property(btn, "transform_offset_scale", Vector2.ONE, 0.15)
	tween.tween_property(btn, "rotation_degrees", 0.0, 0.15)
