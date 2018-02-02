-- thanks to darkfrei
-- https://mods.factorio.com/mods/darkfrei/BurntExtractor

script.on_event(defines.events.on_tick, function(event)
  on_tick_holder()
end)

script.on_event(defines.events.on_built_entity, function(event)
  on_place_holder(event.created_entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  on_place_holder(event.created_entity)
end)

function on_place_holder(entity)
  if entity.name ~= "ash-remover" then return end
  
  if not global.inserters then
    global.inserters = {}
  end
  -- local element = {index = #global.inserters+1, entity=entity}
  table.insert(global.inserters, entity)
  -- entity.active = false
  --check_inserter(entity)
end

function on_tick_holder()
  if global.inserters == nil then return end
  if global.inserters_index == nil then
    global.inserters_index = 1
  end
  local inserters_index = global.inserters_index
  -- if global.inserters[inserters_index] == nil then return end
  
  -- not more then one inserter pro tick
  local entity = global.inserters[inserters_index]
  if is_valid(entity) then
    check_inserter(entity)
  else 
    return
  end
  
  if inserters_index >= #global.inserters then
    global.inserters_index = 1
  else 
    -- on next tick process next inserter
    global.inserters_index = inserters_index + 1
  end
end

function check_inserter(inserter)
  local drop_target = inserter.drop_target
  if drop_target == nil then return end
  local pickup_target = inserter.pickup_target
  if pickup_target == nil then return end
  local burnt_result_inventory = pickup_target.get_burnt_result_inventory()
  if burnt_result_inventory == nil then return end
  if burnt_result_inventory.is_empty() then return end
    
  local fuel_item_name
  local contents = burnt_result_inventory.get_contents()
  -- printAll(serpent.block(contents, {comment = false}))
  -- log(serpent.block(contents, {comment = false}))
    
  for item_name, count in pairs (contents) do
    fuel_item_name = item_name
  end

  if inserter.get_item_count() < 1 then
    if inserter.held_stack.valid_for_read == false then           
      if pickup_target.get_item_count(fuel_item_name) > 0 then                 
        inserter.held_stack.set_stack({name = fuel_item_name, count = 1})		
        pickup_target.remove_item({name = fuel_item_name, count = 1})
        return
      end
    end
  end
end

function is_valid(entity)
  if entity and entity.valid then
    return true
  else
    -- delete from global
    table.remove(global.inserters, global.inserters_index) 
    global.inserters_index = global.inserters_index-1
    return false
  end
end

function teleport_stack(inserter_held_stack, burnt_result_inventory, fuel_item_name)
  inserter_held_stack.set_stack({name = fuel_item_name, count = 1})		
  pickup_target.remove_item({name = fuel_item_name, count = 1})
end

function printAll(text)
	log (text)
	for player_index, player in pairs (game.players) do
		game.players[player_index].print (text)
	end
end