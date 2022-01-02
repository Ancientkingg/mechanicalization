#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.maver_idle_boost.loopMode matches 0 run function mech:animations/maver_idle_boost/stop
execute if score @s aj.mech.maver_idle_boost.loopMode matches 1 run function mech:animations/maver_idle_boost/pause
execute if score @s aj.mech.maver_idle_boost.loopMode matches 2 run scoreboard players set @s aj.frame 0