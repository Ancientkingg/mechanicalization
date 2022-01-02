#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add ak.isAnim
execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/rotate_d/play
tp @s ~ ~ ~ ~3 ~
scoreboard players set #execute LANG_MC_INTERNAL 1