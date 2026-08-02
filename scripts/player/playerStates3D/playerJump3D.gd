### playerJump3D.gd
## Controls Player Jump
extends playerState3D

## Parameters
@export_group("State Siblings")
@export var playerMove3D: state
@export var playerIdle3D: state
@export var playerLand3D: state

## Function Decleratiosn
func enter() -> void:
	parent.velocity.y = jumpPower

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
