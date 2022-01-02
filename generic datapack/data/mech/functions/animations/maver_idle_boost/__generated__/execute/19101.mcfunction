#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/maver_idle_boost/__generated__/execute/19102
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/maver_idle_boost/__generated__/execute/19125
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/maver_idle_boost/__generated__/execute/19148
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/maver_idle_boost/__generated__/execute/19171
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/maver_idle_boost/__generated__/execute/19194
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/maver_idle_boost/__generated__/execute/19217
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/maver_idle_boost/__generated__/execute/19240
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/maver_idle_boost/__generated__/execute/19263
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/maver_idle_boost/__generated__/execute/19286
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/maver_idle_boost/__generated__/execute/19309
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/maver_idle_boost/__generated__/execute/19332
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/maver_idle_boost/__generated__/execute/19355
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame