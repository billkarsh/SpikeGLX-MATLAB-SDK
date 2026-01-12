% list = GetProbeAdrrs( myobj )
%
%     Get string with format: (probeID,slot,port,dock)...
%     - A parenthesized entry for each selected probe.
%     - probeID: zero-based integer assigned by 'Detect'.
%     - {slot,port,dock}: where probe is plugged in.
%     - If no probes, return '()'.
%
function [list] = GetProbeAdrrs( s )

    list = DoQuery( s, 'GETPROBEADDRS' );
end
