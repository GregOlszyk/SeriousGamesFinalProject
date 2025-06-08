extends Control

@onready var result_label = $Label2

func _ready():
	result_label.text = str("You collected ", Global.trash_score, " pieces of trash and ", Global.recycle_score, " recyclables")
