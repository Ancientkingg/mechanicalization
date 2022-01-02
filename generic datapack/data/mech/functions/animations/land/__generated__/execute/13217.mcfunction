#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/land/__generated__/execute/13218
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/land/__generated__/execute/13250
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/land/__generated__/execute/13282
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/land/__generated__/execute/13314
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/land/__generated__/execute/13346
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/land/__generated__/execute/13378
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/land/__generated__/execute/13410
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/land/__generated__/execute/13442
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/land/__generated__/execute/13474
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/land/__generated__/execute/13506
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/land/__generated__/execute/13538
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/land/__generated__/execute/13570
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame