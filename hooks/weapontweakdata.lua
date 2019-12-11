Hooks:PostHook( WeaponTweakData, "init", "AK-101Init", function(self)

if self.SetupAttachmentPoint then
	
	self:SetupAttachmentPoint("ak_stamp_556", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 1.9, -0.1 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	
	self:SetupAttachmentPoint("ak_stamp_556", {
		name = "a_fl", 
        base_a_obj = "a_fl", 
        position = Vector3( -0.75, -2, -1.5 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
	
	self:SetupAttachmentPoint("heffy_556", {
		name = "a_o", 
        base_a_obj = "a_o", 
        position = Vector3( 0, -9, 0.5 ), 
        rotation = Rotation( 0, 0, 0 ) 
	})
end

end)