#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add aj.anim.isPlaying
tag @s add aj.mech.anim.walking_animation
execute if score .aj.anim_loop aj.mech.animating matches 0 run function mech:animation_loop
scoreboard players set #execute LANG_MC_INTERNAL 1