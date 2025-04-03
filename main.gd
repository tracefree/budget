extends Control

const RECEIPT_LINE: PackedScene = preload("res://receipt_line.tscn")
const RECEIPTS_PATH = "user://receipts.tres"

@onready var recept_list: VBoxContainer = %ReceptList
@onready var spin_box: SpinBox = $VBoxContainer/HBoxContainer/SpinBox
@onready var total: Label = %Total

var receipts: Receipts


func _ready() -> void:
	get_window().content_scale_factor = 2.0
	if ResourceLoader.exists(RECEIPTS_PATH):
		receipts = load(RECEIPTS_PATH)
		for amount in receipts.receipts:
			add_line(amount)
		return
	
	receipts = Receipts.new()
	receipts.resource_path = RECEIPTS_PATH
	ResourceSaver.save(receipts)


func _on_add_button_pressed() -> void:
	var amount := spin_box.value
	add_line(amount)
	receipts.receipts.push_back(amount)
	ResourceSaver.save(receipts)
	
	spin_box.value = 0


func add_line(p_amount: float) -> void:
	var line: ReceiptLine = RECEIPT_LINE.instantiate()
	line.amount = p_amount
	recept_list.add_child(line)
	total.text = "Total: %s €" % receipts.get_total()
