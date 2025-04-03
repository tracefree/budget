class_name ReceiptLine
extends HBoxContainer

@export var amount: float = 0.0:
	set = set_amount

@onready var label: Label = $Label


func set_amount(p_amount: float) -> void:
	if not is_node_ready():
		await ready
	
	amount = p_amount
	label.text = "%s €" % p_amount
