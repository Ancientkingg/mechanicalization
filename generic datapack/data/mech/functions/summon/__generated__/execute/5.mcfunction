#built using mc-build (https://github.com/mc-build/mc-build)

tp @s ~ ~ ~ ~ ~
execute store result score @s aj.id run scoreboard players add .aj.last_id aj.i 1
execute at @s run function mech:summon/__generated__/execute/7
tag @s remove new
scoreboard players set @s aj.mech.walking_animation.loopMode 2
scoreboard players set @s aj.mech.walking_a.loopMode 2
scoreboard players set @s aj.mech.walking_d.loopMode 2
scoreboard players set @s aj.mech.walking_s.loopMode 2
scoreboard players set @s aj.mech.idle_on.loopMode 0
scoreboard players set @s aj.mech.jetpack_on.loopMode 2
scoreboard players set @s aj.mech.off.loopMode 1
scoreboard players set @s aj.mech.land.loopMode 0
scoreboard players set @s aj.mech.on.loopMode 1
scoreboard players set @s aj.mech.idle_off.loopMode 0
scoreboard players set @s aj.mech.rotate_a.loopMode 0
scoreboard players set @s aj.mech.rotate_d.loopMode 0
scoreboard players set @s aj.mech.fire_drill.loopMode 1
scoreboard players set @s aj.mech.maver_on.loopMode 1
scoreboard players set @s aj.mech.maver_off.loopMode 1
scoreboard players set @s aj.mech.maver_idle_boost.loopMode 2
scoreboard players set @s aj.mech.maver_idle.loopMode 2
scoreboard players set @s aj.mech.feet_smash.loopMode 0