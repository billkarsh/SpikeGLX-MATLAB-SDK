% Plays wave 'jwave' at OneBox channel AO-0.
% Playback is triggered when OneBox channel AI-1 goes high.
% User needs to list AI-1 in the XA box of OBX Setup tab.
% We will configure NI device to send TTL rising edge from line-4.
% User needs to wire NI line-4 to OneBox AI-1.
%
function wp_trig_start

    % Handle to SpikeGLX
    hSGL = SpikeGL( '127.0.0.1' );

    % OneBox assumed to be recording stream ip=0...
    % So the slot number is ignored in this case
    ip = 0;
    slot = -1;

    % Load the wave plan
    wave_name = 'jwave';
    OBX_Wave_Load( hSGL, ip, slot, wave_name );

    % Select AI-1 triggering and no looping
    trigger = 1;
    looping = 0;
    OBX_Wave_Arm( hSGL, ip, slot, trigger, looping );

    % Configure NI line-4
    digOutTerm = '/PXI1Slot6_2/line4';
    digBits = 0x10; % binary 1 at bit-4, zero elsewhere
    NI_DO_Set( hSGL, digOutTerm, 0 );

    % Start playback now, output is always at AO-0
    NI_DO_Set( hSGL, digOutTerm, digBits );

    % Reset trigger after 50 ms
    pause( 0.05 );
    NI_DO_Set( hSGL, digOutTerm, 0 );

    % This section demonstrates a method to capture your
    % wave plan in action. The best pause parameters will
    % depend upon the duration of your wave plan and how
    % fast your SpikeGLX graphs are sweeping
    %
    % Let this play for 1 second
    % Then pause the SpikeGLX Graphs Window for 2 seconds
    % Then resume Graphs
    pause( 1.0 );
    PauseGraphs( hSGL, 1 );
    pause( 2.0 );
    PauseGraphs( hSGL, 0 );

    % Stop playback
    start = 0;
    OBX_Wave_StartStop( hSGL, ip, slot, start );

end % wp_trig_start
