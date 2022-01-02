#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.bone.left_leg] run function mech:animations/idle_off/__generated__/execute/14539
execute if entity @s[tag=aj.mech.bone.left_knee] run function mech:animations/idle_off/__generated__/execute/14552
execute if entity @s[tag=aj.mech.bone.left_foot] run function mech:animations/idle_off/__generated__/execute/14565
execute if entity @s[tag=aj.mech.bone.right_leg] run function mech:animations/idle_off/__generated__/execute/14578
execute if entity @s[tag=aj.mech.bone.right_knee] run function mech:animations/idle_off/__generated__/execute/14591
execute if entity @s[tag=aj.mech.bone.right_foot] run function mech:animations/idle_off/__generated__/execute/14604
execute if entity @s[tag=aj.mech.bone.body] run function mech:animations/idle_off/__generated__/execute/14617
execute if entity @s[tag=aj.mech.bone.seat] run function mech:animations/idle_off/__generated__/execute/14630
execute if entity @s[tag=aj.mech.bone.left_arm] run function mech:animations/idle_off/__generated__/execute/14643
execute if entity @s[tag=aj.mech.bone.drill] run function mech:animations/idle_off/__generated__/execute/14656
execute if entity @s[tag=aj.mech.bone.right_arm] run function mech:animations/idle_off/__generated__/execute/14669
execute if entity @s[tag=aj.mech.bone.jetpack] run function mech:animations/idle_off/__generated__/execute/14682
execute store result entity @s Air short 1 run scoreboard players get .this aj.frame