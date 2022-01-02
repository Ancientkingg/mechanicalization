#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.land.loopMode matches 0 run function mech:animations/land/stop
execute if score @s aj.mech.land.loopMode matches 1 run function mech:animations/land/pause
execute if score @s aj.mech.land.loopMode matches 2 run scoreboard players set @s aj.frame 0