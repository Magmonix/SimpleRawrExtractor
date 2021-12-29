
--PaladinGlyphs Class--
local _PaladinGlyphs = {id = 0, name = 0};

function _PaladinGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create PaladinGlyphs--
local avenging_wrath = _PaladinGlyphs:New(nil, 1,"Glyph of Avenging Wrath");
local avengers_shield = _PaladinGlyphs:New(nil, 2,"Glyph of Avenger's Shield");
local seal_of_blood = _PaladinGlyphs:New(nil, 3,"Glyph of Seal of Blood");
local seal_of_righteousness = _PaladinGlyphs:New(nil, 4,"Glyph of Seal of Righteousness");
local seal_of_vengeance = _PaladinGlyphs:New(nil, 5,"Glyph of Seal of Vengeance");
local hammer_of_wrath = _PaladinGlyphs:New(nil, 6,"Glyph of Hammer of Wrath");
local beacon_of_light = _PaladinGlyphs:New(nil, 7,"Glyph of Beacon of Light");
local divine_plea = _PaladinGlyphs:New(nil, 8,"Glyph of Divine Plea");
local divine_storm = _PaladinGlyphs:New(nil, 9,"Glyph of Divine Storm");
local hammer_of_the_righteous = _PaladinGlyphs:New(nil, 10,"Glyph of Hammer of the Righteous");
local holy_shock = _PaladinGlyphs:New(nil, 11,"Glyph of Holy Shock");
local salvation = _PaladinGlyphs:New(nil, 12,"Glyph of Salvation");
local shield_of_righteousness = _PaladinGlyphs:New(nil, 13,"Glyph of Shield of Righteousness");
local seal_of_wisdom = _PaladinGlyphs:New(nil, 14,"Glyph of Seal of Wisdom");
local cleansing = _PaladinGlyphs:New(nil, 15,"Glyph of Cleansing");
local seal_of_light = _PaladinGlyphs:New(nil, 16,"Glyph of Seal of Light");
local the_wise = _PaladinGlyphs:New(nil, 17,"Glyph of the Wise");
local turn_evil = _PaladinGlyphs:New(nil, 18,"Glyph of Turn Evil");
local consecration = _PaladinGlyphs:New(nil, 19,"Glyph of Consecration");
local crusader_strike = _PaladinGlyphs:New(nil, 20,"Glyph of Crusader Strike");
local exorcism = _PaladinGlyphs:New(nil, 21,"Glyph of Exorcism");
local flash_of_light = _PaladinGlyphs:New(nil, 22,"Glyph of Flash of Light");
local seal_of_command = _PaladinGlyphs:New(nil, 23,"Glyph of Seal of Command");
local blessing_of_kings = _PaladinGlyphs:New(nil, 24,"Glyph of Blessing of Kings");
local sense_undead = _PaladinGlyphs:New(nil, 25,"Glyph of Sense Undead");
local righteous_defense = _PaladinGlyphs:New(nil, 26,"Glyph of Righteous Defense");
local spiritual_attunement = _PaladinGlyphs:New(nil, 27,"Glyph of Spiritual Attunement");
local divinity = _PaladinGlyphs:New(nil, 28,"Glyph of Divinity");
local blessing_of_wisdom = _PaladinGlyphs:New(nil, 29,"Glyph of Blessing of Wisdom");
local hammer_of_justice = _PaladinGlyphs:New(nil, 30,"Glyph of Hammer of Justice");
local lay_on_hands = _PaladinGlyphs:New(nil, 31,"Glyph of Lay on Hands");
local judgement = _PaladinGlyphs:New(nil, 32,"Glyph of Judgement");
local holy_light = _PaladinGlyphs:New(nil, 33,"Glyph of Holy Light");
local blessing_of_might = _PaladinGlyphs:New(nil, 34,"Glyph of Blessing of Might");

--Populate paladinGlyphs table--
local paladinGlyphs = {
   avenging_wrath,
   avengers_shield,
   seal_of_blood,
   seal_of_righteousness,
   seal_of_vengeance,
   hammer_of_wrath,
   beacon_of_light,
   divine_plea,
   divine_storm,
   hammer_of_the_righteous,
   holy_shock,
   salvation,
   shield_of_righteousness,
   seal_of_wisdom,
   cleansing,
   seal_of_light,
   the_wise,
   turn_evil,
   consecration,
   crusader_strike,
   exorcism,
   flash_of_light,
   seal_of_command,
   blessing_of_kings,
   sense_undead,
   righteous_defense,
   spiritual_attunement,
   divinity,
   blessing_of_wisdom,
   hammer_of_justice,
   lay_on_hands,
   judgement,
   holy_light,
   blessing_of_might
};

function GetPaladinGlyphs()
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
	for j=1,#paladinGlyphs do
	for i=1,6 do 
		if glyph[i] == paladinGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end
