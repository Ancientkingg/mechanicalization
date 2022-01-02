#built using mc-build (https://github.com/mc-build/mc-build)

function input:calc_dir
execute if entity @s[tag=!ak.titan.id] at @s positioned ~ ~-3.5 ~ run function logic:__generated__/execute/5
scoreboard players operation #temp.id ak.var = @s ak.titan.id
execute if predicate input:offhand run function logic:__generated__/execute/7
execute if score @s ak.rclick matches 1.. run function logic:__generated__/execute/10
tag @s add ak.self
execute at @s positioned ~ ~-2 ~ as @e[type=marker,tag=aj.mech.root,distance=..30,tag=!aj.mech.anim.on,tag=maver_mode] if score @s aj.id = #temp.id ak.var at @s run function logic:__generated__/execute/12
execute at @s positioned ~ ~-3.5 ~ as @e[type=marker,tag=aj.mech.root,distance=..1,tag=!aj.mech.anim.on,tag=!maver_mode] at @s run function logic:__generated__/execute/142
tag @s remove ak.self