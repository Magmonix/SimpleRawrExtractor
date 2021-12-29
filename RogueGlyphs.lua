
--RogueGlyphs Class--
local _RogueGlyphs = {id = 0, name = 0};

function _RogueGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create RogueGlyphs--
local backstab = _RogueGlyphs:New(nil, 1,"Glyph of Backstab");
local eviscerate = _RogueGlyphs:New(nil, 2,"Glyph of Eviscerate");
local mutilate = _RogueGlyphs:New(nil, 3,"Glyph of Mutilate");
local hunger_for_blood = _RogueGlyphs:New(nil, 4,"Glyph of Hunger For Blood");
local killing_spree = _RogueGlyphs:New(nil, 5,"Glyph of Killing Spree");
local vigor = _RogueGlyphs:New(nil, 6,"Glyph of Vigor");
local fan_of_knives = _RogueGlyphs:New(nil, 7,"Glyph of Fan of Knives");
local expose_armor = _RogueGlyphs:New(nil, 8,"Glyph of Expose Armor");
local sinister_strike = _RogueGlyphs:New(nil, 9,"Glyph of Sinister Strike");
local slice_and_dice = _RogueGlyphs:New(nil, 10,"Glyph of Slice and Dice");
local feint = _RogueGlyphs:New(nil, 11,"Glyph of Feint");
local ghostly_strike = _RogueGlyphs:New(nil, 12,"Glyph of Ghostly Strike");
local rupture = _RogueGlyphs:New(nil, 13,"Glyph of Rupture");
local blade_flurry = _RogueGlyphs:New(nil, 14,"Glyph of Blade Flurry");
local adrenaline_rush = _RogueGlyphs:New(nil, 15,"Glyph of Adrenaline Rush");
local evasion = _RogueGlyphs:New(nil, 16,"Glyph of Evasion");
local garrote = _RogueGlyphs:New(nil, 17,"Glyph of Garrote");
local gouge = _RogueGlyphs:New(nil, 18,"Glyph of Gouge");
local sap = _RogueGlyphs:New(nil, 19,"Glyph of Sap");
local sprint = _RogueGlyphs:New(nil, 20,"Glyph of Sprint");
local ambush = _RogueGlyphs:New(nil, 21,"Glyph of Ambush");
local crippling_poison = _RogueGlyphs:New(nil, 22,"Glyph of Crippling Poison");
local hemorrhage = _RogueGlyphs:New(nil, 23,"Glyph of Hemorrhage");
local preparation = _RogueGlyphs:New(nil, 24,"Glyph of Preparation");
local shadow_dance = _RogueGlyphs:New(nil, 25,"Glyph of Shadow Dance");
local deadly_throw = _RogueGlyphs:New(nil, 26,"Glyph of Deadly Throw");
local cloak_of_shadows = _RogueGlyphs:New(nil, 27,"Glyph of Cloak of Shadows");
local tricks_of_the_trade = _RogueGlyphs:New(nil, 28,"Glyph of Tricks of the Trade");
local blurred_speed = _RogueGlyphs:New(nil, 29,"Glyph of Blurred Speed");
local pick_pocket = _RogueGlyphs:New(nil, 30,"Glyph of Pick Pocket");
local pick_lock = _RogueGlyphs:New(nil, 31,"Glyph of Pick Lock");
local distract = _RogueGlyphs:New(nil, 32,"Glyph of Distract");
local vanish = _RogueGlyphs:New(nil, 33,"Glyph of Vanish");
local safe_fall = _RogueGlyphs:New(nil, 34,"Glyph of Safe Fall");

--Populate rogueGlyphs table--
local rogueGlyphs = {
   backstab,
   eviscerate,
   mutilate,
   hunger_for_blood,
   killing_spree,
   vigor,
   fan_of_knives,
   expose_armor,
   sinister_strike,
   slice_and_dice,
   feint,
   ghostly_strike,
   rupture,
   blade_flurry,
   adrenaline_rush,
   evasion,
   garrote,
   gouge,
   sap,
   sprint,
   ambush,
   crippling_poison,
   hemorrhage,
   preparation,
   shadow_dance,
   deadly_throw,
   cloak_of_shadows,
   tricks_of_the_trade,
   blurred_speed,
   pick_pocket,
   pick_lock,
   distract,
   vanish,
   safe_fall
};

function GetRogueGlyphs()
	local glyphBitString = {};
	local glyph = {};
	
	for i = 1, 6 do
	local enabled, glyphType, glyphTooltipIndex, glyphSpellID, icon = GetGlyphSocketInfo(i);
	if glyphTooltipIndex and (glyphType == 1 or glyphType == 2) then
		local link = GetSpellLink(glyphTooltipIndex);
		local _, _, Color, Ltype, Id, Enchant, Gem1, Gem2, Gem3, Gem4,Suffix, Unique, LinkLvl, Name = string.find(link,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?"); --I'm not a regex expert so I copied an example from the wiki
		glyph[i] = GetSpellInfo(Id);
	end
	end
	
	local glyphFound = false;
	local c = {};
	for j=1,#rogueGlyphs do
	for i=1,6 do 
		if glyph[i] == rogueGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end