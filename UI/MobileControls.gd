extends CanvasLayer

func _ready():
	if Global.mobile_controls == true:
		$".".visible = true
	else:
		$".".visible = false
