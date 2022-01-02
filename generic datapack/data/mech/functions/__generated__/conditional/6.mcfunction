#built using mc-build (https://github.com/mc-build/mc-build)

tag @s remove aj.mech.anim.walking_animation
tag @s remove aj.mech.anim.walking_a
tag @s remove aj.mech.anim.walking_d
tag @s remove aj.mech.anim.walking_s
tag @s remove aj.mech.anim.idle_on
tag @s remove aj.mech.anim.jetpack_on
tag @s remove aj.mech.anim.off
tag @s remove aj.mech.anim.land
tag @s remove aj.mech.anim.on
tag @s remove aj.mech.anim.idle_off
tag @s remove aj.mech.anim.rotate_a
tag @s remove aj.mech.anim.rotate_d
tag @s remove aj.mech.anim.fire_drill
tag @s remove aj.mech.anim.maver_on
tag @s remove aj.mech.anim.maver_off
tag @s remove aj.mech.anim.maver_idle_boost
tag @s remove aj.mech.anim.maver_idle
tag @s remove aj.mech.anim.feet_smash
scoreboard players set @s aj.frame 0
scoreboard players operation .this aj.id = @s aj.id
execute as @e[type=minecraft:area_effect_cloud,tag=aj.mech.bone,distance=..7.826] if score @s aj.id = .this aj.id run function mech:__generated__/execute/11
execute as @e[type=minecraft:armor_stand,tag=aj.mech.bone,distance=..7.826] if score @s aj.id = .this aj.id run function mech:__generated__/execute/14
scoreboard players set #execute LANG_MC_INTERNAL 1