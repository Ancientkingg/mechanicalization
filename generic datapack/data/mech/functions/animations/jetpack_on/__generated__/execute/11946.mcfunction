#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/jetpack_on/__generated__/execute/11947
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/jetpack_on/__generated__/execute/11984
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/jetpack_on/__generated__/execute/12021
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/jetpack_on/__generated__/execute/12058
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/jetpack_on/__generated__/execute/12095
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/jetpack_on/__generated__/execute/12132
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/jetpack_on/__generated__/execute/12169
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/jetpack_on/__generated__/execute/12206
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/jetpack_on/__generated__/execute/12243
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/jetpack_on/__generated__/execute/12280
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/jetpack_on/__generated__/execute/12317
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/jetpack_on/__generated__/execute/12354
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame