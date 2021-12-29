function GetTalentInformation()
	local talentBitString = {}
	for t=1, 3 do
	local numTalents = GetNumTalents(t);
	for i=1, numTalents do
		nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(t,i);
		table.insert(talentBitString,currRank);
	end
	end
	local s = table.concat(talentBitString);
	SRETalents = s;
end

function GetTalentInformationTarget()
	local talentBitString = {}
	local numtabs = GetNumTalentTabs("target");
	for i=1, numtabs do
		local numTalents = GetNumTalents(i, true);
		for j=1, numTalents do
			nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(i,j, true);
			table.insert(talentBitString,currRank);
		end
	end
	local s = table.concat(talentBitString);
	SRETalents = s;
	print(s);
end