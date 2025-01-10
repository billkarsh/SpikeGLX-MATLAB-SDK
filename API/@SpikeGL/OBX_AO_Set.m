% myobj = OBX_AO_Set( myobj, ip, slot, 'chn_vlt' )
%
%     Set one or more OneBox AO (DAC) channel voltages.
%     - chn_vlt is a string with format: (chan,volts)(chan,volts)...()
%     - The chan values are integer AO indices in range [0,11].
%     - You can only use AO channels already listed on the OBX setup tab.
%     - Voltages are double values in range [-5.0,5.0] V.
%     - DAC is 16-bit; theoretical resolution is (10 V)/(2^16) ~ .0001526 V.
%     - Practical resolution, given noise, appears to be ~ 0.002 V.
%     - AO channels are disabled at run start/end; voltage ~ 1.56 V.
%
%     To reference a OneBox configured as a recording stream
%     set ip to its stream-id; if ip >= 0, slot is ignored.
%     Any selected OneBox can also be referenced by setting
%     ip = -1, and giving its slot index.
%
function [s] = OBX_AO_Set( s, ip, slot, chn_vlt )

    DoSimpleCmd( s, sprintf( 'OBXAOSET %d %d %s', ip, slot, chn_vlt ) );
end
