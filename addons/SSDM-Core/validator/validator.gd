@tool
class_name SSDMValidator
extends RefCounted

const MIN_NAME_LENGTH: int = 3
const MAX_NAME_LENGTH: int = 30
const USE_STRICT_NAMES: bool = true


static func get_base_path(path: String) -> String:
	var extension: String = path.get_extension()
	if extension == "":
		return path
	return path.get_base_dir()
	
	
## Checks a string for node path formatting[br]
## Does not check if the node path exists[br][br]
##
## @param path The path to be checked[br]
## @return true if valid, false if not valid[br]
static func is_valid_node_path(path: String) -> SSDMResult:
	var clean_path: String = path.strip_edges()
	if clean_path.is_empty():
		return SSDMResult.failure("SSDMCore: Node path can not be empty")
	if (clean_path.begins_with("res://") or clean_path.begins_with("user://") or clean_path.begins_with("uid://")):
		return SSDMResult.failure("SSDMCore: Node path can not be a file path")
	if ":" in clean_path:
		return SSDMResult.failure("SSDMCore: Node paths do not contain colons")
	var np = NodePath(clean_path)
	if np.is_empty():
		return SSDMResult.failure("SSDMCore: Node path string could not be converted to NodePath")
	return SSDMResult.success()


## Checks a string for file path formatting[br]
## Does not check if the file path exists[br]
## Does not check file extension[br][br]
##
## @param path The path to be checked[br]
## @return true if valid, false if not valid[br]
static func is_valid_new_path(path: String) -> SSDMResult:
	if path.is_empty():
		return SSDMResult.failure("SSDMCore: New path is empty")
	var clean_path: String = path.strip_edges()
	if clean_path.is_empty():
		return SSDMResult.failure("SSDMCore: Cleaned path is empty")
	if !clean_path.is_absolute_path():
		return SSDMResult.failure("SSDMCore: New path is not an absolute path: " + clean_path)
	if !clean_path.begins_with("res://"):
		return SSDMResult.failure("SSDMCore: New path does not begin with res:// : " + clean_path)
	if clean_path.contains(":") and clean_path.find(":") != 3:
		return SSDMResult.failure("SSDMCore: New path format is not valid: " + clean_path)
	return SSDMResult.success()


## Checks a string for file path formatting[br]
## Checks if the file path exists[br][br]
##
## @param path The path to be checked[br]
## @return true if valid and is exists, false if not valid or does not exist[br]
static func path_exists(path: String) -> SSDMResult:
	if path.is_empty():
		return SSDMResult.failure("SSDMCore: Path is empty")
	var clean_path: String = path.strip_edges()
	var valid_path_result: SSDMResult = is_valid_new_path(clean_path)
	if valid_path_result.error:
		return valid_path_result
	var base_path: String = get_base_path(clean_path)
	var dir_exists: bool = DirAccess.dir_exists_absolute(base_path)
	if !dir_exists:
		return SSDMResult.failure("SSDMCore: Path does not exist: " + base_path)
	return SSDMResult.success()


## Checks the format of a name String[br][br]
##
## @param name The name to be checked[br]
## @return true if valid, false if not valid[br]
static func is_valid_name(name: String) -> SSDMResult:
	var clean_name: String = name.strip_edges()
	var length = clean_name.length()
	if length < MIN_NAME_LENGTH:
		return SSDMResult.failure("SSDMCore: Name must be at least " + str(MIN_NAME_LENGTH) + " characters long")
	if length > MAX_NAME_LENGTH:
		return SSDMResult.failure("SSDMCore: Name must be no more than " + str(MAX_NAME_LENGTH) + " characters long")
	if USE_STRICT_NAMES:
		if !clean_name.is_valid_ascii_identifier():
			return SSDMResult.failure("SSDMCore: Name must be a valid identifier")
	else:
		if !clean_name.is_valid_filename():
			return SSDMResult.failure("SSDMCore: Name must be a valid name")
	return SSDMResult.success()
