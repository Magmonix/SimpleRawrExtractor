
--ShamanGlyphs Class--
local _ShamanGlyphs = {id = 0, name = 0};

function _ShamanGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create ShamanGlyphs--
local healing_wave = _ShamanGlyphs:New(nil, 1,"Glyph of Healing Wave");
local lightning_bolt = _ShamanGlyphs:New(nil, 2,"Glyph of Lightning Bolt");
local shocking = _ShamanGlyphs:New(nil, 3,"Glyph of Shocking");
local lightning_shield = _ShamanGlyphs:New(nil, 4,"Glyph of Lightning Shield");
local flame_shock = _ShamanGlyphs:New(nil, 5,"Glyph of Flame Shock");
local flametongue_weapon = _ShamanGlyphs:New(nil, 6,"Glyph of Flametongue Weapon");
local lava_lash = _ShamanGlyphs:New(nil, 7,"Glyph of Lava Lash");
local fire_nova = _ShamanGlyphs:New(nil, 8,"Glyph of Fire Nova");
local frost_shock = _ShamanGlyphs:New(nil, 9,"Glyph of Frost Shock");
local healing_stream_totem = _ShamanGlyphs:New(nil, 10,"Glyph of Healing Stream Totem");
local lesser_healing_wave = _ShamanGlyphs:New(nil, 11,"Glyph of Lesser Healing Wave");
local water_mastery = _ShamanGlyphs:New(nil, 12,"Glyph of Water Mastery");
local earthliving_weapon = _ShamanGlyphs:New(nil, 13,"Glyph of Earthliving Weapon");
local windfury_weapon = _ShamanGlyphs:New(nil, 14,"Glyph of Windfury Weapon");
local chain_lightning = _ShamanGlyphs:New(nil, 15,"Glyph of Chain Lightning");
local chain_heal = _ShamanGlyphs:New(nil, 16,"Glyph of Chain Heal");
local earth_shield = _ShamanGlyphs:New(nil, 17,"Glyph of Earth Shield");
local feral_spirit = _ShamanGlyphs:New(nil, 18,"Glyph of Feral Spirit");
local hex = _ShamanGlyphs:New(nil, 19,"Glyph of Hex");
local mana_tide_totem = _ShamanGlyphs:New(nil, 20,"Glyph of Mana Tide Totem");
local riptide = _ShamanGlyphs:New(nil, 21,"Glyph of Riptide");
local stoneclaw_totem = _ShamanGlyphs:New(nil, 22,"Glyph of Stoneclaw Totem");
local stormstrike = _ShamanGlyphs:New(nil, 23,"Glyph of Stormstrike");
local thunder = _ShamanGlyphs:New(nil, 24,"Glyph of Thunder");
local totem_of_wrath = _ShamanGlyphs:New(nil, 25,"Glyph of Totem of Wrath");
local elemental_mastery = _ShamanGlyphs:New(nil, 26,"Glyph of Elemental Mastery");
local lava = _ShamanGlyphs:New(nil, 27,"Glyph of Lava");
local fire_elemental_totem = _ShamanGlyphs:New(nil, 28,"Glyph of Fire Elemental Totem");
local thunderstorm = _ShamanGlyphs:New(nil, 29,"Glyph of Thunderstorm");

--Populate shamanGlyphs table--
local shamanGlyphs = {
   healing_wave,
   lightning_bolt,
   shocking,
   lightning_shield,
   flame_shock,
   flametongue_weapon,
   lava_lash,
   fire_nova,
   frost_shock,
   healing_stream_totem,
   lesser_healing_wave,
   water_mastery,
   earthliving_weapon,
   windfury_weapon,
   chain_lightning,
   chain_heal,
   earth_shield,
   feral_spirit,
   hex,
   mana_tide_totem,
   riptide,
   stoneclaw_totem,
   stormstrike,
   thunder,
   totem_of_wrath,
   elemental_mastery,
   lava,
   fire_elemental_totem,
   thunderstorm
};

function GetShamanGlyphs()
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
	for j=1,#shamanGlyphs do
	for i=1,6 do 
		if glyph[i] == shamanGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end
