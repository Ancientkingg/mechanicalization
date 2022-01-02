#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/walking_s/__generated__/execute/8722
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/walking_s/__generated__/execute/8818
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/walking_s/__generated__/execute/8914
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/walking_s/__generated__/execute/9010
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/walking_s/__generated__/execute/9106
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/walking_s/__generated__/execute/9202
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/walking_s/__generated__/execute/9298
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/walking_s/__generated__/execute/9394
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/walking_s/__generated__/execute/9490
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/walking_s/__generated__/execute/9586
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/walking_s/__generated__/execute/9682
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/walking_s/__generated__/execute/9778
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame