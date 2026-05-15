extends Panel

@export var ime = ""
@onready var slika: TextureRect = $Slika


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slika.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
