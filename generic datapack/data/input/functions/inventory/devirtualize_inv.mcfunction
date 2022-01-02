#built using mc-build (https://github.com/mc-build/mc-build)

tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"INF","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"devirtualized player inventory","color":"gold"}]
clear @s
function #rx.playerdb:api/v2/get/self
data remove block -30000000 0 1602 Items
data modify block -30000000 0 1602 Items set from storage rx.playerdb:io player.data.ak.inv.inventory
item replace entity @s container.9 from block -30000000 0 1602 container.0
item replace entity @s container.10 from block -30000000 0 1602 container.1
item replace entity @s container.11 from block -30000000 0 1602 container.2
item replace entity @s container.12 from block -30000000 0 1602 container.3
item replace entity @s container.13 from block -30000000 0 1602 container.4
item replace entity @s container.14 from block -30000000 0 1602 container.5
item replace entity @s container.15 from block -30000000 0 1602 container.6
item replace entity @s container.16 from block -30000000 0 1602 container.7
item replace entity @s container.17 from block -30000000 0 1602 container.8
item replace entity @s container.18 from block -30000000 0 1602 container.9
item replace entity @s container.19 from block -30000000 0 1602 container.10
item replace entity @s container.20 from block -30000000 0 1602 container.11
item replace entity @s container.21 from block -30000000 0 1602 container.12
item replace entity @s container.22 from block -30000000 0 1602 container.13
item replace entity @s container.23 from block -30000000 0 1602 container.14
item replace entity @s container.24 from block -30000000 0 1602 container.15
item replace entity @s container.25 from block -30000000 0 1602 container.16
item replace entity @s container.26 from block -30000000 0 1602 container.17
item replace entity @s container.27 from block -30000000 0 1602 container.18
item replace entity @s container.28 from block -30000000 0 1602 container.19
item replace entity @s container.29 from block -30000000 0 1602 container.20
item replace entity @s container.30 from block -30000000 0 1602 container.21
item replace entity @s container.31 from block -30000000 0 1602 container.22
item replace entity @s container.32 from block -30000000 0 1602 container.23
item replace entity @s container.33 from block -30000000 0 1602 container.24
item replace entity @s container.34 from block -30000000 0 1602 container.25
item replace entity @s container.35 from block -30000000 0 1602 container.26
data remove block -30000000 0 1602 Items
data modify block -30000000 0 1602 Items set from storage rx.playerdb:io player.data.ak.inv.hotbar
item replace entity @s container.0 from block -30000000 0 1602 container.0
item replace entity @s container.1 from block -30000000 0 1602 container.1
item replace entity @s container.2 from block -30000000 0 1602 container.2
item replace entity @s container.3 from block -30000000 0 1602 container.3
item replace entity @s container.4 from block -30000000 0 1602 container.4
item replace entity @s container.5 from block -30000000 0 1602 container.5
item replace entity @s container.6 from block -30000000 0 1602 container.6
item replace entity @s container.7 from block -30000000 0 1602 container.7
item replace entity @s container.8 from block -30000000 0 1602 container.8
data modify block -30000000 0 1602 Items set from storage rx.playerdb:io player.data.ak.inv.offhand
data remove block -30000000 0 1602 Items
item replace entity @s weapon.offhand from block -30000000 0 1602 container.0
function #rx.playerdb:api/v2/save/self