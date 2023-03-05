extends CanvasLayer

func _ready():
	if Global.mobile_controls == true:
		$".".visible = true
	else:
		$".".visible = false

func _process(delta):
	if Global.mobile_controls == true:
		$".".visible = true
	else:
		$".".visible = false
