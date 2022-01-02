#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation .this aj.id = @s aj.id
execute as @e[type=minecraft:armor_stand,tag=aj.mech.bone,distance=..7.826] if score @s aj.id = .this aj.id run data modify entity @s[tag=aj.mech.bone.body] ArmorItems[-1].tag.CustomModelData set value 13
scoreboard players set #execute LANG_MC_INTERNAL 1