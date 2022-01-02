#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/maver_idle/__generated__/execute/19664
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/maver_idle/__generated__/execute/19710
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/maver_idle/__generated__/execute/19756
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/maver_idle/__generated__/execute/19802
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/maver_idle/__generated__/execute/19848
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/maver_idle/__generated__/execute/19894
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/maver_idle/__generated__/execute/19940
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/maver_idle/__generated__/execute/19986
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/maver_idle/__generated__/execute/20032
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/maver_idle/__generated__/execute/20078
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/maver_idle/__generated__/execute/20124
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/maver_idle/__generated__/execute/20170
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame