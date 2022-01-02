#built using mc-build (https://github.com/mc-build/mc-build)

tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"INF","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"linked player ID to mech ID","color":"gold"}]
execute as @e[type=marker,distance=..2,tag=aj.mech.root,sort=nearest,limit=1] run function logic:__generated__/execute/6
tag @s add ak.titan.id
scoreboard players operation @s ak.titan.id = @e[type=marker,distance=..2,tag=aj.mech.root,limit=1,sort=nearest] aj.id