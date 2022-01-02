#built using mc-build (https://github.com/mc-build/mc-build)

execute if score .this aj.frame matches 0..7 run function mech:animations/feet_smash/__generated__/execute/21222
execute if score .this aj.frame matches 8..15 run function mech:animations/feet_smash/__generated__/execute/21231
execute if score .this aj.frame matches 16 run data modify entity @s Pose.Head set value [-180f,7.016709298534877e-15f,180f]
execute if score .this aj.frame matches 17 run data modify entity @s Pose.Head set value [-180f,7.016709298534877e-15f,180f]