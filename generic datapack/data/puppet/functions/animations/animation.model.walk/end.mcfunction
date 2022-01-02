#built using mc-build (https://github.com/mc-build/mc-build)

execute if score @s aj.puppet.animation.model.walk.loopMode matches 0 run function puppet:animations/animation.model.walk/stop
execute if score @s aj.puppet.animation.model.walk.loopMode matches 1 run function puppet:animations/animation.model.walk/pause
execute if score @s aj.puppet.animation.model.walk.loopMode matches 2 run scoreboard players set @s aj.frame 0