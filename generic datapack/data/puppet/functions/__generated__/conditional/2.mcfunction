#built using mc-build (https://github.com/mc-build/mc-build)

tag @s remove aj.puppet.anim.animation.model.walk
scoreboard players set @s aj.frame 0
scoreboard players operation .this aj.id = @s aj.id
execute as @e[type=minecraft:area_effect_cloud,tag=aj.puppet.bone,distance=..6.613] if score @s aj.id = .this aj.id run function puppet:__generated__/execute/5
execute as @e[type=minecraft:armor_stand,tag=aj.puppet.bone,distance=..6.613] if score @s aj.id = .this aj.id run function puppet:__generated__/execute/8
scoreboard players set #execute LANG_MC_INTERNAL 1