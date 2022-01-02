#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/idle_on/__generated__/execute/11049
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/idle_on/__generated__/execute/11086
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/idle_on/__generated__/execute/11123
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/idle_on/__generated__/execute/11160
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/idle_on/__generated__/execute/11197
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/idle_on/__generated__/execute/11234
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/idle_on/__generated__/execute/11271
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/idle_on/__generated__/execute/11308
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/idle_on/__generated__/execute/11345
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/idle_on/__generated__/execute/11382
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/idle_on/__generated__/execute/11419
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/idle_on/__generated__/execute/11456
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame