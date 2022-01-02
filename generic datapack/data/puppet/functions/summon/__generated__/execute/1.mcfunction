#built using mc-build (https://github.com/mc-build/mc-build)

tp @s ~ ~ ~ ~ ~
execute store result score @s aj.id run scoreboard players add .aj.last_id aj.i 1
execute at @s run function puppet:summon/__generated__/execute/3
tag @s remove new
scoreboard players set @s aj.puppet.animation.model.walk.loopMode 2