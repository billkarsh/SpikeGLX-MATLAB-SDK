% myobj = SetMultiDriveEnable( myobj, bool_flag )
%
%     Set multi-drive run-splitting on/off.
%
function [s] = SetMultiDriveEnable( s, b )

    if( ~isnumeric( b ) )
        error( 'SetMultiDriveEnable: Arg 2 must be a Boolean value {0,1}.' );
    end

    DoSimpleCmd( s, sprintf( 'SETMULTIDRIVEENABLE %d', b ) );
end
