
--MageGlyphs Class--
local _MageGlyphs = {id = 0, name = 0};

function _MageGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create MageGlyphs--
local fireball = _MageGlyphs:New(nil, 1,"Glyph of Fireball");
local frostfire = _MageGlyphs:New(nil, 2,"Glyph of Frostfire");
local frostbolt = _MageGlyphs:New(nil, 3,"Glyph of Frostbolt");
local ice_armor = _MageGlyphs:New(nil, 4,"Glyph of Ice Armor");
local improved_scorch = _MageGlyphs:New(nil, 5,"Glyph of Improved Scorch");
local mage_armor = _MageGlyphs:New(nil, 6,"Glyph of Mage Armor");
local mana_gem = _MageGlyphs:New(nil, 7,"Glyph of Mana Gem");
local molten_armor = _MageGlyphs:New(nil, 8,"Glyph of Molten Armor");
local water_elemental = _MageGlyphs:New(nil, 9,"Glyph of Water Elemental");
local arcane_explosion = _MageGlyphs:New(nil, 10,"Glyph of Arcane Explosion");
local arcane_power = _MageGlyphs:New(nil, 11,"Glyph of Arcane Power");
local arcane_blast = _MageGlyphs:New(nil, 12,"Glyph of Arcane Blast");
local arcane_missiles = _MageGlyphs:New(nil, 13,"Glyph of Arcane Missiles");
local arcane_barrage = _MageGlyphs:New(nil, 14,"Glyph of Arcane Barrage");
local living_bomb = _MageGlyphs:New(nil, 15,"Glyph of Living Bomb");
local ice_lance = _MageGlyphs:New(nil, 16,"Glyph of Ice Lance");
local mirror_image = _MageGlyphs:New(nil, 17,"Glyph of Mirror Image");
local deep_freeze = _MageGlyphs:New(nil, 18,"Glyph of Deep Freeze");
local eternal_water = _MageGlyphs:New(nil, 19,"Glyph of Eternal Water");

--Populate mageGlyphs table--
local mageGlyphs = {
   fireball,
   frostfire,
   frostbolt,
   ice_armor,
   improved_scorch,
   mage_armor,
   mana_gem,
   molten_armor,
   water_elemental, 
   arcane_explosion,
   arcane_power,
   arcane_blast,
   arcane_missiles, 
   arcane_barrage,
   living_bomb,
   ice_lance,
   mirror_image,
   deep_freeze,
   eternal_water
};

function GetMageGlyphs()
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
	for j=1,#mageGlyphs do
	for i=1,6 do 
		if glyph[i] == mageGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end