extends Area2D

export var npc_name = "npc-name"
var active = false

var npc = null setget set_npc

func _ready():
	connect("body_entered", self, '_on_NPC_Student_body_entered')
	connect("body_exited", self, '_on_NPC_Student_body_exited')

func _process(delta):
	$KeySprite.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
#			get_tree().paused = true
			var dialog = Dialogic.start(npc_name + str('-timeline'))
#			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self, 'unpause')
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


func _on_NPC_Student_body_entered(body):
	if body.name == 'Player':
		active = true


func _on_NPC_Student_body_exited(body):
	if body.name == 'Player':
		active = false
