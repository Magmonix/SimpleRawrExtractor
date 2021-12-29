
--WarlockGlyphs Class--
local _WarlockGlyphs = {id = 0, name = 0};

function _WarlockGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create WarlockGlyphs--
local chaos_bolt = _WarlockGlyphs:New(nil, 1,"Glyph of Chaos Bolt");
local conflagrate = _WarlockGlyphs:New(nil, 2,"Glyph of Conflagrate");
local corruption = _WarlockGlyphs:New(nil, 3,"Glyph of Corruption");
local curse_of_agony = _WarlockGlyphs:New(nil, 4,"Glyph of Curse of Agony");
local death_coil = _WarlockGlyphs:New(nil, 5,"Glyph of Death Coil");
local felguard = _WarlockGlyphs:New(nil, 6,"Glyph of Felguard");
local haunt = _WarlockGlyphs:New(nil, 7,"Glyph of Haunt");
local immolate = _WarlockGlyphs:New(nil, 8,"Glyph of Immolate");
local imp = _WarlockGlyphs:New(nil, 9,"Glyph of Imp");
local incinerate = _WarlockGlyphs:New(nil, 10,"Glyph of Incinerate");
local life_tap = _WarlockGlyphs:New(nil, 11,"Glyph of Life Tap");
local metamorphosis = _WarlockGlyphs:New(nil, 12,"Glyph of Metamorphosis");
local quick_decay = _WarlockGlyphs:New(nil, 13,"Glyph of Quick Decay");
local searing_pain = _WarlockGlyphs:New(nil, 14,"Glyph of Searing Pain");
local shadowbolt = _WarlockGlyphs:New(nil, 15,"Glyph of Shadowbolt");
local shadowburn = _WarlockGlyphs:New(nil, 16,"Glyph of Shadowburn");
local unstable_affliction = _WarlockGlyphs:New(nil, 17,"Glyph of Unstable Affliction");


--Populate warlockGlyphs table--
local warlockGlyphs = {
	chaos_bolt,
    conflagrate,
    corruption,
    curse_of_agony,
    death_coil,
    felguard,
    haunt,
    immolate,
    imp,
    incinerate,
    life_tap,
    metamorphosis,
    quick_decay,
    searing_pain,
    shadowbolt,
    shadowburn,
    unstable_affliction
};

function GetWarlockGlyphs()
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
	for j=1,#warlockGlyphs do
	for i=1,6 do 
		if glyph[i] == warlockGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end