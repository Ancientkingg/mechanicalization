#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/rotate_d/__generated__/execute/15716
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/rotate_d/__generated__/execute/15751
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/rotate_d/__generated__/execute/15786
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/rotate_d/__generated__/execute/15821
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/rotate_d/__generated__/execute/15856
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/rotate_d/__generated__/execute/15891
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/rotate_d/__generated__/execute/15926
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/rotate_d/__generated__/execute/15961
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/rotate_d/__generated__/execute/15996
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/rotate_d/__generated__/execute/16031
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/rotate_d/__generated__/execute/16066
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/rotate_d/__generated__/execute/16101
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame