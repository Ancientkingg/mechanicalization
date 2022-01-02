#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/on/__generated__/execute/13998
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/on/__generated__/execute/14020
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/on/__generated__/execute/14042
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/on/__generated__/execute/14064
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/on/__generated__/execute/14086
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/on/__generated__/execute/14108
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/on/__generated__/execute/14130
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/on/__generated__/execute/14152
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/on/__generated__/execute/14174
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/on/__generated__/execute/14196
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/on/__generated__/execute/14218
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/on/__generated__/execute/14240
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame