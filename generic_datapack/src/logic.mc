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
	scoreboard objectives add ak.lastSpeed dummy
	scoreboard objectives add ak.fallTime dummy

	scoreboard objectives add ak.sound.maver_faster dummy
	scoreboard objectives add ak.sound.maver_ambient dummy
	scoreboard objectives add ak.sound.maver_slower dummy
	
	scoreboard players set #-1 ak.var -1

	forceload add -30000000 1602
	setblock <%config.shulker_xyz%> yellow_shulker_box
}

function tick{
	execute at @a as @e[type=marker,tag=maver_idle,distance=..30] at @s run function mech:animations/maver_idle/next_frame
	scoreboard players remove @e[type=marker,tag=aj.mech.root,scores={ak.speed=1..}] ak.speed 1
	scoreboard players add @e[type=marker,tag=aj.mech.root,scores={ak.speed=..-1}] ak.speed 1

	# gravity
	execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode,scores={ak.fallTime=1..}] at @s unless block ~ ~-0.2 ~ #logic:passable run{
		execute if score @s ak.fallTime matches 10.. run{
			function mech:animations/land/play
			playsound minecraft:titan.crash master @a ~ ~ ~ 0.1 1
			playsound minecraft:titan.crash master @a ~ ~ ~ 0.1 1.2
			playsound minecraft:titan.crash master @a ~ ~ ~ 0.1 0.7
			playsound minecraft:titan.footstep master @a ~ ~ ~ 0.2 1
			playsound minecraft:titan.footstep master @a ~ ~ ~ 0.4 0.75
		}
		scoreboard players set @s ak.fallTime 0
	}
	execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode] at @s if block ~ ~-0.2 ~ #logic:passable run scoreboard players add @s ak.fallTime 1
	execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode] at @s if block ~ ~-0.2 ~ #logic:passable run tp @s ~ ~-0.2 ~
	execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode] at @s unless block ~ ~-0.2 ~ #logic:passable if block ~ ~0.05 ~ #logic:passable run tp @s ~ ~-0.01 ~
	# going up 1 tall blocks
	execute as @e[type=marker,tag=aj.mech.root,tag=!maver_mode] at @s unless block ^ ^0.5 ^1 #logic:passable if block ^ ^1 ^0.1 #logic:passable if block ^ ^2 ^0.1 #logic:passable if block ^ ^3 ^0.1 #logic:passable if block ^ ^4 ^0.1 #logic:passable if block ^ ^5 ^0.1 #logic:passable if block ^ ^6 ^0.1 #logic:passable run tp @s ~ ~0.2 ~
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
	execute(if entity @s[advancements={logic:enter_titan=true}]){
		playsound minecraft:titan.ai.welcomeaboard master @a ~ ~ ~ 0.1 0.95
	} else {
		playsound minecraft:titan.ai.user-not-recognized master @a ~ ~ ~ 0.1 0.95
	}
	advancement grant @s only logic:enter_titan
	advancement revoke @s only logic:mount
	LOOP(9,i){
		item replace entity @s container.<%i%> with minecraft:warped_fungus_on_a_stick{titan.input:1b,CustomModelData:<%3+i%>}
	}

	# basically tick function that only runs, if at least one player is in the mech
	schedule 1t replace{

		# callback when player exits mech
		execute as @a[predicate=!logic:mounted.titan] run{
			scoreboard players operation #temp.id ak.var = @s ak.titan.id
			execute at @s as @e[type=marker,distance=..15,tag=aj.mech.root,sort=nearest,limit=1,tag=!maver_mode] if score @s aj.id = #temp.id ak.var run{
				function mech:animations/rotate_a/pause
				function mech:animations/rotate_d/pause
				stopsound @a master minecraft:titan.on
				function mech:animations/on/pause
				function mech:animations/off/play
			} 
			execute at @s as @e[type=marker,distance=..15,tag=aj.mech.root,sort=nearest,limit=1,tag=maver_mode] if score @s aj.id = #temp.id ak.var run tag @s add maver_idle
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
				execute positioned ~ ~1.5 ~ as @e[type=marker,distance=..3.5,tag=aj.mech.root,sort=nearest,limit=1,tag=maver_mode] run tag @s remove maver_idle
				execute as @e[type=marker,distance=..2,tag=aj.mech.root,sort=nearest,limit=1,tag=!maver_mode] run{
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
				# activating maver mode
				execute at @s as @e[type=marker,tag=aj.mech.root,tag=!aj.anim.isPlaying,distance=..30,tag=!aj.mech.anim.on,tag=!maver_mode] if score @s aj.id = #temp.id ak.var at @s run{
					scoreboard players set #ifelse ak.var 1
					tag @s add maver_mode
					playsound minecraft:titan.ai.maver.activate master @a ~ ~ ~ 0.15 0.95
					function mech:animations/maver_on/play
					tp @s ~ ~ ~ ~ 0
				} 
				# deactivating maver mode
				execute unless score #ifelse ak.var matches 1 at @s as @e[type=marker,tag=!aj.anim.isPlaying,tag=aj.mech.root,distance=..30,tag=!aj.mech.anim.on,tag=maver_mode] if score @s aj.id = #temp.id ak.var at @s run{
					scoreboard players set @s ak.sound.maver_faster 0
					function mech:animations/maver_off/play
					playsound minecraft:titan.ai.maver.deactivate master @a ~ ~ ~ 0.15 0.95
					tag @s remove maver_mode
					tp @s ~ ~ ~ ~ 0
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

			# maver mode
			execute at @s positioned ~ ~-2 ~ as @e[type=marker,tag=aj.mech.root,distance=..30,tag=!aj.mech.anim.on,tag=maver_mode,tag=!aj.mech.anim.maver_on,tag=!aj.mech.anim.maver_off] if score @s aj.id = #temp.id ak.var at @s run{
				scoreboard players operation @s ak.lastSpeed = @s ak.speed
				execute unless entity @a[tag=ak.self,distance=..20] run tp @s ~ ~ ~
				execute anchored eyes rotated as @a[tag=ak.self,distance=..20,limit=1,sort=nearest] positioned ^ ^ ^5 rotated as @s positioned ^ ^ ^40 facing entity @s eyes facing ^ ^ ^-1 positioned as @s run tp @s ~ ~ ~ ~ ~
				execute if score down ak.collide matches 1 run tp @s ~ ~0.1 ~
				scoreboard players set w ak.collide 0
				scoreboard players set s ak.collide 0
				scoreboard players set a ak.collide 0
				scoreboard players set d ak.collide 0
				scoreboard players set up ak.collide 0
				scoreboard players set down ak.collide 0
				scoreboard players set rc ak.var 0
				execute positioned ~ ~0.5 ~ if score @s ak.speed matches 1.. run{
					scoreboard players add rc ak.var 1
					execute unless block ~ ~ ~ #logic:passable run{
						scoreboard players set rc ak.var 25
						execute at @s run tp @s ~ ~ ~ ~ 0
					}
					execute unless score rc ak.var matches 25.. positioned ^ ^ ^0.1 run function $block
				}
				scoreboard players set rc ak.var 0
				execute positioned ~ ~0.5 ~ if score @s ak.speed matches ..-1 run{
					scoreboard players add rc ak.var 1
					execute unless block ~ ~ ~ #logic:passable run{
						scoreboard players set rc ak.var 25
						execute at @s run tp @s ~ ~ ~ ~ 0
					}
					execute unless score rc ak.var matches 25.. positioned ^ ^ ^-0.1 run function $block
				}
				execute rotated ~ 0 run{
					LOOP(7,x){
						LOOP(5,z){
							execute unless block ^<%x-3%> ^5.75 ^<%z-2%> #logic:passable run scoreboard players set up ak.collide 1
							execute unless block ^<%x-3%> ^0.75 ^<%z-2%> #logic:passable run scoreboard players set down ak.collide 1
							execute unless block ^-2.5 ^<%x/1.5+1%> ^<%z-2%> #logic:passable run scoreboard players set d ak.collide 1
							execute unless block ^2.5 ^<%x/1.5+1%> ^<%z-2%> #logic:passable run scoreboard players set a ak.collide 1
							execute unless block ^<%x/1.2-2.5%> ^<%z+1%> ^2 #logic:passable run scoreboard players set w ak.collide 1
							execute unless block ^<%x/1.2-2.5%> ^<%z+1%> ^-2 #logic:passable run scoreboard players set d ak.collide 1
							execute if score dev.hitbox ak.var matches 1 run{
								execute positioned ^<%x-3%> ^5.75 ^<%z-2%> run particle electric_spark
								execute positioned ^<%x-3%> ^0.75 ^<%z-2%> run particle electric_spark
							}
							execute if score dev.hitbox ak.var matches 1 run{
								execute positioned ^-2.5 ^<%x/1.5+1%> ^<%z-2%> run particle electric_spark
								execute positioned ^2.5 ^<%x/1.5+1%> ^<%z-2%> run particle electric_spark
							}
							execute if score dev.hitbox ak.var matches 1 run{
								execute positioned ^<%x/1.2-2.5%> ^<%z+1%> ^2 run particle electric_spark
								execute positioned ^<%x/1.2-2.5%> ^<%z+1%> ^-2 run particle electric_spark
							}
						}

					}
				}
				
				execute if score up ak.collide matches 1 run{
					scoreboard players set @s ak.speed 0
					tp @s @s
				}
				execute if score w ak.collide matches 1 run{
					scoreboard players set @s ak.speed 0
					tp @s @s
				}
				execute if score s ak.collide matches 1 run{
					scoreboard players set @s ak.speed 0
					tp @s @s
				}
				execute if score d ak.collide matches 1 run{
					scoreboard players set @s ak.speed 0
					tp @s @s
				}
				execute if score a ak.collide matches 1 run{
					scoreboard players set @s ak.speed 0
					tp @s @s
				}
				scoreboard players operation #temp ak.var = @s ak.lastSpeed
				scoreboard players operation #temp ak.var -= @s ak.speed
				execute if score #temp ak.var matches 5.. run{
					playsound minecraft:titan.crash master @a ~ ~ ~ 0.3 1
					playsound minecraft:titan.crash master @a ~ ~ ~ 0.2 1.2
					playsound minecraft:titan.crash master @a ~ ~ ~ 0.2 0.7
					playsound minecraft:titan.footstep master @a ~ ~ ~ 0.2 1.4
				} 
				execute unless score a ak.collide matches 1 if score a ak.wasd matches 1 run{
					execute at @s run tp @s ^0.2 ^ ^ ~ ~
				}
				execute unless score d ak.collide matches 1 if score d ak.wasd matches 1 run{
					execute at @s run tp @s ^-0.2 ^ ^ ~ ~
				}
				execute unless score w ak.collide matches 1 if score w ak.wasd matches 1 run{
					scoreboard players add @s[scores={ak.speed=..37}] ak.speed 2
				}
				execute unless score s ak.collide matches 1 if score s ak.wasd matches 1 run{
					scoreboard players remove @s[scores={ak.speed=-37..}] ak.speed 2
				}

				# make speed absolute so sound control works in reverse as well
				scoreboard players operation #tempspeed ak.var = @s ak.speed
				execute if score #tempspeed ak.var matches ..-1 run scoreboard players operation #tempspeed ak.var *= #-1 ak.var
				execute if score @s ak.lastSpeed matches ..-1 run scoreboard players operation @s ak.lastSpeed *= #-1 ak.var

				# what to do when accelerating
				execute if score #tempspeed ak.var > @s ak.lastSpeed unless score #tempspeed ak.var matches 38.. run{
					# add tag so slow down sound only plays after acceleration
					tag @s add maver.notslower
					# splitting up sounds to make cutting out better
					execute unless score @s ak.sound.maver_faster matches 1.. run playsound minecraft:titan.maver.faster.1 master @a ~ ~ ~ 0.3
					execute unless score @s ak.sound.maver_faster matches 1.. run scoreboard players set @s ak.sound.maver_faster 110
					schedule 1t replace{
						scoreboard players remove @e[type=marker,scores={ak.sound.maver_faster=1..}] ak.sound.maver_faster 1
						LOOP(7,i){
							execute at @e[type=marker,scores={ak.sound.maver_faster=<%110-(i+1)*12%>}] run playsound minecraft:titan.maver.faster.<%i+2%> master @a ~ ~ ~ 0.3
						}
						execute if entity @e[type=marker,scores={ak.sound.maver_faster=1..}] run schedule function $block 1t replace
					}
				}
				# what to do when deaccelerating
				execute if entity @s[tag=maver.notslower] if score #tempspeed ak.var <= @s ak.lastSpeed if score w ak.wasd matches 0 if score s ak.wasd matches 0 run{
					tag @s remove maver.notslower
					execute unless score @s ak.sound.maver_slower matches 1.. run playsound minecraft:titan.maver.slower master @a ~ ~ ~ 0.4
					execute unless score @s ak.sound.maver_slower matches 1.. run scoreboard players set @s ak.sound.maver_faster 0
					execute unless score @s ak.sound.maver_slower matches 1.. run scoreboard players set @s ak.sound.maver_slower 60
					schedule 1t replace{
						scoreboard players remove @e[type=marker,scores={ak.sound.maver_slower=1..}] ak.sound.maver_slower 1
						execute if entity @e[type=marker,scores={ak.sound.maver_slower=1..}] run schedule function $block 1t replace
					}
				}
				# reach topspeed so cant accelerate anymore so play ambient sound
				execute if score #tempspeed ak.var matches 34.. run{
					tag @s add maver.notslower
					execute unless score @s ak.sound.maver_ambient matches 1.. run playsound minecraft:titan.maver.ambient master @a ~ ~ ~ 0.4
					execute unless score @s ak.sound.maver_ambient matches 1.. run scoreboard players set @s ak.sound.maver_ambient 35
					schedule 1t replace{
						scoreboard players remove @e[type=marker,scores={ak.sound.maver_ambient=1..}] ak.sound.maver_ambient 1
						execute if entity @e[type=marker,scores={ak.sound.maver_ambient=1..}] run schedule function $block 1t replace
					}
				}
				# acceleration
				execute at @s run{
					BST(@s ak.speed, -60, 60, i) run{
						tp @s ^ ^ ^<%i/60%> ~ ~
					}
				}
				execute if entity @s[tag=!aj.anim.isPlaying] run{
					tag @s remove ak.isAnim
					
					# playsound minecraft:titan.maver.ambient master @a
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

advancement enter_titan{
    "display": {
        "title": {
            "text": "Quite Comfy",
            "color": "green"
        },
        "description": {
            "text": "Enter a Turtler titan for the first time",
            "color": "aqua"
        },
        "icon": {
            "item": "minecraft:command_block",
            "nbt": "{CustomModelData:1}"
        },
        "frame": "task",
        "show_toast": true,
        "announce_to_chat": true,
        "hidden": true,
        "background": "minecraft:textures/gui/advancements/backgrounds/stone.png"
    },
    "criteria": {
        "impossible": {
            "trigger": "minecraft:impossible"
        }
    },
    "requirements": [
        [
            "impossible"
        ]
    ]
}