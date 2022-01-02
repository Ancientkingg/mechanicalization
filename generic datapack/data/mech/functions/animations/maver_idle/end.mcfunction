#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.maver_idle.loopMode matches 0 run function mech:animations/maver_idle/stop
execute if score @s aj.mech.maver_idle.loopMode matches 1 run function mech:animations/maver_idle/pause
execute if score @s aj.mech.maver_idle.loopMode matches 2 run scoreboard players set @s aj.frame 0