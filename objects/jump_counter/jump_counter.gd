extends Label

var num_jumps = 0

func _ready():
	self.text = prepare_text()
	pass

func prepare_text():
	return "JUMPS = %d" % self.num_jumps

func on_player_jumped():
	self.num_jumps += 1
	self.text = prepare_text()
