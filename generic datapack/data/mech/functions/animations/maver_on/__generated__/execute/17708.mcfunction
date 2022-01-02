#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/maver_on/__generated__/execute/17709
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/maver_on/__generated__/execute/17738
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/maver_on/__generated__/execute/17767
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/maver_on/__generated__/execute/17796
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/maver_on/__generated__/execute/17825
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/maver_on/__generated__/execute/17854
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/maver_on/__generated__/execute/17883
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/maver_on/__generated__/execute/17912
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/maver_on/__generated__/execute/17941
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/maver_on/__generated__/execute/17970
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/maver_on/__generated__/execute/17999
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/maver_on/__generated__/execute/18028
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame