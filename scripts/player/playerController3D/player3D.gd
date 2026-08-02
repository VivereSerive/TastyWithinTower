### player3D.gd
class_name player3D
extends CharacterBody3D

## Parameters
var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var stateManager: Node = $stateManager

## Function Declerations
# Initializing stateManager
func _ready() -> void:
	stateManager.init()

# Delegating Logic
func _unhandled_input(event: InputEvent) -> void:
	stateManager.processInput(event)

func _physics_process(delta: float) -> void:
	stateManager.processPhysics(delta)
	
	# Apply Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()

func _process(delta: float) -> void:
	stateManager.processFrame(delta)
