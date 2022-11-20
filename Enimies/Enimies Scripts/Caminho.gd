extends Path2D

onready var path: PathFollow2D = get_node("PathFollow2D")
onready var laser: Node2D = get_node("PathFollow2D/Laser")

export(int) var speed

var step: float = 0.0

func _process(delta: float) -> void:
	if laser.can_interact:
		step += delta
		path.offset = step * speed * laser.direction
