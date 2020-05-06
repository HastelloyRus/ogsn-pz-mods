-- Events.OnInitWorld.Add(
--   function()
--     -- print('OnInitWorld: ThePlummetingFog enabled')
--   end
-- );


local clim = getClimateManager();
 local FLOAT_FOG_INTENSITY = 5;
local  fog = clim:getClimateFloat(FLOAT_FOG_INTENSITY);
local starting_fog = 0.3      -- starting density (it is okay if this is lower than min_fog)
local max_fog = 1
local min_fog = 0.3
local lumosity = 1            --
local adminTrueOverrideFalse = true -- admin only accepts strength, override also accepts lumosity

local fog_strength = starting_fog

local function getNewFogStrength(old_strength)
    local max = max_fog
    local min = min_fog
    local new_strength = (ZombRand(min,max)+ZombRand(min,max))/2

    if new_strength == max or new_strength == min then
      fog_strength = new_strength -- on rare occasion it will get suddenly really clear or totally fogg
    else
      local df = new_strength - old_strength
      if df > 0 then
        fog_strength = math.min(old_strength+0.1,max)  -- trends up, unless it's already at full power
      else
        fog_strength = math.max(old_strength-0.1,min)  -- trends down, unless it's already at min power
      end
    end
    return fog_strength
end

local function updateFog(old_strength,lum)
  local f_strength = getNewFogStrength(fog_strength)
  if adminTrueOverrideFalse then
    fog:setEnableAdmin(true);
    fog:setEnableOverride(false);
    fog:setAdminValue(f_strength);
  else
    fog:setEnableAdmin(false);
    fog:setEnableOverride(true);
    fog:setOverride(f_lumosity,f_strength);
  end
end


Events.OnGameStart.Add(
  function()
    clim:getClimateFloat(FLOAT_FOG_INTENSITY):setEnableAdmin(true);
    clim:getClimateFloat(FLOAT_FOG_INTENSITY):setAdminValue(1);
--             clim:getClimateFloat(FLOAT_FOG_INTENSITY):setAdminValue(val);
--     -- print('OnGameStart: ThePlummetingFog enabled')
  end
);

Events.OnInitSeasons.Add(
  function(_season)
      -- print('OnInitSeasons: ThePlummetingFog enabled')
          _season:init(
              _season:getLat(), --aprox miami florida
              _season:getTempMin(), --min
              _season:getTempMax(), --max
              _season:getTempDiff(), --amount of degrees temp can go lower or higher then mean
              _season:getSeasonLag(),
              _season:getHighNoon(),
              _season:getSeedA(),
              _season:getSeedB(),
              _season:getSeedC()
          );
  end
);

-- Events.EveryTenMinutes.Add(
--   function()
--     -- print('EveryTenMinutes: ThePlummetingFog enabled')
--   end
-- );

-- Events.EveryDays.Add(
--   function()
--     -- print('EveryDays: ThePlummetingFog enabled')
--   end
-- );


-- from AdminPanel/ISAdmPanelClimate
-- local FLOAT_CLOUD_INTENSITY = 8;
-- ...
-- local clim = getClimateManager();
-- ...
-- elseif _tickbox.customData == "Fog" then
--         if clim:getClimateFloat(FLOAT_FOG_INTENSITY):isEnableAdmin() then
--             clim:getClimateFloat(FLOAT_FOG_INTENSITY):setEnableAdmin(false);
--         else
--             local val = self.sliderFogSlider:getCurrentValue();
--             clim:getClimateFloat(FLOAT_FOG_INTENSITY):setEnableAdmin(true);
--             clim:getClimateFloat(FLOAT_FOG_INTENSITY):setAdminValue(val);
--         end
