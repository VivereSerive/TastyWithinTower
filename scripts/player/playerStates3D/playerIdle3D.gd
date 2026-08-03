### playerIdle3D.gd
## Controls Player Idle
extends playerState3D

## Parameters
@export_group("State Siblings")
@export var playerMove3D: state
@export var playerJump3D: state

## Function Decleratiosn
func enter() -> void:
	pass

func exit() -> void:
	pass

func processInput(event: InputEvent) -> state:
	if pMoveKeys.any(Input.is_action_just_pressed):
		return playerMove3D
	return null

func processFrame(delta: float) -> state:
	return null

func processPhysics(delta: float) -> state:
	return null
