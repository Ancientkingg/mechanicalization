#built using mc-build (https://github.com/mc-build/mc-build)

data modify storage ak.wasd Motion set from entity @s Motion
execute store result score x ak.wasd run data get storage ak.wasd Motion[0] 1000.0
execute store result score z ak.wasd run data get storage ak.wasd Motion[2] 1000.0
scoreboard players set w ak.wasd 0
scoreboard players set a ak.wasd 0
scoreboard players set s ak.wasd 0
scoreboard players set d ak.wasd 0
scoreboard players set dir ak.wasd 0
execute if score z ak.wasd matches 0 if score x ak.wasd matches 0 run scoreboard players set dir ak.wasd -999
execute unless score dir ak.wasd matches -999 run function input:__generated__/execute/4