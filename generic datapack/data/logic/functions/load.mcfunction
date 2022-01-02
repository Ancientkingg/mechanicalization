#built using mc-build (https://github.com/mc-build/mc-build)

tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"INF","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"reloaded pack","color":"gold"}]
function mech:install
scoreboard objectives add ak.var dummy
scoreboard objectives add ak.is.titan dummy
scoreboard objectives add ak.titan.id dummy
scoreboard objectives add LANG_MC_INTERNAL dummy
scoreboard objectives add ak.rclick used:warped_fungus_on_a_stick
scoreboard objectives add ak.collide dummy
scoreboard objectives add ak.speed dummy
forceload add -30000000 1602
setblock -30000000 0 1602 yellow_shulker_box