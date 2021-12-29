
--WarriorGlyphs Class--
local _WarriorGlyphs = {id = 0, name = 0};

function _WarriorGlyphs:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create WarriorGlyphs--
local barbaric_insults = _WarriorGlyphs:New(nil, 1,"Glyph of Barbaric Insults");
local bladestorm = _WarriorGlyphs:New(nil, 2,"Glyph of Bladestorm");
local blocking = _WarriorGlyphs:New(nil, 3,"Glyph of Blocking");
local bloodthirst = _WarriorGlyphs:New(nil, 4,"Glyph of Bloodthirst");
local cleaving = _WarriorGlyphs:New(nil, 5,"Glyph of Cleaving");
local devastate = _WarriorGlyphs:New(nil, 6,"Glyph of Devastate");
local enraged_regeneration = _WarriorGlyphs:New(nil, 7,"Glyph of Enraged Regeneration");
local execution = _WarriorGlyphs:New(nil, 8,"Glyph of Execution");
local hamstring = _WarriorGlyphs:New(nil, 9,"Glyph of Hamstring");
local heroic_strike = _WarriorGlyphs:New(nil, 10,"Glyph of Heroic Strike");
local intervene = _WarriorGlyphs:New(nil, 11,"Glyph of Intervene");
local last_stand = _WarriorGlyphs:New(nil, 12,"Glyph of Last Stand");
local mortal_strike = _WarriorGlyphs:New(nil, 13,"Glyph of Mortal Strike");
local overpower = _WarriorGlyphs:New(nil, 14,"Glyph of Overpower");
local rapid_charge = _WarriorGlyphs:New(nil, 15,"Glyph of Rapid Charge");
local rending = _WarriorGlyphs:New(nil, 16,"Glyph of Rending");
local resonating_power = _WarriorGlyphs:New(nil, 17,"Glyph of Resonating Power");
local revenge = _WarriorGlyphs:New(nil, 18,"Glyph of Revenge");
local shield_wall = _WarriorGlyphs:New(nil, 19,"Glyph of Shield Wall");
local shockwave = _WarriorGlyphs:New(nil, 20,"Glyph of Shockwave");
local spell_reflection = _WarriorGlyphs:New(nil, 21,"Glyph of Spell Reflection");
local sunder_armor = _WarriorGlyphs:New(nil, 22,"Glyph of Sunder Armor");
local sweeping_strikes = _WarriorGlyphs:New(nil, 23,"Glyph of Sweeping Strikes");
local taunt = _WarriorGlyphs:New(nil, 24,"Glyph of Taunt");
local victory_rush = _WarriorGlyphs:New(nil, 25,"Glyph of Victory Rush");
local vigilance = _WarriorGlyphs:New(nil, 26,"Glyph of Vigilance");
local whirlwind = _WarriorGlyphs:New(nil, 27,"Glyph of Whirlwind");
local battle = _WarriorGlyphs:New(nil, 28,"Glyph of Battle");
local bloodrage = _WarriorGlyphs:New(nil, 29,"Glyph of Bloodrage");
local charge = _WarriorGlyphs:New(nil, 30,"Glyph of Charge");
local enduring_victory = _WarriorGlyphs:New(nil, 31,"Glyph of Enduring Victory");
local mocking_blow = _WarriorGlyphs:New(nil, 32,"Glyph of Mocking Blow");
local thunder_clap = _WarriorGlyphs:New(nil, 33,"Glyph of Thunder Clap");
local command = _WarriorGlyphs:New(nil, 34,"Glyph of Command");


--Populate warriorGlyphs table--
local warriorGlyphs = {
   barbaric_insults,
   bladestorm,
   blocking,
   bloodthirst,
   cleaving,
   devastate,
   enraged_regeneration,
   execution,
   hamstring,
   heroic_strike,
   intervene,
   last_stand,
   mortal_strike,
   overpower,
   rapid_charge,
   rending,
   resonating_power,
   revenge,
   shield_wall,
   shockwave,
   spell_reflection,
   sunder_armor,
   sweeping_strikes,
   taunt,
   victory_rush,
   vigilance,
   whirlwind,
   battle,
   bloodrage,
   charge,
   enduring_victory,
   mocking_blow,
   thunder_clap,
   command
};

function GetWarriorGlyphs()
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
	for j=1,#warriorGlyphs do
	for i=1,6 do 
		if glyph[i] == warriorGlyphs[j].name then 
			table.insert(glyphBitString,'1');
			glyphFound = true;
		end
	end
	if glyphFound == true then glyphFound = false; else table.insert(glyphBitString,'0'); end
	end
	
	local s = table.concat(glyphBitString);
	SREGlyphs = s;
end