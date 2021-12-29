
--DruidGlyphs Class--
local _DruidGlyphs = {id = 0, name = 0};

function _DruidGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create DruidGlyphs--
local mangle = _DruidGlyphs:New(nil, 1,"Glyph of Mangle");
local shred = _DruidGlyphs:New(nil, 2,"Glyph of Shred");
local rip = _DruidGlyphs:New(nil, 3,"Glyph of Rip");
local berserk = _DruidGlyphs:New(nil, 4,"Glyph of Berserk");
local savage_roar = _DruidGlyphs:New(nil, 5,"Glyph of Savage Roar");
local growl = _DruidGlyphs:New(nil, 6,"Glyph of Growl");
local maul = _DruidGlyphs:New(nil, 7,"Glyph of Maul");
local frenzied_regeneration = _DruidGlyphs:New(nil, 8,"Glyph of Frenzied Regeneration");
local focus = _DruidGlyphs:New(nil, 9,"Glyph of Focus");
local insect_swarm = _DruidGlyphs:New(nil, 10,"Glyph of Insect Swarm");
local monsoon = _DruidGlyphs:New(nil, 11,"Glyph of Monsoon");
local moonfire = _DruidGlyphs:New(nil, 12,"Glyph of Moonfire");
local starfall = _DruidGlyphs:New(nil, 13,"Glyph of Starfall");
local starfire = _DruidGlyphs:New(nil, 14,"Glyph of Starfire");
local wrath = _DruidGlyphs:New(nil, 15,"Glyph of Wrath");
local healing_touch = _DruidGlyphs:New(nil, 16,"Glyph of Healing Touch");
local innervate = _DruidGlyphs:New(nil, 17,"Glyph of Innervate");
local lifebloom = _DruidGlyphs:New(nil, 18,"Glyph of Lifebloom");
local nourish = _DruidGlyphs:New(nil, 19,"Glyph of Nourish");
local rebirth = _DruidGlyphs:New(nil, 20,"Glyph of Rebirth");
local regrowth = _DruidGlyphs:New(nil, 21,"Glyph of Regrowth");
local rejuvenation = _DruidGlyphs:New(nil, 22,"Glyph of Rejuvenation");
local swiftment = _DruidGlyphs:New(nil, 23,"Glyph of Swiftmend");
local wild_growth = _DruidGlyphs:New(nil, 24,"Glyph of Wild Growth");
local rapid_rejuvenation = _DruidGlyphs:New(nil, 25,"Glyph of Rapid Rejuvenation");


--Populate druidGlyphs table--
local druidGlyphs = {
   mangle,
   shred,
   rip,
   berserk,
   savage_roar,
   growl,
   maul,
   frenzied_regeneration,
   focus,
   insect_swarm,
   monsoon,
   moonfire,
   starfall,
   starfire,
   wrath,
   healing_touch,
   innervate,
   lifebloom,
   nourish,
   rebirth,
   regrowth,
   rejuvenation,
   swiftment,
   wild_growth,
   rapid_rejuvenation
};

function GetDruidGlyphs()
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
	for j=1,#druidGlyphs do
	for i=1,6 do 
		if glyph[i] == druidGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end