% myobj = Set_NI_DO( myobj, lines, bits )
%
%     Set one or more NI lines high/low.
%     - lines is a string list of lines to set, e.g.:
%         'Dev6/port0/line2,Dev6/port0/line5'
%         'Dev6/port1/line0:3'
%         'Dev6/port1:2'
%     - bits is a uint32 value, each bit maps to a line:
%         The lowest 8 bits map to port 0.
%         The next higher 8 bits map to port 1, etc.
%
function [s] = Set_NI_DO( s, lines, bits )

    if( ~isnumeric( bits ) )
        error( 'Set_NI_DO: Arg 3 must be a uint32.' );
    end

    DoSimpleCmd( s, sprintf( 'SETNIDO %s %d', lines, bits ) );
end
