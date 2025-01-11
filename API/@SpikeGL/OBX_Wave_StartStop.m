% myobj = OBX_Wave_StartStop( myobj, ip, slot, start_bool )
%
%     General sequence:
%     1. OBX_Wave_Load      : Load wave from SpikeGLX/_Waves folder.
%     2. OBX_Wave_Arm       : Set triggering parameters.
%     3. OBX_Wave_StartStop : Start if software trigger, stop when done.
%
%     Start (optionally) or stop wave playback.
%     - If you selected software triggering with OBX_Wave_Arm,
%       then set start_bool=1 to start playback.
%     - In all cases, set start_bool=0 to stop playback.
%     - It is best to stop playback before changing wave parameters.
%     - Waves only play at AO (DAC) channel-0.
%     - To use the waveplayer, you must name channel AO-0 on
%       the OBX setup tab of the Acquisition Configuration dialog.
%     - After playback, the voltage remains at the last programmed level.
%
%     To reference a OneBox configured as a recording stream
%     set ip to its stream-id; if ip >= 0, slot is ignored.
%     Any selected OneBox can also be referenced by setting
%     ip = -1, and giving its slot index.
%
function [s] = OBX_Wave_StartStop( s, ip, slot, start_bool )

    DoSimpleCmd( s, sprintf( 'OBXWVSTSP %d %d %d', ip, slot, start_bool ) );
end
