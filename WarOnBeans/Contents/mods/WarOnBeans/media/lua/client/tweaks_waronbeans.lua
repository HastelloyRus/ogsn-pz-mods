-- if getActivatedMods():contains("ItemTweakerAPI") then
require("ItemTweaker_Copy_ogsn");
-- else return end

-- TweakItem("Base.Needle","Icon", "Worm");
-- TweakItem("Base.Needle","Tooltip", "Wearable: Waist");
-- TweakItem("Base.Needle","DisplayCategory", "Repair");

TweakItem("Base.BeanBowl","UnhappyChange","-5");

TweakItem("Base.OpenBeans","FoodType","Vegetables");
TweakItem("Base.OpenBeans","UnhappyChange","0");
TweakItem("Base.OpenBeans","EvolvedRecipe","Soup:25;Stew:25;Pie:25;Stir fry:25;Stir fry Griddle Pan:25;Roasted Vegetables:25;Salad:25;RicePan:25;RicePot:25");