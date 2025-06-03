% Plays wave 'jwave' at OneBox channel AO-0.
% Playback is triggered by software command.
%
function wp_soft_start

    % Handle to SpikeGLX
    hSGL = SpikeGL( '127.0.0.1' );

    % For demo purposes we assume the OneBox is not recording...
    % So we refer to it using its slot index
    ip = -1;
    slot = 21;

    % Load the wave plan
    wave_name = 'jwave';
    OBX_Wave_Load( hSGL, ip, slot, wave_name );

    % Select software triggering and infinite looping
    trigger = -2;
    looping = 1;
    OBX_Wave_Arm( hSGL, ip, slot, trigger, looping );

    % Start playback now, output is always at AO-0
    start = 1;
    OBX_Wave_StartStop( hSGL, ip, slot, start );

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
    OBX_Wave_StartStop( hSGL, ip, slot, start );

end % wp_soft_start
