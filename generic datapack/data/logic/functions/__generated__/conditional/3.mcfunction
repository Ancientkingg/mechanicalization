#built using mc-build (https://github.com/mc-build/mc-build)

function mech:animations/rotate_d/pause
function mech:animations/rotate_a/pause
tag @s add ak.isAnim
execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/walking_s/next_frame
tp @s ^ ^ ^-0.1 ~ ~
scoreboard players set #execute LANG_MC_INTERNAL 1