--Slot Class--
local Slot = {id = 0, name = 0};

function Slot:New(o,id,name)
   local o = {};
   o.id = id;
   o.name = name;
   self.__index = self;
   return setmetatable(o,self);
end

--Create slots--
local Head = Slot:New(nil, 1,"Head");
local Neck = Slot:New(nil, 2,"Neck");
local Shoulders = Slot:New(nil, 3,"Shoulders");
local Shirt = Slot:New(nil, 4,"Shirt");
local Chest = Slot:New(nil, 5,"Chest");
local Waist = Slot:New(nil, 6, "Waist");
local Legs = Slot:New(nil,7,"Legs");
local Feet = Slot:New(nil, 8,"Feet");
local Wrist = Slot:New(nil, 9,"Wrist");
local Hands = Slot:New(nil, 10,"Hands");
local Finger1 = Slot:New(nil, 11,"Finger1");
local Finger2 = Slot:New(nil, 12,"Finger2");
local Trinket1 = Slot:New(nil, 13,"Trinket1");
local Trinket2 = Slot:New(nil, 14,"Trinket2");
local Back = Slot:New(nil, 15,"Back");
local MainHand = Slot:New(nil, 16,"MainHand");
local OffHand = Slot:New(nil, 17,"OffHand");
local Ranged = Slot:New(nil, 18,"Ranged");

--Populate slots table--
local slots = {
   Head,
   Neck,
   Shoulders,
   Shirt,
   Chest,
   Waist,
   Legs,
   Feet,
   Wrist,
   Hands,
   Finger1,
   Finger2,
   Trinket1,
   Trinket2,
   Back,
   MainHand,
   OffHand,
   Ranged
}


function GetItemsGemsEnchants(target)
	for i=1,18 do
		local link = GetInventoryItemLink(target, i)
		if i ~= 4 and link then 
			local gem1name, gem1Link = GetItemGem(link, 1)
			if gem1Link then gem1Id = string.match(gem1Link, "item:(%d+)") else gem1Id = '0' end
			
			local gem2name, gem2Link = GetItemGem(link, 2)
			if gem2Link then gem2Id = string.match(gem2Link, "item:(%d+)") else gem2Id = '0' end
			
			local gem3name, gem3Link = GetItemGem(link, 3)
			if gem3Link then gem3Id = string.match(gem3Link, "item:(%d+)") else gem3Id = '0' end
			
			local itemId, enchantId = link:match("item:(%d+):(%d+)")
			
			local slot = "<".. slots[i].name ..">" .. itemId .. '.' .. gem1Id .. '.' .. gem2Id .. '.' .. gem3Id .. '.' .. enchantId .. "</".. slots[i].name ..">"
			CharacterExtractXML.Character = CharacterExtractXML.Character .. string.char(44) .. slot;
		end
	end
end