% Continuously fetch data from imec probe-0.
% Threshold selected meas_chan.
% Send digital out command tracking threshold crossings.
%
% Runs until error or Ctrl-C.
%
% To measure closed-loop latency, immerse the probe in saline
% and give it a square wave signal (1 to 5 mV p-p, 10 Hz).
%
% We fetch 384 channels of these data in the remote program;
% fetching performance is similar regardless of channel count.
%
% If the probe has an LF-band we'll use that so the 10 Hz signal
% isn't too distorted, otherwise we'll fetch AP (full-band).
%
% We analyze one of these channels looking for a rising edge.
% We then react to that threshold crossing by commanding an
% NI device to make another edge that is sent to the probe's
% SMA connector as a digital input. The separation between
% the threshold event and the resulting NI event gives a
% direct readout of closed-loop latency. We measure the mean
% closed-loop latency to be 2 to 3 ms.
%
% Note that the square wave amplitude and/or thresh voltage may
% need to be adjusted until you are seeing a regular square
% wave in the imec SY channel; not many edges missed, and not
% too noisy.
%
% While running this script you can enable file writing in SpikeGLX,
% and save a few minutes of recording. Get SpikeGLX_Datafile_Tools
% from the SpikeGLX download site and use its latency_test_analysis
% script to calculate latency statistics.
% https://billkarsh.github.io/SpikeGLX/#post-processing-tools
%
function LatencyTest

hSGL = SpikeGL('127.0.0.1');

% NI params
line = 'Dev4/port0/line5';  % edit for your setup
bits = 0;

% probe params
js = 2;
ip = 0;

% has LF-band?
% Get [AP LF SY] channel counts for probe stream
stream_chans = GetStreamAcqChans( hSGL, js, ip );
if stream_chans(2) > 0
    fetch_chans = [384:767];        % zero-based list of LF chans
    meas_chan = 393;                % zero-based arb chan in fetched set
    meas_idx = 1 + meas_chan - 384; % MATLAB index into fetched set
else
    fetch_chans = [0:383];          % zero-based list of full-band chans
    meas_chan = 9;                  % zero-based arb chan in fetched set
    meas_idx = 1 + meas_chan - 0;   % MATLAB index into fetched set
end

i162mv = 1000 * GetStreamI16ToVolts( hSGL, js, ip, meas_chan );
thresh = 0.25 / i162mv;             % 0.25 mv as probe i16

fromCt = GetStreamSampleCount( hSGL, js, ip );

NI_DO_Set( hSGL, line, bits );

while 1

    [M,headCt] = Fetch( hSGL, js, ip, fromCt, 120, fetch_chans );

    [tpts,~] = size(M);

    if tpts > 1
        v_diff = M(tpts,meas_idx) - M(1,meas_idx);

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


