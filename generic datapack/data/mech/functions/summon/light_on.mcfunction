#built using mc-build (https://github.com/mc-build/mc-build)

summon minecraft:marker ~ ~ ~ {Tags:['new','aj.mech','aj.mech.root']}
execute as @e[type=minecraft:marker,tag=aj.mech.root,tag=new,distance=..1,limit=1] rotated ~ 0 run function mech:summon/__generated__/execute/1
scoreboard players set @s aj.mech.animating 0
scoreboard players add .aj.animation aj.mech.animating 0
scoreboard players add .aj.anim_loop aj.mech.animating 0