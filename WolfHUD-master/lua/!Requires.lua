-- Requires
function inGame()
	if not game_state_machine then return false end
	return string.find(game_state_machine:current_state_name(), "game")
end

function isPlaying()
	if not BaseNetworkHandler then
		return false
	end
	return
	BaseNetworkHandler._gamestate_filter.any_ingame_playing[game_state_machine:last_queued_state_name()]
end

function isHost()
	if not Network then return false end
	return not Network:is_client()
end

function isHostage(unit)
	if unit and alive(unit) and
		((unit.brain and unit:brain().is_hostage and unit:brain():is_hostage()) or
		(unit.anim_data and (unit:anim_data().tied or unit:anim_data().hands_tied))) then
	return true
	end
return false
end

function showHint(msg)
	if not managers or not managers.hud then return end
	managers.hud:show_hint({text = msg})
end