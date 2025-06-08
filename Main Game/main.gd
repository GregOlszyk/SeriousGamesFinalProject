extends Node2D

@onready var recycle_label = $"Recycle Label"
@onready var trash_label = $"Trash Label"

func _process(delta):
	recycle_label.text = str("Recycle Score: ", Global.recycle_score)
	trash_label.text = str("Trash Score: ", Global.trash_score)
