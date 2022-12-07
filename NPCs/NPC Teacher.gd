extends Area2D

export var npc_name = "npc-name"
export var npc_texture = "npc-name"
export var npc_frame = 18
var active = false

onready var node = preload("res://World/SubjectMedal.tscn")

var npc = null setget set_npc

onready var sprite = $Sprite

func _ready():
	connect("body_entered", self, '_on_NPC_Teacher_body_entered')
	connect("body_exited", self, '_on_NPC_Teacher_body_exited')
	sprite.texture = load(npc_texture)
	sprite.frame = npc_frame

func _process(delta):
	$KeySprite.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
#			get_tree().paused = true
			var dialog = Dialogic.start(npc_name + str('-timeline'))
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self, 'unpause')
			dialog.connect('dialogic_signal', self, 'dialogic_signal')
			add_child(dialog)

func unpause(_timeline_name):
	get_tree().paused = false


func set_npc(new_npc):
	if new_npc != null:
		$Key.show()
		$KeyPrompt.play("KeyPrompt")
	else:
		$Key.hide()
		$KeyPrompt.stop()
	npc = new_npc


func dialogic_signal(argument):
	var nodeInstance = node.instance()
	if argument == '_passsubject1':
		nodeInstance.position = Vector2(80, -100)
		get_tree().get_root().add_child(nodeInstance)
	if argument == '_passsubject2':
		pass
	if argument == '_passsubject3':
		pass
	if argument == '_passsubject4':
		pass
	if argument == '_passsubject5':
		pass


func _on_NPC_Student_body_entered(body):
	if body.name == 'Player':
		active = true


func _on_NPC_Student_body_exited(body):
	if body.name == 'Player':
		active = false
