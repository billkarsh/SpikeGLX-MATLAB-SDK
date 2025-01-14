% myobj = NI_Wave_Arm( myobj, 'outChan', 'trigTerm' )
%
%     General sequence:
%     1. NI_Wave_Load      : Load wave from SpikeGLX/_Waves folder.
%     2. NI_Wave_Arm       : Set triggering parameters.
%     3. NI_Wave_StartStop : Start if software trigger, stop when done.
%
%     Set trigger method.
%     - trigTerm is a string naming any trigger-capable terminal on your
%       device, e.g., '/dev1/pfi2'. NI-DAQ requires names of terminals to
%       start with a '/' character. This is indeed different than channel
%       names which do not start with a slash.
%       (1) Give a correct terminal string to trigger playback upon
%           receiving a rising edge at that terminal.
%       (2) Give any string that does NOT start with a '/' to trigger
%           playback via the NI_Wave_StartStop command.
%     - Multiple trigger events can NOT be given. For each trigger
%       event after the first, you must first call NI_Wave_StartStop
%       AND NI_Wave_Arm to stop and then rearm the task.
%
%     outChan is a string naming any wave-capable analog output
%     channel on your device, e.g., 'dev1/ao1'.
%
function [s] = NI_Wave_Arm( s, outChan, trigTerm )

    DoSimpleCmd( s, sprintf( 'NIWVARM %s %s', outChan, trigTerm ) );
end
