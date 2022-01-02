#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players operation .ry ak.wasd = @s ak.wasd
execute store result score @s ak.wasd run data get entity @s Rotation[0] 1.0
scoreboard players operation in ak.math = z ak.wasd
scoreboard players operation in1 ak.math = x ak.wasd
scoreboard players operation #temp ak.math = in ak.math
scoreboard players operation #temp1 ak.math = in1 ak.math
execute if score #temp ak.math matches ..-1 run scoreboard players operation #temp ak.math *= #-1 ak.constant
execute if score #temp1 ak.math matches ..-1 run scoreboard players operation #temp1 ak.math *= #-1 ak.constant
scoreboard players operation #temp2 ak.math = #temp ak.math
scoreboard players operation #temp2 ak.math < #temp1 ak.math
scoreboard players operation #temp3 ak.math = #temp ak.math
scoreboard players operation #temp3 ak.math > #temp1 ak.math
scoreboard players operation #temp2 ak.math *= #1000 ak.constant
scoreboard players operation #temp2 ak.math /= #temp3 ak.math
scoreboard players operation #temp3 ak.math = #temp2 ak.math
scoreboard players operation #temp3 ak.math *= #temp3 ak.math
scoreboard players operation #temp3 ak.math /= #1000 ak.constant
scoreboard players operation out ak.math = #temp3 ak.math
scoreboard players operation out ak.math *= #-46496 ak.constant
scoreboard players operation out ak.math /= #100000 ak.constant
scoreboard players add out ak.math 1593
scoreboard players operation out ak.math *= #temp3 ak.math
scoreboard players operation out ak.math /= #1000 ak.constant
scoreboard players remove out ak.math 3276
scoreboard players operation out ak.math *= #temp3 ak.math
scoreboard players operation out ak.math /= #1000 ak.constant
scoreboard players operation out ak.math *= #temp2 ak.math
scoreboard players operation out ak.math /= #10000 ak.constant
scoreboard players operation out ak.math += #temp2 ak.math
execute if score #temp1 ak.math > #temp ak.math run scoreboard players remove out ak.math 1570
execute if score #temp1 ak.math > #temp ak.math run scoreboard players operation out ak.math *= #-1 ak.constant
execute if score in ak.math matches ..-1 run scoreboard players remove out ak.math 3141
execute if score in ak.math matches ..-1 run scoreboard players operation out ak.math *= #-1 ak.constant
execute if score in1 ak.math matches ..-1 run scoreboard players operation out ak.math *= #-1 ak.constant
scoreboard players operation out ak.math *= #57295 ak.constant
scoreboard players operation out ak.math /= #1000000 ak.constant
scoreboard players operation dir ak.wasd = out ak.math
scoreboard players operation dir ak.wasd += .ry ak.wasd
scoreboard players operation dir ak.wasd %= #360 ak.constant
execute if score dir ak.wasd matches 23..157 run scoreboard players set a ak.wasd 1
execute if score dir ak.wasd matches 112..248 run scoreboard players set s ak.wasd 1
execute if score dir ak.wasd matches 203..337 run scoreboard players set d ak.wasd 1
execute if score dir ak.wasd matches 293..360 run scoreboard players set w ak.wasd 1
execute if score dir ak.wasd matches 0..67 run scoreboard players set w ak.wasd 1