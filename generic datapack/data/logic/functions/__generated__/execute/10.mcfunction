#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set @s ak.rclick 0
execute if predicate input:rclick0 run tellraw @a ["",{"text":"[ ","color":"yellow"},{"text":"DBG","color":"blue"},{"text":" ] ","color":"yellow"},{"text":"pressed slot 0","color":"gold"}]