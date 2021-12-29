
--DeathKnightGlyphs Class--
local _DeathKnightGlyphs = {id = 0, name = 0};

function _DeathKnightGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create DeathKnightGlyphs--
local antimagic_shell = _DeathKnightGlyphs:New(nil, 1,"Glyph of Anti-Magic Shell");
local blood_strike = _DeathKnightGlyphs:New(nil, 2,"Glyph of Blood Strike");
local bone_shield = _DeathKnightGlyphs:New(nil, 3,"Glyph of Bone Shield");
local chains_of_ice = _DeathKnightGlyphs:New(nil, 4,"Glyph of Chains of Ice");
local dancing_rune_weapon = _DeathKnightGlyphs:New(nil, 5,"Glyph of Dancing Rune Weapon");
local dark_command = _DeathKnightGlyphs:New(nil, 6,"Glyph of Dark Command");
local dark_death = _DeathKnightGlyphs:New(nil, 7,"Glyph of Dark Death");
local death_and_decay = _DeathKnightGlyphs:New(nil, 8,"Glyph of Death and Decay");
local death_grip = _DeathKnightGlyphs:New(nil, 9,"Glyph of Death Grip");
local death_strike = _DeathKnightGlyphs:New(nil, 10,"Glyph of Death Strike");
local disease = _DeathKnightGlyphs:New(nil, 11,"Glyph of Disease");
local frost_strike = _DeathKnightGlyphs:New(nil, 12,"Glyph of Frost Strike");
local heart_strike = _DeathKnightGlyphs:New(nil, 13,"Glyph of Heart Strike");
local howling_blast = _DeathKnightGlyphs:New(nil, 14,"Glyph of Howling Blast");
local hungering_cold = _DeathKnightGlyphs:New(nil, 15,"Glyph of Hungering Cold");
local icebound_fortitude = _DeathKnightGlyphs:New(nil, 16,"Glyph of Icebound Fortitude");
local icy_touch = _DeathKnightGlyphs:New(nil, 17,"Glyph of Icy Touch");
local obliterate = _DeathKnightGlyphs:New(nil, 18,"Glyph of Obliterate");
local plague_strike = _DeathKnightGlyphs:New(nil, 19,"Glyph of Plague Strike");
local rune_strike = _DeathKnightGlyphs:New(nil, 20,"Glyph of Rune Strike");
local rune_tap = _DeathKnightGlyphs:New(nil, 21,"Glyph of Rune Tap");
local scourge_strike = _DeathKnightGlyphs:New(nil, 22,"Glyph of Scourge Strike");
local strangulate = _DeathKnightGlyphs:New(nil, 23,"Glyph of Strangulate");
local the_ghoul = _DeathKnightGlyphs:New(nil, 24,"Glyph of the Ghoul");
local unbreakable_armor = _DeathKnightGlyphs:New(nil, 25,"Glyph of Unbreakable Armor");
local unholy_blight = _DeathKnightGlyphs:New(nil, 26,"Glyph of Unholy Blight");
local vampiric_blood = _DeathKnightGlyphs:New(nil, 27,"Glyph of Vampiric Blood");
local blood_tap = _DeathKnightGlyphs:New(nil, 28,"Glyph of Blood Tap");
local corpse_explosion = _DeathKnightGlyphs:New(nil, 29,"Glyph of Corpse Explosion");
local deaths_embrace = _DeathKnightGlyphs:New(nil, 30,"Glyph of Death's Embrace");
local horn_of_winter = _DeathKnightGlyphs:New(nil, 31,"Glyph of Horn of Winter");
local pestilence = _DeathKnightGlyphs:New(nil, 32,"Glyph of Pestilence");
local raise_dead = _DeathKnightGlyphs:New(nil, 33,"Glyph of Raise Dead");

--Populate deathKnightGlyphs table--
local deathKnightGlyphs = {
	antimagic_shell,
	blood_strike,
	bone_shield,
	chains_of_ice,
	dancing_rune_weapon,
	dark_command,
	dark_death,
	death_and_decay,
	death_grip,
	death_strike,
	disease,
	frost_strike,
	heart_strike,
	howling_blast,
	hungering_cold,
	icebound_fortitude,
	icy_touch,
	obliterate,
	plague_strike,
	rune_strike,
	rune_tap,
	scourge_strike,
	strangulate,
	the_ghoul,
	unbreakable_armor,
	unholy_blight,
	vampiric_blood,
	blood_tap,
	corpse_explosion,
	deaths_embrace,
	horn_of_winter,
	pestilence,
	raise_dead	
};

function GetDeathKnightGlyphs()
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
	for j=1,#deathKnightGlyphs do
	for i=1,6 do 
		if glyph[i] == deathKnightGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end