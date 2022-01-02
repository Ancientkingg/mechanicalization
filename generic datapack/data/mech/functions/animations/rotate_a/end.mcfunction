#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.rotate_a.loopMode matches 0 run function mech:animations/rotate_a/stop
execute if score @s aj.mech.rotate_a.loopMode matches 1 run function mech:animations/rotate_a/pause
execute if score @s aj.mech.rotate_a.loopMode matches 2 run scoreboard players set @s aj.frame 0