extends Timer

func level_changed():
	if wait_time>0.5:
		set_wait_time(wait_time-0.05)

func snowball_spirit_level_changed():
	if wait_time>3:
		set_wait_time(wait_time-0.3)
	pass
