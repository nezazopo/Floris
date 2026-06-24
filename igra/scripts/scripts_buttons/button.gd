extends Button
@onready var panel_opis_rastline: Panel = $"../PanelOpisRastline"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if(!panel_opis_rastline.visible):
		panel_opis_rastline.visible = true
	else:
		panel_opis_rastline.visible = false
	pass # Replace with function body.
