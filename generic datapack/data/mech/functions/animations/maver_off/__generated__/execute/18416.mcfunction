#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/maver_off/__generated__/execute/18417
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/maver_off/__generated__/execute/18445
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/maver_off/__generated__/execute/18473
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/maver_off/__generated__/execute/18501
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/maver_off/__generated__/execute/18529
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/maver_off/__generated__/execute/18557
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/maver_off/__generated__/execute/18585
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/maver_off/__generated__/execute/18613
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/maver_off/__generated__/execute/18641
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/maver_off/__generated__/execute/18669
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/maver_off/__generated__/execute/18697
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/maver_off/__generated__/execute/18725
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame