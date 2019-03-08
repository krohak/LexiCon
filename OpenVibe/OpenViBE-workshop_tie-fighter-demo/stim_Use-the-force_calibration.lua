
--this function is called when the box is initialized
function initialize(box)
dofile(box:get_config("${Path_Data}") .. "/plugins/stimulation/lua-stimulator-stim-codes.lua")
end

--this function is called when the box is uninitialized
function uninitialized(box)
end

function wait_until(box, time)
	while box:get_current_time() < time do
		box:sleep()
	end
end

function wait_for(box, duration)
	wait_until(box, box:get_current_time() + duration)
end

function process(box)
	-- Send "OVTK_StimulationId_Label_00"
	t = box:get_current_time() + 5
	box:send_stimulation(1,OVTK_StimulationId_Label_00,t,0)
	
	
	-- wait_for(box,30)

	--t = box:get_current_time()
	t = t + 30
	box:send_stimulation(1,OVTK_StimulationId_Label_01,t,0)
end
