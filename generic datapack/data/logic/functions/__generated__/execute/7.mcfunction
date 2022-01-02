#built using mc-build (https://github.com/mc-build/mc-build)

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air
scoreboard players set #ifelse ak.var 0
execute at @s as @e[type=marker,tag=aj.mech.root,tag=!aj.anim.isPlaying,distance=..30,tag=!aj.mech.anim.on,tag=!maver_mode] if score @s aj.id = #temp.id ak.var at @s run function logic:__generated__/execute/8
execute unless score #ifelse ak.var matches 1 at @s as @e[type=marker,tag=!aj.anim.isPlaying,tag=aj.mech.root,distance=..30,tag=!aj.mech.anim.on,tag=maver_mode] if score @s aj.id = #temp.id ak.var at @s run function logic:__generated__/execute/9
tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"DBG","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"pressed f","color":"gold"}]