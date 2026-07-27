### stateManger.gd
extends Node

## Parameters
@export_group("State Parameters")
@export var initialState: state
@export var currentState: state

## Function Declerations
func init():
	var parent = get_parent() # Grabs Parent
	
	# Delegates stateManagers parent to its children
	for child in get_children():
		child.parent = parent
		
	## Init to initial state 
	changeState(initialState)

func changeState(newState: state) -> void:
	# Call any exit logic
	if currentState:
		currentState.exit()
	# Changing to new state
	currentState = newState
	currentState.enter()

# Handles state changes as needed
func processPhysics(delta: float) -> void:
	var newState = currentState.processPhysics(delta)
	if newState:
		changeState(newState)

func processInput(event: InputEvent) -> void:
	var newState = currentState.processInput(event)
	if newState:
		changeState(newState)

func processFrame(delta: float) -> void:
	var newState = currentState.processFrame(delta)
	if newState:
		changeState(newState)
