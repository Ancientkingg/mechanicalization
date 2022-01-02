#built using mc-build (https://github.com/mc-build/mc-build)

schedule function mech:animation_loop 1t
scoreboard players set .aj.anim_loop aj.mech.animating 1
scoreboard players set .aj.animation aj.mech.animating 0
execute as @e[type=minecraft:marker,tag=aj.mech.root] run function mech:__generated__/execute/15
execute if score .aj.animation aj.mech.animating matches 0 run function mech:__generated__/execute/34