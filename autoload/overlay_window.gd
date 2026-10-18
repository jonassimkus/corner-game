extends Node

const MARGIN := Vector2i(16, 16)

func _ready() -> void:
	var win := get_window()
	win.borderless = true
	win.always_on_top = true
	win.transparent = true
	get_viewport().transparent_bg = true

	win.size_changed.connect(_snap_bottom_right)
	await get_tree().process_frame
	_snap_bottom_right()


func _snap_bottom_right() -> void:
	var win := get_window()
	var screen := win.current_screen
	var usable := DisplayServer.screen_get_usable_rect(screen)
	win.position = usable.position + usable.size - win.size - MARGIN
