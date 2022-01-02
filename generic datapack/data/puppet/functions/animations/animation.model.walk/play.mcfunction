#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set #execute LANG_MC_INTERNAL 0
execute if entity @s[tag=aj.puppet.root] at @s run function puppet:animations/animation.model.walk/__generated__/conditional/4
execute if score #execute LANG_MC_INTERNAL matches 0 run function puppet:animations/animation.model.walk/__generated__/conditional/5