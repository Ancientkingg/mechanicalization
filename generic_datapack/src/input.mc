import ./macros/log.mcm

function load{
	scoreboard objectives add ak.wasd dummy
	scoreboard objectives add ak.math dummy

	scoreboard objectives add ak.constant dummy
	scoreboard players set #-46496 ak.constant -46496
	scoreboard players set #-1 ak.constant -1
	scoreboard players set #360 ak.constant 360
	scoreboard players set #1000 ak.constant 1000
	scoreboard players set #10000 ak.constant 10000
	scoreboard players set #57295 ak.constant 57295
	scoreboard players set #100000 ak.constant 100000
	scoreboard players set #1000000 ak.constant 1000000

}

function tick{
	execute as @e[type=#input:minecarts,tag=!invisible_minecart] run{
		data merge entity @s[type=minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"down"}},DisplayOffset:4}
		data merge entity @s[type=chest_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"up"}},DisplayOffset:4}
		data merge entity @s[type=furnace_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"north"}},DisplayOffset:4}
		data merge entity @s[type=tnt_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"south"}},DisplayOffset:4}
		data merge entity @s[type=hopper_minecart] {CustomDisplayTile:1,DisplayState:{Name:"minecraft:command_block",Properties:{conditional:"true",facing:"west"}},DisplayOffset:4}
		tag @s add invisible_minecart
	}
}


function calc_dir{
	data modify storage ak.wasd Motion set from entity @s Motion
	execute store result score x ak.wasd run data get storage ak.wasd Motion[0] 1000.0
	execute store result score z ak.wasd run data get storage ak.wasd Motion[2] 1000.0
	scoreboard players set w ak.wasd 0
	scoreboard players set a ak.wasd 0
	scoreboard players set s ak.wasd 0
	scoreboard players set d ak.wasd 0
	scoreboard players set dir ak.wasd 0
	execute if score z ak.wasd matches 0 if score x ak.wasd matches 0 run scoreboard players set dir ak.wasd -999
	execute unless score dir ak.wasd matches -999 run{
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

		## Map angle to the range 0..360
		scoreboard players operation dir ak.wasd %= #360 ak.constant

		## ak.wasd based on dir angle ranges
		execute if score dir ak.wasd matches 23..157 run scoreboard players set a ak.wasd 1
		execute if score dir ak.wasd matches 112..248 run scoreboard players set s ak.wasd 1
		execute if score dir ak.wasd matches 203..337 run scoreboard players set d ak.wasd 1
		execute if score dir ak.wasd matches 293..360 run scoreboard players set w ak.wasd 1
		execute if score dir ak.wasd matches 0..67 run scoreboard players set w ak.wasd 1

	}
}

dir inventory{
	function virtualize_inv{
		log INF virtualized player inventory
		execute unless score @s rx.pdb.has_entry matches 1 run function #rx.playerdb:api/v2/get/self
		data remove block <%config.shulker_xyz%> Items
		LOOP(27,i){
			item replace block <%config.shulker_xyz%> container.<%i%> from entity @s container.<%i+9%>
		}
		data modify storage rx.playerdb:io player.data.ak.inv.inventory set from block <%config.shulker_xyz%> Items
		data remove block <%config.shulker_xyz%> Items
		LOOP(9,i){
			item replace block <%config.shulker_xyz%> container.<%i%> from entity @s container.<%i%>
		}
		data modify storage rx.playerdb:io player.data.ak.inv.hotbar set from block <%config.shulker_xyz%> Items
		data remove block <%config.shulker_xyz%> Items
		item replace block <%config.shulker_xyz%> container.0 from entity @s weapon.offhand
		data modify storage rx.playerdb:io player.data.ak.inv.offhand set from block <%config.shulker_xyz%> Items
		function #rx.playerdb:api/v2/save/self
		clear @s
	}
	function devirtualize_inv{
		log INF devirtualized player inventory
		clear @s
		function #rx.playerdb:api/v2/get/self
		data remove block <%config.shulker_xyz%> Items
		data modify block <%config.shulker_xyz%> Items set from storage rx.playerdb:io player.data.ak.inv.inventory
		LOOP(27,i){
			item replace entity @s container.<%i+9%> from block <%config.shulker_xyz%> container.<%i%>
		}
		data remove block <%config.shulker_xyz%> Items
		data modify block <%config.shulker_xyz%> Items set from storage rx.playerdb:io player.data.ak.inv.hotbar
		LOOP(9,i){
			item replace entity @s container.<%i%> from block <%config.shulker_xyz%> container.<%i%>
		}
		data modify block <%config.shulker_xyz%> Items set from storage rx.playerdb:io player.data.ak.inv.offhand
		data remove block <%config.shulker_xyz%> Items
		item replace entity @s weapon.offhand from block <%config.shulker_xyz%> container.0
		function #rx.playerdb:api/v2/save/self
	}
}

entities minecarts{
	minecraft:minecart
	minecraft:chest_minecart
	minecraft:furnace_minecart
	minecraft:tnt_minecart
	minecraft:hopper_minecart
}

LOOP(9,i){
	predicate rclick<%i%>{
	  "condition": "minecraft:entity_properties",
	  "entity": "this",
	  "predicate": {
	    "equipment": {
	      "mainhand": {
	        "items": [
	          "minecraft:warped_fungus_on_a_stick"
	        ],
	        "nbt": "{titan.input:1b, CustomModelData:<%i+3%>}"
	      }
	    }
	  }
	}
}

predicate offhand{
	  "condition": "minecraft:entity_properties",
	  "entity": "this",
	  "predicate": {
	    "equipment": {
	      "offhand": {
	        "items": [
	          "minecraft:warped_fungus_on_a_stick"
	        ],
	        "nbt": "{titan.input:1b}"
	      }
	    }
	  }
	}