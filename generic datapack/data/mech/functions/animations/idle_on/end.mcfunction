#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.idle_on.loopMode matches 0 run function mech:animations/idle_on/stop
execute if score @s aj.mech.idle_on.loopMode matches 1 run function mech:animations/idle_on/pause
execute if score @s aj.mech.idle_on.loopMode matches 2 run scoreboard players set @s aj.frame 0