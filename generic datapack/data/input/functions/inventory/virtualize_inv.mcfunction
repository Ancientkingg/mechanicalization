#built using mc-build (https://github.com/mc-build/mc-build)

tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"INF","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"virtualized player inventory","color":"gold"}]
execute unless score @s rx.pdb.has_entry matches 1 run function #rx.playerdb:api/v2/get/self
data remove block -30000000 0 1602 Items
item replace block -30000000 0 1602 container.0 from entity @s container.9
item replace block -30000000 0 1602 container.1 from entity @s container.10
item replace block -30000000 0 1602 container.2 from entity @s container.11
item replace block -30000000 0 1602 container.3 from entity @s container.12
item replace block -30000000 0 1602 container.4 from entity @s container.13
item replace block -30000000 0 1602 container.5 from entity @s container.14
item replace block -30000000 0 1602 container.6 from entity @s container.15
item replace block -30000000 0 1602 container.7 from entity @s container.16
item replace block -30000000 0 1602 container.8 from entity @s container.17
item replace block -30000000 0 1602 container.9 from entity @s container.18
item replace block -30000000 0 1602 container.10 from entity @s container.19
item replace block -30000000 0 1602 container.11 from entity @s container.20
item replace block -30000000 0 1602 container.12 from entity @s container.21
item replace block -30000000 0 1602 container.13 from entity @s container.22
item replace block -30000000 0 1602 container.14 from entity @s container.23
item replace block -30000000 0 1602 container.15 from entity @s container.24
item replace block -30000000 0 1602 container.16 from entity @s container.25
item replace block -30000000 0 1602 container.17 from entity @s container.26
item replace block -30000000 0 1602 container.18 from entity @s container.27
item replace block -30000000 0 1602 container.19 from entity @s container.28
item replace block -30000000 0 1602 container.20 from entity @s container.29
item replace block -30000000 0 1602 container.21 from entity @s container.30
item replace block -30000000 0 1602 container.22 from entity @s container.31
item replace block -30000000 0 1602 container.23 from entity @s container.32
item replace block -30000000 0 1602 container.24 from entity @s container.33
item replace block -30000000 0 1602 container.25 from entity @s container.34
item replace block -30000000 0 1602 container.26 from entity @s container.35
data modify storage rx.playerdb:io player.data.ak.inv.inventory set from block -30000000 0 1602 Items
data remove block -30000000 0 1602 Items
item replace block -30000000 0 1602 container.0 from entity @s container.0
item replace block -30000000 0 1602 container.1 from entity @s container.1
item replace block -30000000 0 1602 container.2 from entity @s container.2
item replace block -30000000 0 1602 container.3 from entity @s container.3
item replace block -30000000 0 1602 container.4 from entity @s container.4
item replace block -30000000 0 1602 container.5 from entity @s container.5
item replace block -30000000 0 1602 container.6 from entity @s container.6
item replace block -30000000 0 1602 container.7 from entity @s container.7
item replace block -30000000 0 1602 container.8 from entity @s container.8
data modify storage rx.playerdb:io player.data.ak.inv.hotbar set from block -30000000 0 1602 Items
data remove block -30000000 0 1602 Items
item replace block -30000000 0 1602 container.0 from entity @s weapon.offhand
data modify storage rx.playerdb:io player.data.ak.inv.offhand set from block -30000000 0 1602 Items
function #rx.playerdb:api/v2/save/self
clear @s