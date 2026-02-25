class_name SSDMGlobal
extends RefCounted

enum Axis 
{
	VERTICAL,    ## Size animation expands/contracts vertically (top to bottom). Panel slides down when opening, up when closing.
	HORIZONTAL   ## Size animation expands/contracts horizontally (left to right). Panel slides right when opening, left when closing.
}


enum OpenDirection 
{
	POSITIVE,    ## Slide in the positive direction. For VERTICAL = downward, for HORIZONTAL = rightward.
	NEGATIVE     ## Slide in the negative direction. For VERTICAL = upward, for HORIZONTAL = leftward.
}


enum RotationPivot 
{
	TOP_LEFT,        ## Rotation/scale pivot at top-left corner of panel. Panel spins around this point.
	TOP_CENTER,      ## Rotation/scale pivot at top-center edge of panel. Creates a pendulum effect when rotating.
	TOP_RIGHT,       ## Rotation/scale pivot at top-right corner of panel. Panel spins around this point.
	CENTER_LEFT,     ## Rotation/scale pivot at center-left edge of panel. Panel rotates around its left side.
	CENTER,          ## Rotation/scale pivot at exact center of panel. Most common for spinning in place.
	CENTER_RIGHT,    ## Rotation/scale pivot at center-right edge of panel. Panel rotates around its right side.
	BOTTOM_LEFT,     ## Rotation/scale pivot at bottom-left corner of panel. Good for "falling leaf" effects.
	BOTTOM_CENTER,   ## Rotation/scale pivot at bottom-center edge of panel. Panel swings from this point.
	BOTTOM_RIGHT,    ## Rotation/scale pivot at bottom-right corner of panel. Good for corner spin effects.
}


enum Alignment 
{
	Left,     ## Align message text to the left edge of the panel
	Center,   ## Center message text within the panel (default, most common)
	Right,    ## Align message text to the right edge of the panel
	Justify   ## Stretch text to fill the width of the panel
}


enum CloseBehavior {
	REVERSE_FIRST_ANIMATION,  ## Play only the first animation from entrance_animation_chain in reverse when closing. Quick and clean.
	MIRROR_FULL_CHAIN,        ## Play all animations from entrance_animation_chain in reverse order when closing. Symmetrical open/close.
	NO_ANIMATION              ## Panel disappears instantly without any closing animation. Use for urgent dismissals.
}


enum PositionPreset {
	TOP_LEFT,        ## Position the panel container at the top-left corner. Panels stack downward from this point.
	TOP_CENTER,      ## Position the panel container at the top-center. Panels stack downward from this point.
	TOP_RIGHT,       ## Position the panel container at the top-right corner. Panels stack downward from this point.
	CENTER_LEFT,     ## Position the panel container at the center-left edge. Container centers vertically at this position.
	CENTER,          ## Position the panel container at the exact screen center. Container centers both horizontally and vertically.
	CENTER_RIGHT,    ## Position the panel container at the center-right edge. Container centers vertically at this position.
	BOTTOM_LEFT,     ## Position the panel container at the bottom-left corner. Panels stack upward from this point.
	BOTTOM_CENTER,   ## Position the panel container at the bottom-center. Panels stack upward from this point.
	BOTTOM_RIGHT     ## Position the panel container at the bottom-right corner. Panels stack upward from this point.
}


enum ClipMode {
	AUTO,    ## Clips for slide/position animations, not for rotation (default behavior)
	ALWAYS,  ## Always clip content to bounds during animation
	NEVER    ## Allow content to draw outside bounds (useful for rotation effects)
}


const PANEL_THEME: String = "panel"
const BG_COLOR: String = "bg_color"
const MARGIN_LEFT: String = "margin_left"
const MARGIN_TOP: String = "margin_top"
const MARGIN_RIGHT: String = "margin_right"
const MARGIN_BOTTOM: String = "margin_bottom"
const SIZE: String = "size"
const NORMAL_FONT: String = "normal_font"
const DEFAULT_COLOR: String = "default_color"
const NORMAL_FONT_SIZE: String = "normal_font_size"
