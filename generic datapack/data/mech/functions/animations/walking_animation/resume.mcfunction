#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set #execute LANG_MC_INTERNAL 0
execute if entity @s[tag=aj.mech.root] run function mech:animations/walking_animation/__generated__/conditional/14
execute if score #execute LANG_MC_INTERNAL matches 0 run function mech:animations/walking_animation/__generated__/conditional/15