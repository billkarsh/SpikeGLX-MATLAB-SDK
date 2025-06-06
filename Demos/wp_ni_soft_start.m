% Plays wave 'jwave' at NI channel AO-0.
% Playback is triggered by software command.
%
function wp_ni_soft_start

    % Handle to SpikeGLX
    hSGL = SpikeGL( '127.0.0.1' );

    % Load the wave plan, select infinite looping
    wave_name = 'jwave';
    outChan = 'PXI1Slot6_2/ao0';
    looping = 1;
    NI_Wave_Load( hSGL, outChan, wave_name, looping );

    % Select software triggering
    trigTerm = 'software';
    NI_Wave_Arm( hSGL, outChan, trigTerm );

    % Start playback now
    start = 1;
    NI_Wave_StartStop( hSGL, outChan, start );

    % This section demonstrates a method to capture your
    % wave plan in action. The best pause parameters will
    % depend upon the duration of your wave plan and how
    % fast your SpikeGLX graphs are sweeping
    %
    % Let this play for 1 second
    % Then pause the SpikeGLX Graphs Window for 2 seconds
    % Then resume Graphs for 5 seconds
    pause( 1.0 );
    PauseGraphs( hSGL, 1 );
    pause( 2.0 );
    PauseGraphs( hSGL, 0 );
    pause( 5.0 );

    % Stop playback
    start = 0;
    NI_Wave_StartStop( hSGL, outChan, start );

end % wp_ni_soft_start
