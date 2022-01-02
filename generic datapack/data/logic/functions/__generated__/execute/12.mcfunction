#built using mc-build (https://github.com/mc-build/mc-build)

execute anchored eyes rotated as @a[tag=ak.self,distance=..20,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if score a ak.wasd matches 1 run execute at @s run tp @s ^0.2 ^ ^ ~ ~
execute if score d ak.wasd matches 1 run execute at @s run tp @s ^-0.2 ^ ^ ~ ~
execute if score w ak.wasd matches 1 run scoreboard players add @s[scores={ak.speed=..37}] ak.speed 2
execute if score s ak.wasd matches 1 run scoreboard players remove @s[scores={ak.speed=-37..}] ak.speed 2
execute at @s run function logic:__generated__/execute/20
execute if entity @s[tag=!aj.anim.isPlaying,tag=!ak.isAnim] run function logic:__generated__/execute/141