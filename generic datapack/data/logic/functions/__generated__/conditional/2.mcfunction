#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add ak.isAnim
function mech:animations/rotate_d/pause
function mech:animations/rotate_a/pause
execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/walking_animation/next_frame
tp @s ^ ^ ^0.1 ~ ~
scoreboard players set #execute LANG_MC_INTERNAL 1