extends Node

const SAVE_PATH = "user://settings.cfg"
var _config = ConfigFile.new()

var master_volume: float = 1.0
var fullscreen: bool = false


func _ready() -> void:
	load_settings()

func set_master_volume(value: float) -> void:
	master_volume = clamp(value, 0, 1)
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Master"), 
		linear_to_db(master_volume)
	)

func set_fullscreen(enabled: bool) -> void:
	fullscreen = enabled
	if enabled:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Save settings to disk using ConfigFile
func save_settings() -> void:
	_config.set_value("audio", "master_volume", master_volume)
	_config.set_value("video", "fullscreen", fullscreen)
	_config.save(SAVE_PATH)

func load_settings() -> void:
	var error = _config.load(SAVE_PATH)
	if error != OK:
		# DEFAULT SETTINGS
		set_master_volume(master_volume)
		set_fullscreen(fullscreen)
		return
		
	var saved_volume = _config.get_value("audio", "master_volume", 1.0)
	var saved_fullscreen = _config.get_value("video", "fullscreen", false)
	
	set_master_volume(saved_volume)
	set_fullscreen(saved_fullscreen)
