#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/off/__generated__/execute/12845
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/off/__generated__/execute/12860
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/off/__generated__/execute/12875
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/off/__generated__/execute/12890
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/off/__generated__/execute/12905
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/off/__generated__/execute/12920
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/off/__generated__/execute/12935
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/off/__generated__/execute/12950
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/off/__generated__/execute/12965
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/off/__generated__/execute/12980
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/off/__generated__/execute/12995
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/off/__generated__/execute/13010
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame