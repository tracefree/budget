class_name Receipts
extends Resource

@export var receipts: Array[float]


func get_total() -> float:
	var total := 0.0
	for amount in receipts:
		total += amount
	
	return total
