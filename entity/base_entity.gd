class_name base_entity

@export var health:float = 100.0
@export var max_health:float = 100.0
@export var pack_chance:float = 20.0
@export var pack_pool:String = "grass"
@export var hit_damage:float = 10
@export var hit_rate:float = 0.5

signal died

func on_death() -> void:
	pass

func damage(amount: float) -> float:
	health -= amount
	if health < 0:
		health = 0
		on_death()
		died.emit()
		
	return health
