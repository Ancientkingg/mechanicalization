#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[tag=aj.mech.anim.walking_animation] at @s run function mech:animations/walking_animation/next_frame
execute if entity @s[tag=aj.mech.anim.walking_a] at @s run function mech:animations/walking_a/next_frame
execute if entity @s[tag=aj.mech.anim.walking_d] at @s run function mech:animations/walking_d/next_frame
execute if entity @s[tag=aj.mech.anim.walking_s] at @s run function mech:animations/walking_s/next_frame
execute if entity @s[tag=aj.mech.anim.idle_on] at @s run function mech:animations/idle_on/next_frame
execute if entity @s[tag=aj.mech.anim.jetpack_on] at @s run function mech:animations/jetpack_on/next_frame
execute if entity @s[tag=aj.mech.anim.off] at @s run function mech:animations/off/next_frame
execute if entity @s[tag=aj.mech.anim.land] at @s run function mech:animations/land/next_frame
execute if entity @s[tag=aj.mech.anim.on] at @s run function mech:animations/on/next_frame
execute if entity @s[tag=aj.mech.anim.idle_off] at @s run function mech:animations/idle_off/next_frame
execute if entity @s[tag=aj.mech.anim.rotate_a] at @s run function mech:animations/rotate_a/next_frame
execute if entity @s[tag=aj.mech.anim.rotate_d] at @s run function mech:animations/rotate_d/next_frame
execute if entity @s[tag=aj.mech.anim.fire_drill] at @s run function mech:animations/fire_drill/next_frame
execute if entity @s[tag=aj.mech.anim.maver_on] at @s run function mech:animations/maver_on/next_frame
execute if entity @s[tag=aj.mech.anim.maver_off] at @s run function mech:animations/maver_off/next_frame
execute if entity @s[tag=aj.mech.anim.maver_idle_boost] at @s run function mech:animations/maver_idle_boost/next_frame
execute if entity @s[tag=aj.mech.anim.maver_idle] at @s run function mech:animations/maver_idle/next_frame
execute if entity @s[tag=aj.mech.anim.feet_smash] at @s run function mech:animations/feet_smash/next_frame
scoreboard players operation @s aj.mech.animating = .aj.animation aj.mech.animating