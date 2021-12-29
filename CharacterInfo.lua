function GetCharacterInfo(target)
	local locClass, engClass, locRace, engRace, gender, name, server = GetPlayerInfoByGUID(UnitGUID(target))
	locClass = string.replace(locClass," ","");
	locRace = string.replace(locRace," ","");
	SREClass = locClass;
	SRERace = locRace;
	
	local model = locClass;
	
	if model == "Warrior" then model = "DPSWarr";--Yes this is even more ugly. No I don't really care.
	elseif model == "DeathKnight" then model = "DPSDK";
	elseif model == "Druid" and SRETalents:sub(1,1) + SRETalents:sub(2,2) + SRETalents:sub(3,3) + SRETalents:sub(4,4) + SRETalents:sub(5,5) + SRETalents:sub(6,6) + SRETalents:sub(7,7) + SRETalents:sub(8,8) + SRETalents:sub(9,9) + SRETalents:sub(10,10) + SRETalents:sub(11,11) + SRETalents:sub(12,12) + SRETalents:sub(13,13) + SRETalents:sub(14,14) >= 20 then model = "Moonkin";
	elseif model == "Druid" then model = "Cat";
	elseif model == "Paladin" and SRETalents:sub(59,59) + SRETalents:sub(60,60) + SRETalents:sub(61,61) + SRETalents:sub(62,62) + SRETalents:sub(63,63) +SRETalents:sub(64,64) + SRETalents:sub(65,65) + SRETalents:sub(66,66) + SRETalents:sub(67,67) + SRETalents:sub(68,68) + SRETalents:sub(69,69) + SRETalents:sub(70,70) + SRETalents:sub(71,71) + SRETalents:sub(72,72) >= 20 then model = "Retribution";
	elseif model == "Priest" then model = "ShadowPriest";
	elseif model == "Shaman" and SRETalents:sub(1,1) + SRETalents:sub(2,2) + SRETalents:sub(3,3) + SRETalents:sub(4,4) + SRETalents:sub(5,5) + SRETalents:sub(6,6) + SRETalents:sub(7,7) + SRETalents:sub(8,8) + SRETalents:sub(9,9) + SRETalents:sub(10,10) + SRETalents:sub(11,11) + SRETalents:sub(12,12) + SRETalents:sub(13,13) >= 20 then model = "Elemental";
	elseif model == "Shaman" then model = "Enhance";
	end
	
	--elseif model == "Paladin" and SRETalents:sub(59,59) + SRETalents:sub(60,60) + SRETalents:sub(61,61) + SRETalents:sub(62,62) + SRETalents:sub(63,63) +SRETalents:sub(64,64) + SRETalents:sub(65,65) + SRETalents:sub(66,66) + SRETalents:sub(67,67) + SRETalents:sub(68,68) + SRETalents:sub(69,69) + SRETalents:sub(70,70) + SRETalents:sub(71,71) + SRETalents:sub(72,72) >= 20 then model = "Retribution";
	
	--elseif model == "Paladin" and SRETalents:sub(53,53) + SRETalents:sub(54,54) + SRETalents:sub(55,55) + SRETalents:sub(56,56) + SRETalents:sub(57,57) +SRETalents:sub(58,58) + SRETalents:sub(59,59) + SRETalents:sub(60,60) + SRETalents:sub(61,61) + SRETalents:sub(62,62) + SRETalents:sub(63,63) + SRETalents:sub(64,64) + SRETalents:sub(65,65) + SRETalents:sub(66,66) >= 20 then model = "Retribution";
	
	CharacterExtractXML.Character = CharacterExtractXML.Character .. 
	string.char(44) .. "<Name>" .. name .. "</Name>" ..
	string.char(44) .. "<Region>US</Region>" ..
	string.char(44) .. "<Race>" .. SRERace .. "</Race>" ..
	string.char(44) .. "<Class>" .. SREClass .. "</Class>" ..
	string.char(44) .. "<CurrentModel>" .. model .. "</CurrentModel>" ..
	string.char(44) .. "<EnforceMetaGemRequirements>true</EnforceMetaGemRequirements>"
end
