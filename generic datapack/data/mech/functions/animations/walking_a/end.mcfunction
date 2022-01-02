#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.walking_a.loopMode matches 0 run function mech:animations/walking_a/stop
execute if score @s aj.mech.walking_a.loopMode matches 1 run function mech:animations/walking_a/pause
execute if score @s aj.mech.walking_a.loopMode matches 2 run scoreboard players set @s aj.frame 0