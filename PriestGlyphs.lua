
--PriestGlyphs Class--
local _PriestGlyphs = {id = 0, name = 0};

function _PriestGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create PriestGlyphs--
local circle_of_healing = _PriestGlyphs:New(nil, 1,"Glyph of Circle of Healing");
local dispel_magic = _PriestGlyphs:New(nil, 2,"Glyph of Dispel Magic");
local dispersion = _PriestGlyphs:New(nil, 3,"Glyph of Dispersion");
local fade = _PriestGlyphs:New(nil, 4,"Glyph of Fade");
local fear_ward = _PriestGlyphs:New(nil, 5,"Glyph of Fear Ward");
local flash_heal = _PriestGlyphs:New(nil, 6,"Glyph of Flash Heal");
local guardian_spirit = _PriestGlyphs:New(nil, 7,"Glyph of Guardian Spirit");
local holy_nova = _PriestGlyphs:New(nil, 8,"Glyph of Holy Nova");
local hymn_of_hope = _PriestGlyphs:New(nil, 9,"Glyph of Hymn of Hope");
local inner_fire = _PriestGlyphs:New(nil, 10,"Glyph of Inner Fire");
local lightwell = _PriestGlyphs:New(nil, 11,"Glyph of Lightwell");
local mass_dispel = _PriestGlyphs:New(nil, 12,"Glyph of Mass Dispel");
local mind_control = _PriestGlyphs:New(nil, 13,"Glyph of Mind Control");
local mind_flay = _PriestGlyphs:New(nil, 14,"Glyph of Mind Flay");
local mind_sear = _PriestGlyphs:New(nil, 15,"Glyph of Mind Sear");
local pain_suppression = _PriestGlyphs:New(nil, 16,"Glyph of Pain Suppression");
local penance = _PriestGlyphs:New(nil, 17,"Glyph of Penance");
local power_word_shield = _PriestGlyphs:New(nil, 18,"Glyph of Power Word: Shield");
local prayer_of_healing = _PriestGlyphs:New(nil, 19,"Glyph of Prayer of Healing");
local psychic_scream = _PriestGlyphs:New(nil, 20,"Glyph of Psychic Scream");
local renew = _PriestGlyphs:New(nil, 21,"Glyph of Renew");
local scourge_imprisonment = _PriestGlyphs:New(nil, 22,"Glyph of Scourge Imprisonment");
local shadow = _PriestGlyphs:New(nil, 23,"Glyph of Shadow");
local shadow_word_death = _PriestGlyphs:New(nil, 24,"Glyph of Shadow Word: Death");
local shadow_word_pain = _PriestGlyphs:New(nil, 25,"Glyph of Shadow Word: Pain");
local smite = _PriestGlyphs:New(nil, 26,"Glyph of Smite");
local spirit_of_redemption = _PriestGlyphs:New(nil, 27,"Glyph of Spirit of Redemption");
local fading = _PriestGlyphs:New(nil, 28,"Glyph of Fading");
local fortitude = _PriestGlyphs:New(nil, 29,"Glyph of Fortitude");
local levitate = _PriestGlyphs:New(nil, 30,"Glyph of Levitate");
local shackle_undead = _PriestGlyphs:New(nil, 31,"Glyph of Shackle Undead");
local shadow_protection = _PriestGlyphs:New(nil, 32,"Glyph of Shadow Protection");
local shadowfiend = _PriestGlyphs:New(nil, 33,"Glyph of Shadowfiend");

--Populate priestGlyphs table--
local priestGlyphs = {
   circle_of_healing,
   dispel_magic,
   dispersion,
   fade,
   fear_ward,
   flash_heal,
   guardian_spirit,
   holy_nova,
   hymn_of_hope,
   inner_fire,
   lightwell,
   mass_dispel,
   mind_control,
   mind_flay,
   mind_sear,
   pain_suppression,
   penance,
   power_word_shield,
   prayer_of_healing,
   psychic_scream,
   renew,
   scourge_imprisonment,
   shadow,
   shadow_word_death,
   shadow_word_pain,
   smite,
   spirit_of_redemption,
   fading,
   fortitude,
   levitate,
   shackle_undead,
   shadow_protection,
   shadowfiend
};

function GetPriestGlyphs()
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
	for j=1,#priestGlyphs do
	for i=1,6 do 
		if glyph[i] == priestGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end
