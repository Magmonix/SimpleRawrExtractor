SRETalents = 0;
SREGlyphs = 0;
SREClass = 0;
SRERace = 0;

CharacterExtractXML = {Character = 0};

function Main()
	local locClass, engClass, locRace, engRace, gender, name, server = GetPlayerInfoByGUID(UnitGUID("player")) --I know that I'm doing this in CharacterInfo.lua but 
	locClass = string.replace(locClass," ",""); --I don't want to think about changing the XMLBuilder now that it works.
	GetTalentInformation();
	if locClass == "Rogue" then GetRogueGlyphs();--Yes this is ugly. No I don't really care.
	elseif locClass == "Warrior" then GetWarriorGlyphs();
	elseif locClass == "Paladin" then GetPaladinGlyphs();
	elseif locClass == "Hunter" then GetHunterGlyphs();
	elseif locClass == "Priest" then GetPriestGlyphs();
	elseif locClass == "DeathKnight" then GetDeathKnightGlyphs();
	elseif locClass == "Shaman" then GetShamanGlyphs();
	elseif locClass == "Mage" then GetMageGlyphs();
	elseif locClass == "Warlock" then GetWarlockGlyphs();
	elseif locClass == "Druid" then GetDruidGlyphs();
	end
	BuildXML("player");
	ReloadUI();
end

function MainOther()
	local locClass, engClass, locRace, engRace, gender, name, server = GetPlayerInfoByGUID(UnitGUID("target")) 
	locClass = string.replace(locClass," ","");
	GetTalentInformationTarget();
	if locClass == "Rogue" then SREGlyphs = "0000000000000000000000000000000000";
	elseif locClass == "Warrior" then SREGlyphs = "0000000000000000000000000000000000";
	elseif locClass == "Paladin" then SREGlyphs = "0000000000000000000000000000000000";
	elseif locClass == "Hunter" then SREGlyphs = "000000000000000000000000000000000";
	elseif locClass == "Priest" then SREGlyphs = "000000000000000000000000000000000";
	elseif locClass == "DeathKnight" then SREGlyphs = "000000000000000000000000000000000";
	elseif locClass == "Shaman" then SREGlyphs = "00000000000000000000000000000";
	elseif locClass == "Mage" then SREGlyphs = "0000000000000000000";
	elseif locClass == "Warlock" then SREGlyphs = "00000000000000000";
	elseif locClass == "Druid" then SREGlyphs = "0000000000000000000000000";
	end
	BuildXML("target");
	ReloadUI();
end

local frame = CreateFrame("FRAME", "TalentCheck");

local function eventHandler(self, event, ...)
	GetTalentInformationTarget();
end

local function SREStart()
	frame:RegisterEvent("INSPECT_TALENT_READY");
	frame:SetScript("OnEvent", eventHandler);
end

local function SREStop()
	frame:UnregisterEvent("INSPECT_TALENT_READY");
end


SLASH_GETRAWR1 = "/getrawr"
SLASH_GETTARGET1 = "/gettarget"
SLASH_SSTART1 = "/sstart"
SLASH_SSTOP1 = "/sstop"
SlashCmdList["GETRAWR"] = Main
SlashCmdList["GETTARGET"] = MainOther
SlashCmdList["SSTART"] = SREStart
SlashCmdList["SSTOP"] = SREStop
