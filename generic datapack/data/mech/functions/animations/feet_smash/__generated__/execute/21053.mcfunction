#built using mc-build (https://github.com/mc-build/mc-build)

execute if score .this aj.frame matches 0..7 run function mech:animations/feet_smash/__generated__/execute/21054
execute if score .this aj.frame matches 8..15 run function mech:animations/feet_smash/__generated__/execute/21063
execute if score .this aj.frame matches 16 run data modify entity @s Pose.Head set value [133.33333333333334f,7.0167092985348775e-15f,180f]
execute if score .this aj.frame matches 17 run data modify entity @s Pose.Head set value [141.66666666666669f,7.016709298534877e-15f,180f]