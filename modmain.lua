local function OnPlayerInteract(inst, doer, target)
    print("Interaction detected!")
    if target then
        print("Target prefab: " .. tostring(target.prefab))
        if target.prefab == "teeteringtun" then
            print("The player is interacting with a Teetering Junk Pile!")
        else
            print("@@@@@@@@@@@@@@@@The player is not interacting with a Teetering Junk Pile.")
        end
    else
        print("@@@@@@@@@@@@@@@@@No target object found during interaction.")
    end
end
print("---------start:quick work MOD----------")
-- 在玩家预制件初始化后添加事件监听器
AddPrefabPostInit("wilson", function(inst)
    -- 确保 playercontroller 组件存在
    if inst.components.playercontroller then
        inst.components.playercontroller.inst:ListenForEvent("oninteract", OnPlayerInteract)
        print("Added interact listener to Wilson.")
    else
        print("@@@@@@@@@@@@@@@@playercontroller component not found on Wilson.")
    end
end)


if GetModConfigData("Pick") == true then
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.PICK, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TAKEITEM, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.HARVEST, "doshortaction"))
end

if GetModConfigData("BuildRepair") == true then
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.BUILD, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.DECORATEVASE, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.DRAW, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.REPAIR, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SEW, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SMOTHER, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.MANUALEXTINGUISH, "doshortaction"))
end

if GetModConfigData("HSHU") == true then
	local function QuickEat(inst, action)
		if inst.sg:HasStateTag("busy") then
			return
		end
		local obj = action.target or action.invobject
		if obj == nil then
			return
		elseif obj.components.edible ~= nil then
			if not inst.components.eater:PrefersToEat(obj) then
				inst:PushEvent("wonteatfood", { food = obj })
				return
			end
		elseif obj.components.soul ~= nil then
			if inst.components.souleater == nil then
				inst:PushEvent("wonteatfood", { food = obj })
				return
			end
		else
			return
		end
		return (inst:HasTag("beaver") and "beavereat")
			or "quickeat"
	end
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.EAT, QuickEat))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.HEAL, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.TEACH, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.UPGRADE, "doshortaction"))
end

if GetModConfigData("Plant") == true then
	GLOBAL.TUNING.FARM_PLOW_DRILLING_DURATION = 1
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.PLANTSOIL, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.INTERACT_WITH, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.PLANTREGISTRY_RESEARCH, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.PLANTREGISTRY_RESEARCH_FAIL, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ASSESSPLANTHAPPINESS, "doshortaction"))
end

if GetModConfigData("Animal") == true then
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.PET, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.FEED, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.MURDER, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.BRUSH, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SHAVE, "doshortaction"))	
end


if GetModConfigData("Others") == true then
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.USEKLAUSSACKKEY, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ACTIVATE, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.FILL, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.RESETMINE, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ATTUNE, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ABANDON, "doshortaction"))
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.UNWRAP, "doshortaction"))
end

if GetModConfigData("ChopTime") ~= 999 then
	GLOBAL.TUNING.EVERGREEN_CHOPS_SMALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.EVERGREEN_CHOPS_SMALL
	GLOBAL.TUNING.EVERGREEN_CHOPS_NORMAL = GetModConfigData("ChopTime")*GLOBAL.TUNING.EVERGREEN_CHOPS_NORMAL
	GLOBAL.TUNING.EVERGREEN_CHOPS_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.EVERGREEN_CHOPS_TALL
	GLOBAL.TUNING.DECIDUOUS_CHOPS_SMALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.DECIDUOUS_CHOPS_SMALL
	GLOBAL.TUNING.DECIDUOUS_CHOPS_NORMAL = GetModConfigData("ChopTime")*GLOBAL.TUNING.DECIDUOUS_CHOPS_NORMAL
	GLOBAL.TUNING.DECIDUOUS_CHOPS_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.DECIDUOUS_CHOPS_TALL
	GLOBAL.TUNING.DECIDUOUS_CHOPS_MONSTER = GetModConfigData("ChopTime")*GLOBAL.TUNING.DECIDUOUS_CHOPS_MONSTER
	GLOBAL.TUNING.MUSHTREE_CHOPS_SMALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.MUSHTREE_CHOPS_SMALL
	GLOBAL.TUNING.MUSHTREE_CHOPS_MEDIUM = GetModConfigData("ChopTime")*GLOBAL.TUNING.MUSHTREE_CHOPS_MEDIUM
	GLOBAL.TUNING.MUSHTREE_CHOPS_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.MUSHTREE_CHOPS_TALL
	GLOBAL.TUNING.WINTER_TREE_CHOP_SMALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.WINTER_TREE_CHOP_SMALL
	GLOBAL.TUNING.WINTER_TREE_CHOP_NORMAL = GetModConfigData("ChopTime")*GLOBAL.TUNING.WINTER_TREE_CHOP_NORMAL
	GLOBAL.TUNING.WINTER_TREE_CHOP_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.WINTER_TREE_CHOP_TALL
	GLOBAL.TUNING.TOADSTOOL_MUSHROOMSPROUT_CHOPS = GetModConfigData("ChopTime")*GLOBAL.TUNING.TOADSTOOL_MUSHROOMSPROUT_CHOPS
	GLOBAL.TUNING.TOADSTOOL_DARK_MUSHROOMSPROUT_CHOPS = GetModConfigData("ChopTime")*GLOBAL.TUNING.TOADSTOOL_DARK_MUSHROOMSPROUT_CHOPS
	GLOBAL.TUNING.DRIFTWOOD_TREE_CHOPS = GetModConfigData("ChopTime")*GLOBAL.TUNING.DRIFTWOOD_TREE_CHOPS
	GLOBAL.TUNING.DRIFTWOOD_SMALL_CHOPS = GetModConfigData("ChopTime")*GLOBAL.TUNING.DRIFTWOOD_SMALL_CHOPS
	GLOBAL.TUNING.MOON_TREE_CHOPS_SMALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.MOON_TREE_CHOPS_SMALL
	GLOBAL.TUNING.MOON_TREE_CHOPS_NORMAL = GetModConfigData("ChopTime")*GLOBAL.TUNING.MOON_TREE_CHOPS_NORMAL
	GLOBAL.TUNING.MOON_TREE_CHOPS_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.MOON_TREE_CHOPS_TALL
	GLOBAL.TUNING.MOON_TREE_CHOPS_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.MOON_TREE_CHOPS_TALL
	GLOBAL.TUNING.DRIFTWOOD_SMALL_CHOPS = GetModConfigData("ChopTime")*GLOBAL.TUNING.DRIFTWOOD_SMALL_CHOPS
	GLOBAL.TUNING.PALMCONETREE_CHOPS_SMALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.PALMCONETREE_CHOPS_SMALL
	GLOBAL.TUNING.PALMCONETREE_CHOPS_NORMAL = GetModConfigData("ChopTime")*GLOBAL.TUNING.PALMCONETREE_CHOPS_NORMAL
	GLOBAL.TUNING.PALMCONETREE_CHOPS_TALL = GetModConfigData("ChopTime")*GLOBAL.TUNING.PALMCONETREE_CHOPS_TALL
	local function QuickChop(inst)
		if inst.components.workable then
			inst.components.workable:SetWorkLeft(GetModConfigData("ChopTime"))
		end
	end
	AddPrefabPostInit("cave_banana_tree", QuickChop)
	AddPrefabPostInit("marsh_tree", QuickChop)
	AddPrefabPostInit("livingtree", QuickChop)
end

if GetModConfigData("MineTime") ~= 999 then
	GLOBAL.TUNING.ICE_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.ICE_MINE
	GLOBAL.TUNING.ROCKS_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.ROCKS_MINE
	GLOBAL.TUNING.ROCKS_MINE_MED = GetModConfigData("MineTime")*GLOBAL.TUNING.ROCKS_MINE_MED
	GLOBAL.TUNING.ROCKS_MINE_LOW = GetModConfigData("MineTime")*GLOBAL.TUNING.ROCKS_MINE_LOW
	GLOBAL.TUNING.MARBLEPILLAR_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.MARBLEPILLAR_MINE
	GLOBAL.TUNING.MARBLETREE_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.MARBLETREE_MINE
	GLOBAL.TUNING.MARBLESHRUB_MINE_SMALL = GetModConfigData("MineTime")*GLOBAL.TUNING.MARBLESHRUB_MINE_SMALL
	GLOBAL.TUNING.MARBLESHRUB_MINE_NORMAL = GetModConfigData("MineTime")*GLOBAL.TUNING.MARBLESHRUB_MINE_NORMAL
	GLOBAL.TUNING.MARBLESHRUB_MINE_TALL = GetModConfigData("MineTime")*GLOBAL.TUNING.MARBLESHRUB_MINE_TALL
	GLOBAL.TUNING.PETRIFIED_TREE_SMALL = GetModConfigData("MineTime")*GLOBAL.TUNING.PETRIFIED_TREE_SMALL
	GLOBAL.TUNING.PETRIFIED_TREE_NORMAL = GetModConfigData("MineTime")*GLOBAL.TUNING.PETRIFIED_TREE_NORMAL
	GLOBAL.TUNING.PETRIFIED_TREE_TALL = GetModConfigData("MineTime")*GLOBAL.TUNING.PETRIFIED_TREE_TALL
	GLOBAL.TUNING.GARGOYLE_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.GARGOYLE_MINE
	GLOBAL.TUNING.GARGOYLE_MINE_LOW = GetModConfigData("MineTime")*GLOBAL.TUNING.GARGOYLE_MINE_LOW
	GLOBAL.TUNING.CAVEIN_BOULDER_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.CAVEIN_BOULDER_MINE
	GLOBAL.TUNING.SPILAGMITE_SPAWNER = GetModConfigData("MineTime")*GLOBAL.TUNING.SPILAGMITE_SPAWNER
	GLOBAL.TUNING.SPILAGMITE_ROCK = GetModConfigData("MineTime")*GLOBAL.TUNING.SPILAGMITE_ROCK
	GLOBAL.TUNING.SCULPTURE_COVERED_WORK = GetModConfigData("MineTime")*GLOBAL.TUNING.SCULPTURE_COVERED_WORK
	GLOBAL.TUNING.SEASTACK_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.SEASTACK_MINE
	GLOBAL.TUNING.SHELL_CLUSTER_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.SHELL_CLUSTER_MINE
	GLOBAL.TUNING.MOONALTAR_ROCKS_MINE = GetModConfigData("MineTime")*GLOBAL.TUNING.MOONALTAR_ROCKS_MINE
	GLOBAL.TUNING.SALTSTACK_WORK_REQUIRED = GetModConfigData("MineTime")*GLOBAL.TUNING.SALTSTACK_WORK_REQUIRED
end

if GetModConfigData("FishTime") ~= 999 then
	local function QuickFishing(inst)
		if inst.components.fishingrod then
			inst.components.fishingrod:SetWaitTimes(GetModConfigData("FishTime"), GetModConfigData("FishTime"))
		end
	end
	AddPrefabPostInit("fishingrod", QuickFishing)
end

if GetModConfigData("CookTime") ~= 999 then
	AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.COOK, "doshortaction"))
	if GetModConfigData("CookTime") < 998 then
		GLOBAL.TUNING.BASE_COOK_TIME = GetModConfigData("CookTime")
	end
end

if GetModConfigData("DryTime") ~= 999 then
	GLOBAL.TUNING.DRY_FAST = GetModConfigData("DryTime")*GLOBAL.TUNING.DRY_FAST
	GLOBAL.TUNING.DRY_MED = GetModConfigData("DryTime")*GLOBAL.TUNING.DRY_MED
	GLOBAL.TUNING.DRY_SUPERFAST = GetModConfigData("DryTime")*GLOBAL.TUNING.DRY_SUPERFAST
	GLOBAL.TUNING.DRY_VERYFAST = GetModConfigData("DryTime")*GLOBAL.TUNING.DRY_VERYFAST
end
