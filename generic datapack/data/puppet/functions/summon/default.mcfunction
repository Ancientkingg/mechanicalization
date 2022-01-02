#built using mc-build (https://github.com/mc-build/mc-build)

summon minecraft:marker ~ ~ ~ {Tags:['new','aj.puppet','aj.puppet.root']}
execute as @e[type=minecraft:marker,tag=aj.puppet.root,tag=new,distance=..1,limit=1] rotated ~ 0 run function puppet:summon/__generated__/execute/1
scoreboard players set @s aj.puppet.animating 0
scoreboard players add .aj.animation aj.puppet.animating 0
scoreboard players add .aj.anim_loop aj.puppet.animating 0