extends Node3D
class_name Rastlina

@export var ime: String
@export_range(0,2) var strupenost = 0
@export var video: VideoStream = null
@export var opisi: Array[String]
@export var slike: Array[Texture2D]
 
var isPlayerInside = null
@onready var aspect_ratio_container: AspectRatioContainer = $"../Control/PanelIzberiDN/AspectRatioContainer"
@onready var game_manager: Node = $"../GameManager"
@onready var panel_izberi_dn: Panel = $"../Control/PanelIzberiDN"
@onready var video_stream_player: VideoStreamPlayer = $"../Control/PanelIzberiDN/AspectRatioContainer/VideoStreamPlayer"
@onready var panel_e: Panel = $"../Control/PanelE"
@onready var panel_rez: Panel = $"../Control/PanelRez"
@onready var label_rez: Label = $"../Control/PanelRez/LabelRez"
@onready var timer_rez: Timer = $"../Control/PanelRez/TimerRez"



var inv_celica = null

const InvCelica = preload("uid://c7toowx5upyjc")

func _ready():
	add_to_group("rastline")
	
	var nova_celica = InvCelica.instantiate()
	nova_celica.ime = name
	nova_celica.ikona = video
	self.inv_celica = nova_celica	
	var inv = get_parent().get_node("Control/PanelInv/GridContainerInv")
	inv.add_child(nova_celica)
	

	panel_e.visible = false
	panel_rez.visible = false
	#pripravim video
	if(aspect_ratio_container != null):
		aspect_ratio_container.visible = false
	#pripravim panel za izbiro
	if(panel_izberi_dn != null):
		panel_izberi_dn.visible = false;
		
	add_to_group("rastline") #rastlino dodam v "rastline", array, definiran v gamemanager
	$Area3D.body_entered.connect(_on_body_entered)
	$Area3D.body_exited.connect(_on_body_exited)

	
func _on_body_entered(body: Node3D):
	if body is CharacterBody3D:  #ce je igralec vstopil v okolico rastline
		isPlayerInside = true
		panel_e.visible = true
		game_manager.trenutnaRastlina = self
		
func _on_body_exited(body: Node3D):
	if body is CharacterBody3D:
		isPlayerInside = false
		panel_e.visible = false
		game_manager.trenutnaRastlina = null;
			
func prikazi_dn():
	panel_e.visible = false
	video_stream_player.stream = self.video
	video_stream_player.play()
	aspect_ratio_container.visible = true #video
	panel_izberi_dn.visible = true;	#panel da/ne

		
	var odgovor = await panel_izberi_dn.odgovor_izbran
		
	panel_izberi_dn.visible = false
	aspect_ratio_container.visible = false
	
	# TP: PRAVILEN ODGOVOR
	if(self == game_manager.poisciRastlino && odgovor == "da"):
		label_rez.text = "Pravilno!"
		print("pravilno si našel " + ime +"!")
		game_manager.pristej()
		print("st tock: ", game_manager.tocke)
		game_manager.naslednjaRastlina()
		if(!game_manager.konec):
			print("sedaj poisci " + game_manager.poisciRastlino.ime)
		odgovor = null
	
	#TF: PRAVILEN ODG
	if(self != game_manager.poisciRastlino &&  odgovor == "ne"):
		label_rez.text = "Res je!"
		print("Res je, to ni " + game_manager.poisciRastlino.ime +"!")
		odgovor = null
	
	#FN: NAPAČEN: iskana rastlina, odg NE
	if(self == game_manager.poisciRastlino &&  odgovor == "ne"):
		label_rez.text = "Narobe!"
		print("napačen odgovor! -1 točka")
		game_manager.odstej(1)
		odgovor = null
	
	#FP: NAPAČEN: napačna rastlina odg DA
	if(self != game_manager.poisciRastlino && odgovor == "da"):
		label_rez.text = "Narobe!"
		print("napačen odgovor! -", game_manager.tocke, "točke")
		if strupenost == 2: #ce je smrtonosna
			game_manager.umre()
		else:
			game_manager.odstej(1 + strupenost);
		if game_manager.tocke <= 0:
			print("Ni ti uspelo :(")
		odgovor = null	
		
	panel_rez.visible = true
	timer_rez.start()
	await timer_rez.timeout
	panel_rez.visible = false
