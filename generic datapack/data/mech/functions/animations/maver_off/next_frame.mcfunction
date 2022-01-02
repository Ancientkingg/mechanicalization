#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation .this aj.id = @s aj.id
scoreboard players operation .this aj.frame = @s aj.frame
execute rotated ~ 0 as @e[type=#mech:bone_entities,tag=aj.mech.bone,distance=..7.826] if score @s aj.id = .this aj.id run function mech:animations/maver_off/__generated__/execute/18415
execute if score .noScripts aj.i matches 0 run function mech:animations/maver_off/__generated__/execute/19091
scoreboard players add @s aj.frame 1
scoreboard players set .aj.animation aj.mech.animating 1
execute if score @s aj.frame matches 24.. run function mech:animations/maver_off/end