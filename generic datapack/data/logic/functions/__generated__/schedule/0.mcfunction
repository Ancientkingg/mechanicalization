#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a[predicate=!logic:mounted.titan] run function logic:__generated__/execute/2
execute as @a[tag=ak.mounted] run function logic:__generated__/execute/4
execute if entity @a[tag=ak.mounted,predicate=logic:mounted.titan] run schedule function logic:__generated__/schedule/0 1t replace