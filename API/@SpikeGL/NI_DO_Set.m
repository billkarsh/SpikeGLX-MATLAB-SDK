% myobj = NI_DO_Set( myobj, 'lines', bits )
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
function [s] = NI_DO_Set( s, lines, bits )

    DoSimpleCmd( s, sprintf( 'NIDOSET %s %d', lines, bits ) );
end
