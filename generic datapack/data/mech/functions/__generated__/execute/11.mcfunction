#built using mc-build (https://github.com/mc-build/mc-build)

tp @s[tag=aj.mech.bone.mech] ^0 ^2.906 ^-0.062
tp @s[tag=aj.mech.bone.body] ^-0.026 ^2.629 ^0.939
tp @s[tag=aj.mech.bone.seat] ^-0.022 ^1.958 ^0.369
tp @s[tag=aj.mech.bone.left_arm] ^1.849 ^3.019 ^-0.303
tp @s[tag=aj.mech.bone.drill] ^2.052 ^1.55 ^0.116
tp @s[tag=aj.mech.bone.right_arm] ^-1.88 ^3.019 ^-0.303
tp @s[tag=aj.mech.bone.jetpack] ^-0.031 ^2.708 ^-1.512
tp @s[tag=aj.mech.bone.left_leg] ^0.905 ^0.72 ^-0.248
tp @s[tag=aj.mech.bone.left_knee] ^1.018 ^-0.01 ^0.421
tp @s[tag=aj.mech.bone.left_foot] ^1.011 ^-1.071 ^-0.183
tp @s[tag=aj.mech.bone.right_leg] ^-0.877 ^0.72 ^-0.248
tp @s[tag=aj.mech.bone.right_knee] ^-1.052 ^-0.01 ^0.421
tp @s[tag=aj.mech.bone.right_foot] ^-1.046 ^-1.071 ^-0.183
execute store result score .calc aj.i run data get entity @s Air
execute store result entity @s Air short 1 run scoreboard players add .calc aj.i 1