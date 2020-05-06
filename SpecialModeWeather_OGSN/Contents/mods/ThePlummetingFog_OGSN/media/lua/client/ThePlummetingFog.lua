-- Events.OnInitWorld.Add(
--   function()
--     -- print('OnInitWorld: ThePlummetingFog enabled')
--   end
-- );


local clim = getClimateManager();
 local FLOAT_FOG_INTENSITY = 5;
local  fog = clim:getClimateFloat(FLOAT_FOG_INTENSITY);
local function getFogStrength() return 1 end

adminTrueOverrideFalse = true -- admin only accepts strength, override also accepts lumosity
local f_strength = getFogStrength()          -- density, how much
local f_lumosity = 1          -- lightness, seems to want to be 1 (100%)

if adminTrueOverrideFalse then
  fog:setEnableAdmin(true);
  fog:setEnableOverride(false);
  fog:setAdminValue(f_strength);
else
  fog:setEnableAdmin(false);
  fog:setEnableOverride(true);
  fog:setOverride(f_lumosity,f_strength);
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
