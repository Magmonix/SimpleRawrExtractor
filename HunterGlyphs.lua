
--HunterGlyphs Class--
local _HunterGlyphs = {id = 0, name = 0};

function _HunterGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create HunterGlyphs--
local aimed_shot = _HunterGlyphs:New(nil, 1,"Glyph of Aimed Shot");
local arcane_shot = _HunterGlyphs:New(nil, 2,"Glyph of Arcane Shot");
local aspect_of_the_viper = _HunterGlyphs:New(nil, 3,"Glyph of Aspect of the Viper");
local bestial_wrath = _HunterGlyphs:New(nil, 4,"Glyph of Bestial Wrath");
local chimera_shot = _HunterGlyphs:New(nil, 5,"Glyph of Chimera Shot");
local deterrence = _HunterGlyphs:New(nil, 6,"Glyph of Deterrence");
local disengage = _HunterGlyphs:New(nil, 7,"Glyph of Disengage");
local explosive_shot = _HunterGlyphs:New(nil, 8,"Glyph of Explosive Shot");
local explosive_trap = _HunterGlyphs:New(nil, 9,"Glyph of Explosive Trap");
local freezing_trap = _HunterGlyphs:New(nil, 10,"Glyph of Freezing Trap");
local frost_trap = _HunterGlyphs:New(nil, 11,"Glyph of Frost Trap");
local hunters_mark = _HunterGlyphs:New(nil, 12,"Glyph of Hunter's Mark");
local immolation_trap = _HunterGlyphs:New(nil, 13,"Glyph of Immolation Trap");
local kill_shot = _HunterGlyphs:New(nil, 14,"Glyph of Kill Shot");
local mending = _HunterGlyphs:New(nil, 15,"Glyph of Mending");
local multishot = _HunterGlyphs:New(nil, 16,"Glyph of Multi-Shot");
local rapid_fire = _HunterGlyphs:New(nil, 17,"Glyph of Rapid Fire");
local raptor_strike = _HunterGlyphs:New(nil, 18,"Glyph of Raptor Strike");
local scatter_shot = _HunterGlyphs:New(nil, 19,"Glyph of Scatter Shot");
local serpent_sting = _HunterGlyphs:New(nil, 20,"Glyph of Serpent Sting");
local snake_trap = _HunterGlyphs:New(nil, 21,"Glyph of Snake Trap");
local steady_shot = _HunterGlyphs:New(nil, 22,"Glyph of Steady Shot");
local the_beast = _HunterGlyphs:New(nil, 23,"Glyph of the Beast");
local the_hawk = _HunterGlyphs:New(nil, 24,"Glyph of the Hawk");
local trueshot_aura = _HunterGlyphs:New(nil, 25,"Glyph of Trueshot Aura");
local volley = _HunterGlyphs:New(nil, 26,"Glyph of Volley");
local wyvern_sting = _HunterGlyphs:New(nil, 27,"Glyph of Wyvern Sting");
local feign_death = _HunterGlyphs:New(nil, 28,"Glyph of Feign Death");
local mend_pet = _HunterGlyphs:New(nil, 29,"Glyph of Mend Pet");
local possessed_strength = _HunterGlyphs:New(nil, 30,"Glyph of Possessed Strength");
local revive_pet = _HunterGlyphs:New(nil, 31,"Glyph of Revive Pet");
local scare_beast = _HunterGlyphs:New(nil, 32,"Glyph of Scare Beast");
local the_pack = _HunterGlyphs:New(nil, 33,"Glyph of the Pack");


--Populate hunterGlyphs table--
local hunterGlyphs = {
	aimed_shot,
	arcane_shot,
	aspect_of_the_viper,
	bestial_wrath,
	chimera_shot,
	deterrence,
	disengage,
	explosive_shot, 
	explosive_trap,
	freezing_trap,
	frost_trap,
	hunters_mark,
	immolation_trap,
	kill_shot,
	mending,
	multishot,
	rapid_fire,
	raptor_strike,
	scatter_shot,
	serpent_sting,
	snake_trap,
	steady_shot,
	the_beast,
	the_hawk,
	trueshot_aura,
	volley,
	wyvern_sting,
	feign_death,
	mend_pet,
	possessed_strength,
	revive_pet,
	scare_beast,
	the_pack
};

function GetHunterGlyphs()
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
	for j=1,#hunterGlyphs do
	for i=1,6 do 
		if glyph[i] == hunterGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end