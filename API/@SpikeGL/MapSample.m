% dstSample = MapSample( myobj, dstjs, dstip, srcSample, srcjs, srcip )
%
%     Returns sample in dst stream corresponding to
%     given sample in src stream.
%
function [ret] = MapSample( s, dstjs, dstip, srcSample, srcjs, srcip )

    ret = str2double( ...
              DoQuery( s, ...
                  sprintf( 'MAPSAMPLE %d %d %u %d %d', ...
                  dstjs, dstip, uint64(srcSample), srcjs, srcip ) ) );
end
