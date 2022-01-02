#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add aj.anim.isPlaying
tag @s add aj.puppet.anim.animation.model.walk
scoreboard players set @s aj.frame 0
execute if score .aj.anim_loop aj.puppet.animating matches 0 run function puppet:animation_loop
scoreboard players set #execute LANG_MC_INTERNAL 1