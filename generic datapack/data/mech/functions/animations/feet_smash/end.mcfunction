#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.mech.feet_smash.loopMode matches 0 run function mech:animations/feet_smash/stop
execute if score @s aj.mech.feet_smash.loopMode matches 1 run function mech:animations/feet_smash/pause
execute if score @s aj.mech.feet_smash.loopMode matches 2 run scoreboard players set @s aj.frame 0