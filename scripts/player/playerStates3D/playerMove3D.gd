### playerMove3D.gd
## Controls Player Movement
extends playerState3D

## Parameters
@export_group("State Siblings")
@export var playerJump3D: state
@export var playerIdle3D: state

## Function Decleratiosn
func enter() -> void:
	pass

func exit() -> void:
	pass

func processInput(event: InputEvent) -> state:
	if Input.is_action_just_pressed("jump"):
		return playerJump3D
	return null

func processFrame(delta: float) -> state:
	return null

func processPhysics(delta: float) -> state:
	var inputDir := Input.get_vector("mLeft", "mRight", "mUp", "mDown")
	var direction := (parent.transform.basis * Vector3(inputDir.x, 0, inputDir.y)).normalized()
	
	if direction:
		parent.velocity.x = direction.x * speed
		parent.velocity.z = direction.z * speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
		parent.velocity.z = move_toward(parent.velocity.z, 0, speed)
	
	return null
