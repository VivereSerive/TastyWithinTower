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
	var pCamBasis = parent.mainCamera3D.global_transform.basis

	# Calculate player movement relative to the global camera
	var pCamRight = pCamBasis.x
	pCamRight.y = 0
	pCamRight = pCamRight.normalized()

	var pCamForward = -pCamBasis.z
	pCamForward.y = 0
	pCamForward = pCamForward.normalized()
	
	var direction = (pCamRight * inputDir.x + pCamForward * inputDir.y).normalized()
	
	# Apply Movement
	if direction:
		parent.velocity.x = direction.x * speed
		parent.velocity.z = direction.z * speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
		parent.velocity.z = move_toward(parent.velocity.z, 0, speed)
	
	return null
