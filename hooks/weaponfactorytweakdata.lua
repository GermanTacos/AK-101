--=========================--
--          AK-101         --
-- GERMANTACOS, KILLERWOLF --
--=========================--

--=========================--
--        FUNCTIONS        --
--=========================--

--Pretend there are functions here

Hooks:PostHook( WeaponFactoryTweakData, "init", "AK101Init", function(self)

--=========================--
--          ARRAYS         --
--=========================--

local vanilla_ak556sight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local all_ak556sight = deep_clone(vanilla_ak556sight)

--- Barrel Extensions --
local all_ak556ext = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_ass_ak_stamp_556_md_ak101",
	"wpn_fps_ass_ak_stamp_556_md_ak102"
}

--- CAFCW aka better later then never also holy shit this actually works ---
if attach_tables then
	for _, md_id in pairs(attach_tables.Barrel_Extensions) do
		if self.parts[md_id] then
			table.insert(all_ak556ext, md_id)
		end
	end
	for _, o_id in pairs(attach_tables.ACOG) do
		if self.parts[o_id] then
			table.insert(all_ak556sight, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Custom) do
		if self.parts[o_id] then
			table.insert(all_ak556sight, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Specter) do
		if self.parts[o_id] then
			table.insert(all_ak556sight, o_id)
		end
	end
	--[[
	if attach_tables.Custom_AK then --safety (since that thing doesn't exist in older versions)
		for _, o_id in pairs(attach_tables.Custom_AK) do
			if self.parts[o_id] then
				table.insert(self.parts.wpn_fps_upg_o_ak47_l_scopemount.forbids, o_id)
			end
		end
	end
	--]]
end


--=========================--
--      COMPATIBILITY      --
--=========================--

--=========================--
--        	ADDS           --
--=========================--
--- Gun ---
for id, o_id in pairs(all_ak556sight) do
	self.wpn_fps_ass_ak_stamp_556.adds[o_id] = {"wpn_fps_ass_ak_stamp_556_om_tula"}
end
for id, md_id in pairs(all_ak556ext) do
	self.parts.wpn_fps_ass_ak_stamp_556_ba_ak102.override[md_id] = {a_obj="a_ns_ak102"}
end

--=========================--
--          STANCE         --
--=========================--

--- Vanilla sights ---
for id, o_id in pairs(vanilla_ak556sight) do
	if self.parts[o_id].stance_mod.wpn_fps_ass_flint then
		self.parts[o_id].stance_mod.wpn_fps_ass_ak_stamp_556 = deep_clone(self.parts[o_id].stance_mod.wpn_fps_ass_flint)
	else
		log("[AK_Pack] [ERROR] WHO THE FUCK MESSED WITH SIGHT STANCES THIS TIME!? " .. o_id)
	end
end

end )