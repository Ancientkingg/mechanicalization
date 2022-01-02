#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/walking_animation/__generated__/execute/39
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/walking_animation/__generated__/execute/135
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/walking_animation/__generated__/execute/231
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/walking_animation/__generated__/execute/327
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/walking_animation/__generated__/execute/423
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/walking_animation/__generated__/execute/519
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/walking_animation/__generated__/execute/615
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/walking_animation/__generated__/execute/711
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/walking_animation/__generated__/execute/807
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/walking_animation/__generated__/execute/903
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/walking_animation/__generated__/execute/999
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/walking_animation/__generated__/execute/1095
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame