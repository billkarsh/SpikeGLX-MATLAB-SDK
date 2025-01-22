% myobj = PauseGraphs( myobj, bool_flag )
%
%     Pause Graphs window displays.
%     Note: The displays are updated at ~10 Hz.
%
function [s] = PauseGraphs( s, b )

    if( ~isnumeric( b ) )
        error( 'PauseGraphs: Arg 2 must be a Boolean value {0,1}.' );
    end

    DoSimpleCmd( s, sprintf( 'PAUSEGRF %d', b ) );
end
