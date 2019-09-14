

--Mostly copied from the riventest mod with the linking book
local function can_edit(meta, player)
	if meta:get_string("owner") == '' then
		meta:set_string("owner", player:get_player_name())
	elseif meta:get_string("owner") ~= player:get_player_name() then
		return false
	end
	return true
end


minetest.register_node("portal:portalslope", {
	description = "Portal Slope",
	paramtype = "light",
  paramtype2 = "facedir",
  drawtype = "mesh",
  mesh = "slope.obj",
	paramtype = "light",
	light_source = 3,
  sunlight_propagates = true,
	diggable = true,
	drop = '',
	tiles = {{
		name = "red2.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 2.0,
		},
  }},
	buildable_to = true,
  selection_box = {
    type = "fixed",
    fixed = {
      {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
      {-0.5, 0, 0, 0.5, 0.5, 0.5},
    },
  },
  collision_box = {
    type = "fixed",
    fixed = {
      {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
      {-0.5, 0, 0, 0.5, 0.5, 0.5},
    },
  },
	use_texture_alpha = true,
	pointable = true,
	is_ground_content = false,
	walkable = false,


 on_walk_over = function(pos, node, puncher)
   local timer = minetest.get_node_timer(pos)
   timer:start(2)
           		local meta =  minetest.get_meta(pos)
           		local player = puncher:get_player_name()
           		local stringpos = meta:get_string("location")
           		local p = {}
           		p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
           		if p.x and p.y and p.z then
                destination = minetest.string_to_pos(stringpos)
           			teleporiventeste =  minetest.get_player_by_name(player)
           			teleporiventeste:setpos(destination)

           		end
           	end,

            on_receive_fields = function(pos, formname, fields, sender)
          		local meta =  minetest.get_meta(pos)
          		local sender_name = sender:get_player_name()

          		if not can_edit(meta, sender) then
          			minetest.chat_send_player(sender_name, "You cannot edit that portal!")
          		return end

          		meta:set_string("infotext", fields.portalname)
          		meta:set_string("location", fields.location)
          	end,

           	after_place_node = function(pos, placer)
           		local meta =  minetest.get_meta(pos)
           		meta:set_string("owner", placer:get_player_name() or "")
           	end,



  on_construct = function(pos, player)
    local timer = minetest.get_node_timer(pos)
    timer:start(2)

      local meta =  minetest.get_meta(pos)
      meta:set_string("formspec", "size[8,3;]"..
        "field[0.256,0.5;8,1;portalname;Portal Name:;]"..
        "field[0.256,1.5;8,1;location;Coordinates X,Y,Z:;]"..
        "button_exit[3.3,2.5;2,1;button;Write]")
      meta:set_string("infotext", "Portal")
      meta:set_string("owner", player)
      meta:set_string("form", "yes")
      end,
 on_timer = function(pos)
  minetest.add_particlespawner({
      amount = 30,
      time = 2,
      minpos = {x=pos.x,y=pos.y-.5,z=pos.z-.5},
      maxpos = {x=pos.x,y=pos.y+.5,z=pos.z+math.random(-.5, .5)},
      minvel = {x = -.2, y = -.2, z = -.2},
      maxvel = {x = .2, y = .2, z = .2},
      minacc = {x = -.2, y = -.1, z = -.1},
      maxacc = {x = .2, y = .1, z = .1},
      minexptime = 2,
      maxexptime = 2,
      vertical = true,
      glow = 4,
      minsize = 1,
      maxsize = 2,
      texture = "red2.png",
      collisiondetection = true
})
return true end,

}
)
minetest.register_node("portal:portalblock", {
	description = "Portal Block",
  paramtype2 = "facedir",
  drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"red2.png"},
	paramtype = "light",
	light_source = 3,
  sunlight_propagates = true,
	diggable = true,
	drop = '',
	tiles = {{
		name = "red2.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 2.0,
		},
  }},
	buildable_to = true,
	use_texture_alpha = true,
	pointable = true,
	is_ground_content = false,
	walkable = false,


 on_walk_over = function(pos, node, puncher)
   local timer = minetest.get_node_timer(pos)
   timer:start(2)
           		local meta =  minetest.get_meta(pos)
           		local player = puncher:get_player_name()
           		local stringpos = meta:get_string("location")
           		local p = {}
           		p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
           		if p.x and p.y and p.z then
                destination = minetest.string_to_pos(stringpos)
           			teleporiventeste =  minetest.get_player_by_name(player)
           			teleporiventeste:setpos(destination)

           		end
           	end,

      on_receive_fields = function(pos, formname, fields, sender)
          		local meta =  minetest.get_meta(pos)
          		local sender_name = sender:get_player_name()

          		if not can_edit(meta, sender) then
          			minetest.chat_send_player(sender_name, "You cannot edit that portal!")
          		return end

          		meta:set_string("infotext", fields.portalname)
          		meta:set_string("location", fields.location)
          	end,
     	after_place_node = function(pos, placer)
           		local meta =  minetest.get_meta(pos)
           		meta:set_string("owner", placer:get_player_name() or "")
           	end,



  on_construct = function(pos, player)
    local timer = minetest.get_node_timer(pos)
    timer:start(2)

      local meta =  minetest.get_meta(pos)
      meta:set_string("formspec", "size[8,3;]"..
        "field[0.256,0.5;8,1;portalname;Portal Name:;]"..
        "field[0.256,1.5;8,1;location;Coordinates X,Y,Z:;]"..
        "button_exit[3.3,2.5;2,1;button;Write]")
      meta:set_string("infotext", "Portal")
      meta:set_string("owner", player)
      meta:set_string("form", "yes")
      end,
 on_timer = function(pos)
  minetest.add_particlespawner({
      amount = 30,
      time = 2,
      minpos = {x=pos.x,y=pos.y-.5,z=pos.z-.5},
      maxpos = {x=pos.x,y=pos.y+.5,z=pos.z+math.random(-.5, .5)},
      minvel = {x = -.2, y = -.2, z = -.2},
      maxvel = {x = .2, y = .2, z = .2},
      minacc = {x = -.2, y = -.1, z = -.1},
      maxacc = {x = .2, y = .1, z = .1},
      minexptime = 2,
      maxexptime = 2,
      vertical = true,
      glow = 4,
      minsize = 1,
      maxsize = 2,
      texture = "red2.png",
      collisiondetection = true
})
return true end,

}
)










minetest.register_globalstep(function(dtime)
	local time = os.time()
	for _, player in pairs(minetest.get_connected_players()) do
		-- Check node the player is standing on and run callbacks
		local ppos = player:getpos()
		local pos = vector.round(ppos)
		if ppos.y - pos.y <= 0.1 then
			local pos1 = vector.new(pos)
			--local pos2 = vector.new(pos)
			--pos2.y = pos2.y - 1
			local node1 = minetest.get_node(pos1)
			if minetest.registered_nodes[node1.name] and minetest.registered_nodes[node1.name].on_walk_over then
				minetest.registered_nodes[node1.name].on_walk_over(pos1, node1, player)
			end
			--local node2 = minetest.get_node(pos2)
			--if minetest.registered_nodes[node2.name] and minetest.registered_nodes[node2.name].on_walk_over then
			--	minetest.registered_nodes[node2.name].on_walk_over(pos2, node2, player)
			--end
		end
  end
end
)
