--PR to "lib/managers/playermanager"
_originalUpgrade = _originalUpgrade or PlayerManager.upgrade_value
function PlayerManager:upgrade_value( category, upgrade, default )
	if category == "player" and upgrade == "passive_dodge_chance" then
		return 0.3 --30%
	elseif category == "player" and upgrade == "run_dodge_chance" then
		return 0.75 --65% while sprinting	
	elseif category == "player" and upgrade == "crouch_dodge_chance" then
		return 0.85  --45% while crouching
	else
		return _originalUpgrade(self, category, upgrade, default)
	end
end