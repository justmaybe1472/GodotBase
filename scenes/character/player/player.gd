extends CharacterBase
class_name Player

# 玩家角色，继承自 角色基类

func _physics_process(delta: float) -> void:
	Player_move()


# 玩家移动
func Player_move() -> void:
	var now_input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = now_input_direction * move_speed
	move_and_slide()
	
	var now_anim_state: String = "idle"
	
	if now_input_direction != Vector2.ZERO:
		facing = calcu_facing(now_input_direction)
		now_anim_state = "walk"
	else:
		now_anim_state = "idle"
	
	var now_animation_name := StringName("%s_%s" % [now_anim_state, facing])
	if animated_sprite_2d.animation != now_animation_name:
		animated_sprite_2d.play(now_animation_name)

# 计算朝向，将输入向量转为“上下左右”字符串
func calcu_facing(dir: Vector2) -> StringName:
	if abs(dir.x) >= abs(dir.y):
		return &"right" if dir.x > 0.0 else &"left"
	return &"down" if dir.y > 0.0 else &"up"
