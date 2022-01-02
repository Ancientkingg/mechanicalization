#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation # aj.id = @s aj.id
execute as @e[type=#puppet:bone_entities,tag=aj.puppet,distance=..6.613] if score @s aj.id = # aj.id run kill @s
kill @s
scoreboard players set #execute LANG_MC_INTERNAL 1