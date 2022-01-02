#built using mc-build (https://github.com/mc-build/mc-build)

tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"INF","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"player mounted mech","color":"gold"}]
tag @s add ak.mounted
function input:inventory/virtualize_inv
advancement revoke @s only logic:mount
item replace entity @s container.0 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:3}
item replace entity @s container.1 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:4}
item replace entity @s container.2 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:5}
item replace entity @s container.3 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:6}
item replace entity @s container.4 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:7}
item replace entity @s container.5 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:8}
item replace entity @s container.6 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:9}
item replace entity @s container.7 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:10}
item replace entity @s container.8 with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:11}
schedule function logic:__generated__/schedule/0 1t replace