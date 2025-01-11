% myobj = OBX_Wave_Load( myobj, ip, slot, 'wave_name' )
%
%     General sequence:
%     1. OBX_Wave_Load      : Load wave from SpikeGLX/_Waves folder.
%     2. OBX_Wave_Arm       : Set triggering parameters.
%     3. OBX_Wave_StartStop : Start if software trigger, stop when done.
%
%     Load a wave descriptor already placed in SpikeGLX/_Waves.
%     - Pass 'mywavename' to this function; no path; no extension.
%
%     To reference a OneBox configured as a recording stream
%     set ip to its stream-id; if ip >= 0, slot is ignored.
%     Any selected OneBox can also be referenced by setting
%     ip = -1, and giving its slot index.
%
function [s] = OBX_Wave_Load( s, ip, slot, wave_name )

    DoSimpleCmd( s, sprintf( 'OBXWVLOAD %d %d %s', ip, slot, wave_name ) );
end
