@tool
extends EditorPlugin
## Driver sementara: memanggil alur import Unidot langsung tanpa dialog.
## Item tree default ter-check semua (select-all), jadi confirmed() = import penuh.

var dlg = null
var phase = 0
var frames = 0
var max_frames = 500000
var unity_dir = ""
var marker = ""

func _enter_tree():
	unity_dir = OS.get_environment("FFI_UNITY_DIR")
	if unity_dir.is_empty():
		unity_dir = "res://unity_assets"
	marker = OS.get_environment("FFI_DONE_MARKER")
	if marker.is_empty():
		marker = OS.get_user_data_dir() + "/../unidot_done.txt"
	print("HEADLESS: driver aktif, unity_dir=" + unity_dir)

func _enter_tree():
	print("HEADLESS: driver aktif")
	var cls = load("res://addons/unidot_importer/package_import_dialog.gd")
	dlg = cls.new()
	dlg.editor_plugin = self
	dlg.file_dialog = null
	dlg._show_importer_common()
	print("HEADLESS: common ok")
	dlg._selected_package(unity_dir)
	print("HEADLESS: package ok")
	phase = 1

func _process(_delta):
	frames += 1
	if phase == 1 and frames > 60:
		dlg._asset_tree_window_confirmed()
		print("HEADLESS: confirmed")
		phase = 2
	elif phase == 2:
		if dlg.import_finished:
			_finish("OK frames=%d" % frames)
		elif frames > max_frames:
			_finish("TIMEOUT")
		elif frames % 3000 == 0:
			print("HEADLESS: tunggu... frame=%d" % frames)

func _finish(msg):
	var f = FileAccess.open(marker, FileAccess.WRITE)
	if f:
		f.store_string(msg)
		f.close()
	print("HEADLESS: " + msg)
	get_tree().quit()
