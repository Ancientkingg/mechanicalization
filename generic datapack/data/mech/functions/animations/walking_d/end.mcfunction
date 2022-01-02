#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.walking_d.loopMode matches 0 run function mech:animations/walking_d/stop
execute if score @s aj.mech.walking_d.loopMode matches 1 run function mech:animations/walking_d/pause
execute if score @s aj.mech.walking_d.loopMode matches 2 run scoreboard players set @s aj.frame 0