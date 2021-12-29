function BuildXML(target)
	CharacterExtractXML.Character = string.char(44) .. "<?xml version="..'"'.."1.0"..'"'.. " encoding="..'"'.."utf-8"..'"'.."?>" .. string.char(44) .. "<Character xmlns:xsi=".. '"' .."http://www.w3.org/2001/XMLSchema-instance" .. '"' .. " xmlns:xsd="..'"'.."http://www.w3.org/2001/XMLSchema" .. '"' .. ">"
	
	GetCharacterInfo(target);
	
	CharacterExtractXML.Character = CharacterExtractXML.Character .. string.char(44) .. "<CalculationOptions />"
	
	GetItemsGemsEnchants(target);
	
	CharacterExtractXML.Character = CharacterExtractXML.Character .. string.char(44) .. "<CustomGemmingTemplates />" ..
	string.char(44) .. "<GemmingTemplateOverrides />" ..
	string.char(44) .. "<ItemFilterEnabledOverride />" ..
	string.char(44) .. "<Boss />"  ..
	string.char(44) .. "<" .. SREClass .. "Talents>" .. SRETalents .. "." .. SREGlyphs .. "</" .. SREClass .. "Talents>" ..
	string.char(44) .. "<CustomItemInstances />" ..
	string.char(44) .. "<WaistBlacksmithingSocketEnabled>false</WaistBlacksmithingSocketEnabled>" ..
	string.char(44) .. "<HandsBlacksmithingSocketEnabled>false</HandsBlacksmithingSocketEnabled>" ..
	string.char(44) .. "<WristBlacksmithingSocketEnabled>false</WristBlacksmithingSocketEnabled>" ..
	string.char(44) .. "<PrimaryProfession>None</PrimaryProfession>" ..
	string.char(44) .. "<SecondaryProfession>None</SecondaryProfession>" ..
	string.char(44) .. "</Character>"
end

