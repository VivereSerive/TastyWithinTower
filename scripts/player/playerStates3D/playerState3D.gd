# playerState3D.gd
class_name playerState3D
extends state

# use this state to reference the player3D instead of the state class

## Parameters
var parent: player3D # Hold reference to the player3D class (parent)
var gravity: int = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed: float = 200.0 
