% myobj = SelectDevices( myobj, 'devstring', errlvl )
%
%     This command:
%     1. Opens the Configure Acquisition dialog.
%     2. Checks boxes according to the devstring parameter.
%     3. Clicks 'Detect', and if successful...
%     4. Clicks 'Verify | Save'.
%
%     - devstring enables Devices tab items:
%        Format:        (device)...(device)
%        Passive probe: (slot,port,PN,SN) e.g. (2,1,NP1200,12709120122)
%        Regular probe: (slot,port,dock)  e.g. (2,1,1)
%        OneBox XIO:    (slot,obx)        e.g. (21,obx)
%        NI-DAQ:        (nidq)            e.g. (nidq)
%     - errlvl:
%        1 = report severe errors
%        2 = report errors and warnings (including broken shanks)
%
%     Note:
%        Here probes and OneBoxes are selected by physical address
%        (slot,port,dock). However, parameters are set according to
%        logical address (js,ip). After this call, use GetProbeAddrs
%        and GetOneBoxAddrs to get the mappings between logical and
%        physical addresses that 'Detect' assigns.
%
function [s] = SelectDevices( s, devstring, errlvl )

    if( ~ischar( devstring ) )
        error( 'SelectDevices: Argument must be a string.' );
    end

    DoSimpleCmd( s, sprintf( 'SELECTDEVS %d %s', errlvl, devstring ) );
end
