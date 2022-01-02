#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.walking_animation.loopMode matches 0 run function mech:animations/walking_animation/stop
execute if score @s aj.mech.walking_animation.loopMode matches 1 run function mech:animations/walking_animation/pause
execute if score @s aj.mech.walking_animation.loopMode matches 2 run scoreboard players set @s aj.frame 0