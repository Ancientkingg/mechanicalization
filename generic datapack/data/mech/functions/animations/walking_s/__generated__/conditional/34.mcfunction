#built using mc-build (https://github.com/mc-build/mc-build)

tag @s remove aj.anim.isPlaying
tag @s remove aj.mech.anim.walking_s
scoreboard players set @s aj.frame 0
scoreboard players set .noScripts aj.i 1
function mech:animations/walking_s/next_frame
scoreboard players set .noScripts aj.i 0
scoreboard players set @s aj.frame 0
scoreboard players set #execute LANG_MC_INTERNAL 1