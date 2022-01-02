import ./macros/log.mcm

function load{
	log INF reloaded pack
	function mech:install
	scoreboard objectives add ak.var dummy
	scoreboard objectives add ak.is.titan dummy
	scoreboard objectives add ak.titan.id dummy
	scoreboard objectives add LANG_MC_INTERNAL dummy
	scoreboard objectives add ak.rclick used:warped_fungus_on_a_stick
	scoreboard objectives add ak.collide dummy
	scoreboard objectives add ak.speed dummy
	forceload add -30000000 1602
	setblock <%config.shulker_xyz%> yellow_shulker_box
}

function tick{
	scoreboard players remove @e[type=marker,tag=aj.mech.root,scores={ak.speed=1..}] ak.speed 1
	scoreboard players add @e[type=marker,tag=aj.mech.root,scores={ak.speed=..-1}] ak.speed 1

	# gravity
	execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode] at @s if block ~ ~-0.01 ~ #logic:passable run tp @s ~ ~-0.2 ~
	# going up 1 tall blocks
	execute as @e[type=marker,tag=aj.mech.root] at @s unless block ^ ^ ^1 #logic:passable if block ^ ^1 ^0.1 #logic:passable if block ^ ^2 ^0.1 #logic:passable if block ^ ^3 ^0.1 #logic:passable if block ^ ^4 ^0.1 #logic:passable if block ^ ^5 ^0.1 #logic:passable if block ^ ^6 ^0.1 #logic:passable run tp @s ~ ~0.2 ~
}

blocks passable{
	minecraft:air
	minecraft:void_air
	minecraft:cave_air
	minecraft:water
}

advancement mount{
  "criteria": {
	"requirement": {
	  "trigger": "minecraft:player_interacted_with_entity",
	  "conditions": {
		"entity": [
		  {
			"condition": "minecraft:entity_scores",
			"entity": "this",
			"scores": {
			  "ak.is.titan": 1
			}
		  }
		]
	  }
	}
  },
  "rewards": {
	"function": "logic:mount"
  }
}

function mount{
	log INF player mounted mech
	tag @s add ak.mounted
	function input:inventory/virtualize_inv
	advancement revoke @s only logic:mount
	LOOP(9,i){
		item replace entity @s container.<%i%> with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:<%3+i%>}
	}

	# basically tick function that only runs, if at least one player is in the mech
	schedule 1t replace{

		# callback when player exits mech
		execute as @a[predicate=!logic:mounted.titan] run{
			scoreboard players operation #temp.id ak.var = @s ak.titan.id
			execute at @s as @e[type=marker,distance=..15,tag=aj.mech.root,sort=nearest,limit=1] if score @s aj.id = #temp.id ak.var run{
				function mech:animations/rotate_a/pause
				function mech:animations/rotate_d/pause
				stopsound @a master minecraft:titan.on
				function mech:animations/on/pause
				function mech:animations/off/play
			} 
			tag @s remove ak.mounted
			tag @s remove ak.titan.id
			scoreboard players set @s ak.titan.id -1
			function input:inventory/devirtualize_inv
			log INF player unmounted mech
		}

		# tick function per player
		execute as @a[tag=ak.mounted] run{
			# calculate wasd
			function input:calc_dir
			# callback when player enters mech
			execute if entity @s[tag=!ak.titan.id] at @s positioned ~ ~-3.5 ~ run{
				log INF linked player ID to mech ID
				execute as @e[type=marker,distance=..2,tag=aj.mech.root,sort=nearest,limit=1] run{
					scoreboard players add @s ak.speed 0
					stopsound @a master minecraft:titan.off
					function mech:animations/off/pause
					function mech:animations/on/play
				}
				tag @s add ak.titan.id
				scoreboard players operation @s ak.titan.id = @e[type=marker,distance=..2,tag=aj.mech.root,limit=1,sort=nearest] aj.id
			}
			scoreboard players operation #temp.id ak.var = @s ak.titan.id
			# handling input
			execute if predicate input:offhand run{
				item replace entity @s weapon.mainhand from entity @s weapon.offhand
				item replace entity @s weapon.offhand with air

				scoreboard players set #ifelse ak.var 0
				
				execute at @s as @e[type=marker,tag=aj.mech.root,tag=!aj.anim.isPlaying,distance=..30,tag=!aj.mech.anim.on,tag=!maver_mode] if score @s aj.id = #temp.id ak.var at @s run{
					scoreboard players set #ifelse ak.var 1
					function mech:animations/maver_on/play
					tag @s add maver_mode
				} 
				execute unless score #ifelse ak.var matches 1 at @s as @e[type=marker,tag=!aj.anim.isPlaying,tag=aj.mech.root,distance=..30,tag=!aj.mech.anim.on,tag=maver_mode] if score @s aj.id = #temp.id ak.var at @s run{
					function mech:animations/maver_off/play
					tag @s remove maver_mode
				} 
				log DBG pressed f
			}
			execute if score @s ak.rclick matches 1.. run{
				scoreboard players set @s ak.rclick 0
				execute if predicate input:rclick0 run{
					log DBG pressed slot 0
				}
			}
			tag @s add ak.self
			execute at @s positioned ~ ~-2 ~ as @e[type=marker,tag=aj.mech.root,distance=..30,tag=!aj.mech.anim.on,tag=maver_mode] if score @s aj.id = #temp.id ak.var at @s run{
				execute anchored eyes rotated as @a[tag=ak.self,distance=..20,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
				execute if score a ak.wasd matches 1 run{
					execute at @s run tp @s ^0.2 ^ ^ ~ ~
				}
				execute if score d ak.wasd matches 1 run{
					execute at @s run tp @s ^-0.2 ^ ^ ~ ~
				}
				execute if score w ak.wasd matches 1 run{
					scoreboard players add @s[scores={ak.speed=..37}] ak.speed 2
				}
				execute if score s ak.wasd matches 1 run{
					scoreboard players remove @s[scores={ak.speed=-37..}] ak.speed 2
				}
				execute at @s run{
					LOOP(60,i){
						execute if score @s ak.speed matches <%i%> run tp @s ^ ^ ^<%i/60%> ~ ~
						execute if score @s ak.speed matches -<%i%> run tp @s ^ ^ ^-<%i/60%> ~ ~
					}
					
				}
				execute if entity @s[tag=!aj.anim.isPlaying,tag=!ak.isAnim] run{
					tag @s remove ak.isAnim
					function mech:animations/maver_idle/next_frame
				}
				
			}
			# mech ticking
			execute at @s positioned ~ ~-3.5 ~ as @e[type=marker,tag=aj.mech.root,distance=..1,tag=!aj.mech.anim.on,tag=!maver_mode] at @s run{
				tag @s remove ak.isAnim
				# collision checks
				scoreboard players set w ak.collide 0
				scoreboard players set s ak.collide 0
				scoreboard players set a ak.collide 0
				scoreboard players set d ak.collide 0
				LOOP(7,y){
					LOOP(5,x){
						execute unless block ^<%x-2%> ^<%y/2+2.5%> ^1.7 #logic:passable run scoreboard players set w ak.collide 1
						execute unless block ^<%x-2%> ^<%y/2+2.5%> ^-1.9 #logic:passable run scoreboard players set s ak.collide 1
						!config.dev{
							execute if score dev.hitbox ak.var matches 1 run{
								execute positioned ^<%x-2%> ^<%y/1.6+2.5%> ^1.7 run particle electric_spark
								execute positioned ^<%x-2%> ^<%y/1.6+2.5%> ^-1.9 run particle electric_spark
							}
						}
					}
				}
				LOOP(6,i){
					execute unless block ^-1.5 ^3.5 ^<%(i*4+3)/10%> #logic:passable run scoreboard players set a ak.collide 1
					execute unless block ^-2.65 ^3.5 ^<%(i*4+3)/10%> #logic:passable run scoreboard players set a ak.collide 1

					LOOP(3,ii){
						execute unless block ^<%-2.3+i/7%> ^<%3.25+ii/2.5%> ^2.5 #logic:passable run scoreboard players set w ak.collide 1
						execute unless block ^<%-2.3+i/7%> ^<%3.25+ii/2.5%> ^2.5 #logic:passable run scoreboard players set a ak.collide 1
					}

					execute unless block ^1.5 ^3.5 ^<%(i*4-2)/10%> #logic:passable run scoreboard players set d ak.collide 1
					execute unless block ^2.65 ^3.5 ^<%(i*4-2)/10%> #logic:passable run scoreboard players set d ak.collide 1

					# execute unless block ^-1.5 ^3.5 ^2.5 #logic:passable run scoreboard players set a ak.collide 1
					!config.dev{
						execute if score dev.hitbox ak.var matches 1 run{
							execute positioned ^-1.5 ^3.5 ^<%(i*4+3)/10%> run particle electric_spark
							execute positioned ^-2.65 ^3.5 ^<%(i*4+3)/10%> run particle electric_spark

							execute positioned ^1.5 ^3.5 ^<%(i*4-2)/10%> run particle electric_spark
							execute positioned ^2.65 ^3.5 ^<%(i*4-2)/10%> run particle electric_spark

							LOOP(3,ii){
								execute positioned ^<%-2.3+i/7%> ^<%3.25+ii/2.5%> ^2.5 run particle electric_spark
							}
						}
					}
				}
				scoreboard players operation #temp.id ak.var = @s aj.id
				# animation controller
				execute(if score a ak.wasd matches 1 unless entity @s[tag=aj.mech.anim.rotate_d] if score a ak.collide matches 0){
					tag @s add ak.isAnim
					execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/rotate_a/play
					tp @s ~ ~ ~ ~-3 ~
				}else execute(if score d ak.wasd matches 1 unless entity @s[tag=aj.mech.anim.rotate_a] if score d ak.collide matches 0){
					tag @s add ak.isAnim
					execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/rotate_d/play
					tp @s ~ ~ ~ ~3 ~
				}else execute(if score w ak.wasd matches 1 if score w ak.collide matches 0){
					tag @s add ak.isAnim
					function mech:animations/rotate_d/pause
					function mech:animations/rotate_a/pause
					execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/walking_animation/next_frame
					tp @s ^ ^ ^0.1 ~ ~
				}else execute(if score s ak.wasd matches 1 if score s ak.collide matches 0){
					function mech:animations/rotate_d/pause
					function mech:animations/rotate_a/pause
					tag @s add ak.isAnim
					execute unless entity @s[tag=aj.anim.isPlaying] run function mech:animations/walking_s/next_frame
					tp @s ^ ^ ^-0.1 ~ ~
				}
				# idle
				execute if entity @s[tag=!aj.anim.isPlaying,tag=!ak.isAnim] run{
					tag @s remove ak.isAnim
					function mech:animations/idle_on/next_frame
				}
			}
			tag @s remove ak.self
		}
		execute if entity @a[tag=ak.mounted,predicate=logic:mounted.titan] run schedule function $block 1t replace
	}
}

predicate mounted.titan{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
	"vehicle": {}
  }
}



