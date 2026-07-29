### btnBase
## Original Script Manages Tween Animation
extends Button

## Parameters
var tween: Tween

## Main Program
func _ready() -> void:
	mouse_entered.connect(userHover)
	mouse_exited.connect(userUnHover)
	pivot_offset_ratio = Vector2(.5, .5)

## Function Decleration
func userHover() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)

	# Squash
	tween.tween_property(self, "transform_offset_scale:x", 1.2, 0.1)
	tween.tween_property(self, "transform_offset_scale:y", 0.75, 0.13)
	tween.tween_property(self, "rotation_degrees", randf_range(5.0, 10.0) * [-1.0, 1.0].pick_random(), 0.1)
	
	# Stretch
	tween.chain().tween_property(self, "transform_offset_scale:x", 1.1, 0.15)
	tween.tween_property(self, "transform_offset_scale:y", 1.1, 0.15)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.1)

func userUnHover() -> void:
	if tween and tween.is_running():
		tween.kill()
	
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel(true)
	
	tween.tween_property(self, "transform_offset_scale", Vector2.ONE, 0.15)
	tween.tween_property(self, "rotation_degrees", 0.0, 0.15)
