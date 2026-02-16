extends Panel
@onready var panel_death_text: Label = $PanelDeathText
@onready var restart_button: Button = $RestartButton

func _ready() -> void:
	self.visible = false

func prikaziPanel(razlog):
	self.visible = true
	if(panel_death_text != null):
		panel_death_text.text = razlog

func _on_restart_button_pressed() -> void:
	get_tree().call_deferred("reload_current_scene")	
