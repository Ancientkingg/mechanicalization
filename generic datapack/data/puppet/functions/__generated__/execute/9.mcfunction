#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.puppet.anim.animation.model.walk] at @s run function puppet:animations/animation.model.walk/next_frame
scoreboard players operation @s aj.puppet.animating = .aj.animation aj.puppet.animating