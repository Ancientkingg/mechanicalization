#built using mc-build (https://github.com/mc-build/mc-build)

schedule function puppet:animation_loop 1t
scoreboard players set .aj.anim_loop aj.puppet.animating 1
scoreboard players set .aj.animation aj.puppet.animating 0
execute as @e[type=minecraft:marker,tag=aj.puppet.root] run function puppet:__generated__/execute/9
execute if score .aj.animation aj.puppet.animating matches 0 run function puppet:__generated__/execute/11