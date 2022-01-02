#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/walking_a/__generated__/execute/2366
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/walking_a/__generated__/execute/2498
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/walking_a/__generated__/execute/2630
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/walking_a/__generated__/execute/2762
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/walking_a/__generated__/execute/2894
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/walking_a/__generated__/execute/3026
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/walking_a/__generated__/execute/3158
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/walking_a/__generated__/execute/3290
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/walking_a/__generated__/execute/3422
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/walking_a/__generated__/execute/3554
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/walking_a/__generated__/execute/3686
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/walking_a/__generated__/execute/3818
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame