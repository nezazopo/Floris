extends Node3D
@export var ime: String = "Rastlina"
@export var strupenost = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area3D.body_entered.connect(_on_body_entered)
	
	
func _on_body_entered(body: Node3D):
	if body.is_class("Player"):  # Assuming your player is in a "Player" group
		print("Player collided with " + ime)
