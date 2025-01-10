% Continuously fetch LFP-band data from imec probe-0.
% Threshold channel 393 @ 0.45 mV.
% Send digital out command tracking threshold crossings.
%
% Runs until error or Ctrl-C.
%
% To measure closed-loop latency, immerse the probe in
% saline and give it a square wave signal (1 mV p-p, 1 Hz).
% We fetch all 384 channels of these data in a remote program.
% We analyze one of these channels looking for a rising edge.
% We then react to that threshold crossing by commanding an
% NI device to make another edge that is sent to the probe's
% SMA connector as a digital input. Now the separation between
% the LFP threshold event and the resulting NI event gives a
% direct readout of closed-loop latency. We measure the typical
% closed-loop latency to be 6.5 ms using the MATLAB API.
%
function LatencyTest

hSGL = SpikeGL('127.0.0.1');

mv2i16 = 1.0/(1200.0/250/1024); % assume default gain of 250 for NP 1.0
line = 'Dev4/port0/line5';      % edit for your setup
js = 2;
ip = 0;
id = 1 + (393 - 384);           % add 1 for MATLAB
thresh  = 0.45*mv2i16;
bits = 0;
channels = [384:768];           % zero-based for SpikeGLX

fromCt = GetStreamSampleCount( hSGL, js, ip );

NI_DO_Set( hSGL, line, bits );

while 1

    [M,headCt] = Fetch( hSGL, js, ip, fromCt, 120, channels );

    [tpts,~] = size(M);

    if tpts > 1
        v_diff = M(tpts,id) - M(1,id);

        if v_diff > thresh && bits == 0
            bits = hex2dec('FF');
            NI_DO_Set( hSGL, line, bits );
        elseif v_diff < -thresh && bits == hex2dec('FF')
            bits = 0;
            NI_DO_Set( hSGL, line, bits );
        end

        fromCt = headCt + tpts;
    end

end

end


