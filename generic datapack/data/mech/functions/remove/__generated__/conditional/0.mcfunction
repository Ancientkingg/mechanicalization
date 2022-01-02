#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation # aj.id = @s aj.id
execute as @e[type=#mech:bone_entities,tag=aj.mech,distance=..7.2] if score @s aj.id = # aj.id run kill @s
kill @s
scoreboard players set #execute LANG_MC_INTERNAL 1