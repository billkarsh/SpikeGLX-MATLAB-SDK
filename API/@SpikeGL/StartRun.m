% myobj = StartRun( myobj )
% myobj = StartRun( myobj, params_struct )
% myobj = StartRun( myobj, 'runName' )
%
%     Start data acquisition run. Optional second argument (params)
%     is a struct of name/value pairs as returned from GetParams.m.
%     Alternatively, the second argument can be a string (runName).
%     Last-used parameters remain in effect if not specified here.
%     An error is flagged if already running or a parameter is bad.
%
function [s] = StartRun( varargin )

    s = varargin{1};

    if( IsRunning( s ) )
        error( 'StartRun: Already running.' );
    end

    if( nargin > 1 )

        if( isstruct( varargin{2} ) )
            SetParams( s, varargin{2} );
        elseif( ischar( varargin{2} ) )
            SetRunName( s, varargin{2} );
        else
            error( 'StartRun: Invalid second argument; must be a string or struct.' );
        end
    end

    DoSimpleCmd( s, 'STARTRUN' );
end
