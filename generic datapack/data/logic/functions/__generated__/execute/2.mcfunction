#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation #temp.id ak.var = @s ak.titan.id
execute at @s as @e[type=marker,distance=..15,tag=aj.mech.root,sort=nearest,limit=1] if score @s aj.id = #temp.id ak.var run function logic:__generated__/execute/3
tag @s remove ak.mounted
tag @s remove ak.titan.id
scoreboard players set @s ak.titan.id -1
function input:inventory/devirtualize_inv
tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"INF","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"player unmounted mech","color":"gold"}]