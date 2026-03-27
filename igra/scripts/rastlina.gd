@abstract
extends Node3D
class_name Rastlina

@export var ime: String = "Rastlina"
@export_range(0,2) var strupenost = 0 #0, 1, 2

@onready var aspect_ratio_container: AspectRatioContainer = %AspectRatioContainer
@onready var game_manager = %GameManager
# Called when the node enters the scene tree for the first time.

func _ready():
	if(aspect_ratio_container != null):
		aspect_ratio_container.visible = false
	add_to_group("rastline")
	$Area3D.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node3D):

	if body is CharacterBody3D:  #ce je igralec vstopil v okolico rastline
		aspect_ratio_container.visible = true
		#listener
		if self == (game_manager.poisciRastlino):
			print("pravilno si našel " + ime +"!")
			game_manager.pristej()
			print("st tock: ", game_manager.tocke)
			game_manager.naslednjaRastlina()
			if(!game_manager.konec):
				print("sedaj poisci " + game_manager.poisciRastlino.ime)
		else:
			if strupenost == 2: #ce je smrtonosna
				game_manager.umre()
			else:
				game_manager.odstej(1 + strupenost);
			if game_manager.tocke < 0:
				print("Ni ti uspelo :(") 

func vrniSliko():
	pass
