### playerIdle3D.gd
## Controls Player Idle
extends playerState3D

## Parameters
@export_group("State Siblings")
@export var playerMove3D: state
@export var playerJump3D: state
@export var playerIdle3D: state
@export var playerLand3D: state

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
