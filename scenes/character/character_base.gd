extends CharacterBody2D
class_name CharacterBase

# 角色类的基础父类，player和npc都继承他

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var move_speed: float = 100.0
var facing: StringName = &"down"
