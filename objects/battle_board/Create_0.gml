depth=DEPTH_BATTLE.BOARD;

_surface = -1
_surface1 = -1
_surface2 = -1
_surface3 = -1
_surface4 = -1
sur = -1

x=BATTLE_BOARD.X;
y=BATTLE_BOARD.Y;

up=BATTLE_BOARD.UP;
down=BATTLE_BOARD.DOWN;
left=BATTLE_BOARD.LEFT;
right=BATTLE_BOARD.RIGHT;

angle=0;
color_bg=c_black;
color_frame=c_white;
alpha_frame=1
alpha_bg=1


_point_x=0;
_point_y=0;

_angle=0;
is_polygon = false;
polygon_fraction = 1;
polygon_vertices_start = [];
polygon_vertices_target = [];
polygon_vertices_clean = [];
polygon_needs_clean = false;
should_revert_to_rectangle = false;
global.borderCount = 0
global.borders_list = ds_list_create()
event_user(5);