extends Resource
class_name Vprasanje

@export var besedilo: String
@export var odgovori: Array[Odgovor]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	odgovori[0].tipka = KEY_A
	odgovori[1].tipka = KEY_B
	odgovori[2].tipka = KEY_C
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
