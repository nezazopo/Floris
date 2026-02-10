extends Node3D
class_name Rastlina

@export var ime: String = "Rastlina"
@export var strupenost = 0
@onready var game_manager = %GameManager
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("rastline")
	$Area3D.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node3D):
	if body is CharacterBody3D:  #ce je igralec vstopil v okolico rastline
		print("Igralec vstopil v okolico " + ime + " st. tock " + game_manager.tocke)
		
		if self == (game_manager.poisciRastlino):
			print("pravilno si našel! " + ime)
			game_manager.pristej()
			game_manager.naslednjaRastlina()
			if(!game_manager.konec):
				print("sedaj poisci " + game_manager.poisciRastlino.ime)
		else:
			if strupenost != 0: #ce je strupena
				game_manager.odstej(strupenost)
			else:
				game_manager.odstej(1);
			if game_manager.tocke < 0:
				print("Player diesss") 
