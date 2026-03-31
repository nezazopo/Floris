@abstract
extends Node3D
class_name Rastlina

@export var ime: String = "Rastlina"
@export_range(0,2) var strupenost = 0 #0, 1, 2
@export var video: VideoStream = null

@onready var aspect_ratio_container: AspectRatioContainer = %AspectRatioContainer
@onready var game_manager = %GameManager
@onready var panel_izberi_dn: Panel = %PanelIzberiDN
@onready var video_stream_player: VideoStreamPlayer = %AspectRatioContainer/VideoStreamPlayer

func _ready():
	#pripravim video
	if(aspect_ratio_container != null):
		aspect_ratio_container.visible = false
	#pripravim panel za izbiro
	if(panel_izberi_dn != null):
		panel_izberi_dn.visible = false;
		
	add_to_group("rastline") #rastlino dodam v "rastline", array, definiran v gamemanager
	$Area3D.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node3D):
	if body is CharacterBody3D:  #ce je igralec vstopil v okolico rastline
		#pritisni enter da si ogledaš rastlino
		video_stream_player.stream = self.video
		aspect_ratio_container.visible = true #video
		panel_izberi_dn.visible = true;	#panel da/ne
		
		var odgovor = await panel_izberi_dn.odgovor_izbran
		
		panel_izberi_dn.visible = false
		aspect_ratio_container.visible = false
		#PRAVILEN ODGOVOR
		if(self == game_manager.poisciRastlino && odgovor == "da"):
			print("pravilno si našel " + ime +"!")
			game_manager.pristej()
			print("st tock: ", game_manager.tocke)
			game_manager.naslednjaRastlina()
			if(!game_manager.konec):
				print("sedaj poisci " + game_manager.poisciRastlino.ime)
		
		if(self != game_manager.poisciRastlino &&  odgovor == "ne"):
			print("Res je, to ni " + ime +"!")
		
		#NAPAČEN: iskana rastlina, odg NE
		if(self == game_manager.poisciRastlino &&  odgovor == "ne"):
			print("napačen odgovor! -1 točka")
		#NAPAČEN: napačna rastlina odg DA
		if(self != game_manager.poisciRastlino && odgovor == "da"):
			print("napačen odgovor! -", game_manager.tocke, "točke")
			if strupenost == 2: #ce je smrtonosna
				game_manager.umre()
			else:
				game_manager.odstej(1 + strupenost);
			if game_manager.tocke <= 0:
				print("Ni ti uspelo :(")
		panel_izberi_dn.visible = false
		aspect_ratio_container.visible = false
			
		#if self == (game_manager.poisciRastlino):
		#	print("pravilno si našel " + ime +"!")
		#	game_manager.pristej()
		#	print("st tock: ", game_manager.tocke)
		#	game_manager.naslednjaRastlina()
		#	if(!game_manager.konec):
		#		print("sedaj poisci " + game_manager.poisciRastlino.ime)
		#else:
		#	if strupenost == 2: #ce je smrtonosna
		#		game_manager.umre()
		#	else:
		#		game_manager.odstej(1 + strupenost);
		#	if game_manager.tocke < 0:
		#		print("Ni ti uspelo :(") 

func _process(delta: float) -> void:
	pass
