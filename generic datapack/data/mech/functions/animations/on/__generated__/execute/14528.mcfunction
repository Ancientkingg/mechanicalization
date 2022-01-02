#built using mc-build (https://github.com/mc-build/mc-build)

execute if score .this aj.frame matches 0 run playsound minecraft:titan.on master @a ~ ~ ~ 0.1
execute if score .this aj.frame matches 18 run function mech:animations/on/pause