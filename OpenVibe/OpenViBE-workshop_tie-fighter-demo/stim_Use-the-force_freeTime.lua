
--this function is called when the box is initialized
function initialize(box)

dofile(box:get_config("${Path_Data}") .. "/plugins/stimulation/lua-stimulator-stim-codes.lua")

-- BOX SETTINGS MUST BE:
-- 1 -> Lua script
-- 2 -> First waiting time (5sec)
-- 3 -> Imaginary duration (635sec)


		first_waiting_time = box:get_setting(2)
		imaginary_duration = box:get_setting(3)

end

--this function is called when the box is uninitialized
function uninitialized(box)
end

function process(box)

	-- wait duration before start
	-- Send "experiment start"
	t = box:get_current_time()
	t  = t+first_waiting_time
	box:send_stimulation(1,OVTK_StimulationId_ExperimentStart,t,0)

	t = box:get_current_time()
	t=t+1;	
	box:send_stimulation(1, OVTK_GDF_Stage_1, t, 0)
	t=t+1;
	box:send_stimulation(1, OVTK_StimulationId_Label_0C, t, 0)
	t=t+1

	box:send_stimulation(1, OVTK_GDF_Stage_2, t, 0)
	t=t+5

	box:send_stimulation(1, OVTK_StimulationId_Beep, t, 0)
	t=t+1

	-- "freetimeImaginary" phase 
	box:send_stimulation(1,OVTK_GDF_Stage_3,t,0)
	t=t+1
	box:send_stimulation(1,OVTK_StimulationId_Label_0E,t,0)
	t = t+imaginary_duration

	box:send_stimulation(1, OVTK_StimulationId_Beep, t, 0)
	t = t + 5

	box:send_stimulation(1, OVTK_StimulationId_Label_0D, t, 0)
	t=t+1

	box:send_stimulation(1, OVTK_StimulationId_Beep, t, 0)
	t=t+1
	box:send_stimulation(1, OVTK_StimulationId_Beep, t, 0)
	t=t+1

	box:send_stimulation(1, OVTK_StimulationId_Beep, t, 0)
	t=t+1
	box:send_stimulation(1, OVTK_StimulationId_Beep, t, 0)
	t=t+1

	box:send_stimulation(1, OVTK_StimulationId_ExperimentStop, t, 0)	
	t=t+1

	box:send_stimulation(1, OVTK_StimulationId_Train, t, 0)
	
end
