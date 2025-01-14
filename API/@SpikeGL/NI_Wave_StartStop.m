% myobj = NI_Wave_StartStop( myobj, 'outChan', start_bool )
%
%     General sequence:
%     1. NI_Wave_Load      : Load wave from SpikeGLX/_Waves folder.
%     2. NI_Wave_Arm       : Set triggering parameters.
%     3. NI_Wave_StartStop : Start if software trigger, stop when done.
%
%     Start (optionally) or stop wave playback.
%     - If you selected software triggering with NI_Wave_Arm,
%       then set start_bool=1 to start playback.
%     - In all cases, set start_bool=0 to stop playback.
%     - It is best to stop playback before changing wave parameters.
%     - After playback or if looping mode is interrupted, the voltage
%       remains at the last output level.
%
%     outChan is a string naming any wave-capable analog output
%     channel on your device, e.g., 'dev1/ao1'.
%
function [s] = NI_Wave_StartStop( s, outChan, start_bool )

    DoSimpleCmd( s, sprintf( 'NIWVSTSP %s %d', outChan, start_bool ) );
end
