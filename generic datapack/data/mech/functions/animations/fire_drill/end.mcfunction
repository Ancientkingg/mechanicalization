#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.fire_drill.loopMode matches 0 run function mech:animations/fire_drill/stop
execute if score @s aj.mech.fire_drill.loopMode matches 1 run function mech:animations/fire_drill/pause
execute if score @s aj.mech.fire_drill.loopMode matches 2 run scoreboard players set @s aj.frame 0