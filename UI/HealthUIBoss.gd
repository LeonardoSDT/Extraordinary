extends Control

var hearts = 15 setget set_hearts
var max_hearts = 15 setget set_max_hearts

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty
onready var bossStats = $BossStats

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 15

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 15

func _ready():
	self.max_hearts = bossStats.max_health
	self.hearts = bossStats.health
	bossStats.connect("health_changed", self, "set_hearts")
	bossStats.connect("max_health_changed", self, "set_max_hearts")
