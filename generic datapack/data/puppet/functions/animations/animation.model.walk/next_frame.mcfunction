#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation .this aj.id = @s aj.id
scoreboard players operation .this aj.frame = @s aj.frame
execute rotated ~ 0 as @e[type=#puppet:bone_entities,tag=aj.puppet.bone,distance=..6.613] if score @s aj.id = .this aj.id run function puppet:animations/animation.model.walk/__generated__/execute/14
scoreboard players add @s aj.frame 1
scoreboard players set .aj.animation aj.puppet.animating 1
execute if score @s aj.frame matches 32.. run function puppet:animations/animation.model.walk/end