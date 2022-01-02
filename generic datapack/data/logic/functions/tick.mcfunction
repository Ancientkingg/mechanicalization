#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @e[type=marker,tag=aj.mech.root,scores={ak.speed=1..}] ak.speed 1
scoreboard players add @e[type=marker,tag=aj.mech.root,scores={ak.speed=..-1}] ak.speed 1
execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode] at @s if block ~ ~-0.01 ~ #logic:passable run tp @s ~ ~-0.2 ~
execute as @e[type=marker,tag=aj.mech.root] at @s unless block ^ ^ ^1 #logic:passable if block ^ ^1 ^0.1 #logic:passable if block ^ ^2 ^0.1 #logic:passable if block ^ ^3 ^0.1 #logic:passable if block ^ ^4 ^0.1 #logic:passable if block ^ ^5 ^0.1 #logic:passable if block ^ ^6 ^0.1 #logic:passable run tp @s ~ ~0.2 ~