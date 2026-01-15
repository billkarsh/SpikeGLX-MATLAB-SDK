% list = GetOneBoxAdrrs( myobj )
%
%     Get string with format: (OneBoxID,slot)...
%     - A parenthesized entry for each selected obx.
%     - OneBoxID: zero-based integer assigned by 'Detect'.
%     - slot: which OneBox by user-assigned slot.
%     - If no OneBoxes, return '()'.
%
function [list] = GetOneBoxAdrrs( s )

    list = DoQuery( s, 'GETOBXADDRS' );
end
