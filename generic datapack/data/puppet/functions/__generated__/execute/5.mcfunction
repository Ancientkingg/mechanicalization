#built using mc-build (https://github.com/mc-build/mc-build)

tp @s[tag=aj.puppet.bone.puppet] ^0 ^-1.813 ^0
tp @s[tag=aj.puppet.bone.leg2] ^-0.125 ^0.809 ^0.156
tp @s[tag=aj.puppet.bone.bone2] ^-0.125 ^0.497 ^0.156
tp @s[tag=aj.puppet.bone.bone3] ^-0.125 ^0.184 ^0.156
tp @s[tag=aj.puppet.bone.bone4] ^-0.125 ^-0.128 ^0.156
tp @s[tag=aj.puppet.bone.bone5] ^-0.125 ^-0.441 ^0.156
tp @s[tag=aj.puppet.bone.bone6] ^-0.125 ^-0.753 ^0.156
tp @s[tag=aj.puppet.bone.bone7] ^-0.125 ^-1.066 ^0.156
tp @s[tag=aj.puppet.bone.bone8] ^-0.125 ^-1.378 ^0.156
tp @s[tag=aj.puppet.bone.shoe] ^-0.125 ^-1.691 ^0.156
tp @s[tag=aj.puppet.bone.leg3] ^0.188 ^0.809 ^0.156
tp @s[tag=aj.puppet.bone.bone] ^0.188 ^0.497 ^0.156
tp @s[tag=aj.puppet.bone.bone9] ^0.188 ^0.184 ^0.156
tp @s[tag=aj.puppet.bone.bone10] ^0.188 ^-0.128 ^0.156
tp @s[tag=aj.puppet.bone.bone11] ^0.188 ^-0.441 ^0.156
tp @s[tag=aj.puppet.bone.bone12] ^0.188 ^-0.753 ^0.156
tp @s[tag=aj.puppet.bone.bone13] ^0.188 ^-1.066 ^0.156
tp @s[tag=aj.puppet.bone.bone14] ^0.188 ^-1.378 ^0.156
tp @s[tag=aj.puppet.bone.shoe2] ^0.188 ^-1.691 ^0.156
tp @s[tag=aj.puppet.bone.body] ^0.031 ^0.843 ^0.094
tp @s[tag=aj.puppet.bone.head] ^0.031 ^2.25 ^0.094
tp @s[tag=aj.puppet.bone.hat] ^0.031 ^2.985 ^-0.154
tp @s[tag=aj.puppet.bone.face] ^-0.016 ^-1.813 ^0
tp @s[tag=aj.puppet.bone.leftarm] ^0.313 ^2.171 ^0.094
tp @s[tag=aj.puppet.bone.arm] ^-0.25 ^2.25 ^0.063
tp @s[tag=aj.puppet.bone.bone15] ^-0.312 ^1.812 ^0.063
tp @s[tag=aj.puppet.bone.bone16] ^-0.312 ^1.312 ^0.063
tp @s[tag=aj.puppet.bone.bone17] ^-0.312 ^0.812 ^0.063
tp @s[tag=aj.puppet.bone.bone18] ^-0.312 ^0.312 ^0.063
tp @s[tag=aj.puppet.bone.hand] ^-0.307 ^-0.21 ^0.069
execute store result score .calc aj.i run data get entity @s Air
execute store result entity @s Air short 1 run scoreboard players add .calc aj.i 1