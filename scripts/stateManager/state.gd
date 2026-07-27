### state.gd
### use this state class as a reference instead of depending on this script
class_name state
extends Node

## Function Decleratiosn
func enter() -> void:
	pass

func exit() -> void:
	pass

func processInput(event: InputEvent) -> state:
	return null

func processFrame(delta: float) -> state:
	return null

func processPhysics(delta: float) -> state:
	return null
