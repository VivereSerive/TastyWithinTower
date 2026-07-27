### player3D.gd
class_name player3D
extends CharacterBody3D

## Parameters
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

func _process(delta: float) -> void:
	stateManager.processFrame(delta)
