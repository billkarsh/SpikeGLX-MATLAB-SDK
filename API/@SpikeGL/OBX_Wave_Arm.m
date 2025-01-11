% myobj = OBX_Wave_Arm( myobj, ip, slot, trigger, loop_mode )
%
%     General sequence:
%     1. OBX_Wave_Load      : Load wave from SpikeGLX/_Waves folder.
%     2. OBX_Wave_Arm       : Set triggering parameters.
%     3. OBX_Wave_StartStop : Start if software trigger, stop when done.
%
%     Set trigger method, and playback mode.
%     - Trigger values...Playback starts:
%         -2   : By calling OBX_Wave_StartStop.
%         -1   : When TTL rising edge sent to SMA1.
%         0-11 : When TTL rising edge sent to that XA (ADC) channel.
%     - To use an ADC channel, you must name it as an XA channel on
%       the OBX setup tab of the Acquisition Configuration dialog.
%     - Multiple trigger events can be given without needing to rearm.
%     - The playback modes are: {1=loop until stopped, 0=once only}.
%
%     To reference a OneBox configured as a recording stream
%     set ip to its stream-id; if ip >= 0, slot is ignored.
%     Any selected OneBox can also be referenced by setting
%     ip = -1, and giving its slot index.
%
function [s] = OBX_Wave_Arm( s, ip, slot, trigger, loop_mode )

    DoSimpleCmd( s, sprintf( 'OBXWVARM %d %d %d %d', ip, slot, trigger, loop_mode ) );
end
