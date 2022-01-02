#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/rotate_a/__generated__/execute/14861
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/rotate_a/__generated__/execute/14896
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/rotate_a/__generated__/execute/14931
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/rotate_a/__generated__/execute/14966
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/rotate_a/__generated__/execute/15001
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/rotate_a/__generated__/execute/15036
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/rotate_a/__generated__/execute/15071
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/rotate_a/__generated__/execute/15106
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/rotate_a/__generated__/execute/15141
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/rotate_a/__generated__/execute/15176
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/rotate_a/__generated__/execute/15211
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/rotate_a/__generated__/execute/15246
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame