#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set #execute LANG_MC_INTERNAL 0
execute if entity @s[tag=aj.mech.root] at @s run function mech:set_variant/__generated__/conditional/2
execute if score #execute LANG_MC_INTERNAL matches 0 run function mech:set_variant/__generated__/conditional/3