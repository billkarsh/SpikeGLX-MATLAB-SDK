% [g,t] = GetLastGT( myobj )
%
%     Returns most recently used {g,t} indices.
%     Returns {-1,-1} if no files written yet.
%
function [g,t] = GetLastGT( s )

    ret = DoQuery( s, sprintf( 'GETLASTGT' ) );
    C   = textscan( ret, '%d %d' );

    g = C{1};
    t = C{2};
end
