#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/walking_d/__generated__/execute/5544
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/walking_d/__generated__/execute/5676
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/walking_d/__generated__/execute/5808
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/walking_d/__generated__/execute/5940
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/walking_d/__generated__/execute/6072
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/walking_d/__generated__/execute/6204
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/walking_d/__generated__/execute/6336
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/walking_d/__generated__/execute/6468
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/walking_d/__generated__/execute/6600
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/walking_d/__generated__/execute/6732
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/walking_d/__generated__/execute/6864
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/walking_d/__generated__/execute/6996
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame