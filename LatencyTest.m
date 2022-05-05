% Continuously fetch LFP-band data from imec probe-0.
% Threshold channel 393 @ 0.45 mV.
% Send digital out command tracking threshold crossings.
%
% Runs until error or Ctrl-C.
%
% To measure latency, immerse the probe in saline and
% give it a square wave signal (1 mV p-p, 1 Hz). Feed
% the commanded NI digital output into the sync SMA
% for that probe. Run this program while SpikeGLX is
% recording. One can then measure threshold crossing
% time in a good-looking LF channel vs. level change
% time on bit 6 of the SY word. We measure the median
% latency to be 9.4 ms using the MATLAB API.
%
function LatencyTest

hSGL = SpikeGL('127.0.0.1');

mv2i16 = 1.0/(1200.0/250/1024); % assume default gain of 250 for NP 1.0
line = 'Dev4/port0/line5';      % edit for your setup
js = 2;
ip = 0;
id = 1 + (393 - 384);           % add 1 for MATLAB
thresh  = 0.45*mv2i16;
level = 0;
channels = [384:768];           % zero-based for SpikeGLX

fromCt = GetStreamSampleCount( hSGL, js, ip );

SetDigOut( hSGL, level, line );

while 1

    [M,headCt] = Fetch( hSGL, js, ip, fromCt, 120, channels );

    [tpts,~] = size(M);
    v_diff = M(tpts,id) - M(1,id);

    if v_diff > thresh && level == 0
        level = 1;
        SetDigOut( hSGL, level, line );
    elseif v_diff < -thresh && level == 1
        level = 0;
        SetDigOut( hSGL, level, line );
    end

    fromCt = headCt + tpts;

end

end


