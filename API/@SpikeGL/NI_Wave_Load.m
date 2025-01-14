% myobj = NI_Wave_Load( myobj, 'outChan', 'wave_name', loop_mode )
%
%     General sequence:
%     1. NI_Wave_Load      : Load wave from SpikeGLX/_Waves folder.
%     2. NI_Wave_Arm       : Set triggering parameters.
%     3. NI_Wave_StartStop : Start if software trigger, stop when done.
%
%     Load a wave descriptor already placed in SpikeGLX/_Waves.
%     - Pass 'mywavename' to this function; no path; no extension.
%     - The playback loop_modes are: {1=loop until stopped, 0=once only}.
%
%     outChan is a string naming any wave-capable analog output
%     channel on your device, e.g., 'dev1/ao1'.
%
function [s] = NI_Wave_Load( s, outChan, wave_name, loop_mode )

    DoSimpleCmd( s, sprintf( 'NIWVLOAD %s %s %d', outChan, wave_name, loop_mode ) );
end
