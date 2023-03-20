%% NR Test Mode Waveform Generation
% 2022-11-03, draft
% 
% 2023-01-03, Add frf for Sampling freq. expansion --> Removed
% 
% 2023-02-26, Add Nsubframe = 1 default for samples reduction
% 
% 2023-03-02, Remove section of Power Amplifier 
% 

format long g
ii=4

if 1
    carrierName = '100MHz_scs30_fs983p04MHz_TM31_cfr8p5_1frame'
    % carrierName = '100MHz_scs0_fs983p04MHz_TM2_cfr8p5_1frame'
    % carrierName = '100MHz_scs30_fs983p04MHz_TM11_cfr8p5_1frame'
    % carrierName = '20MHz_scs15_fs983p04MHz_TM31_cfr8p5_1frame'
    % carrierName = '40MHz_scs15_fs983p04MHz_TM31_cfr8p5_1frame'
    % carrierName = '40MHz_scs30_fs1p96608GHz_TM31_cfr8p5_1frame'
    % carrierName = '100MHz_offset100MHz_scs30_fs983p04MHz_TM31_cfr8p5_1frame'
    carrierName = '400MHz_scs120_fs983p04MHz_TM31_cfr8p5_1frame'

else
    % carrierName = '2X100MHz_ibw200MHz_scs30_fs983p04MHz_TM31_cfr8p5_1frame'
    % carrierName = '2X100MHz_ibw400MHz_scs30_fs983p04MHz_TM31_cfr8p5_1frame'
    % carrierName = '2X40MHz_ibw400MHz_scs30_fs983p04MHz_TM31_cfr8p5_1frame'
    % carrierName = '2X40MHz_ibw400MHz_scs30_fs1p96608GHz_TM31_cfr8p5_1frame'
    carrierName = '2X40MHz_ibw300MHz_scs30_fs1p96608GHz_TM31_cfr8p5_1frame'
    carrierName = '2X20MHz_offset100MHz_ibw300MHz_scs15_fs983p04GHz_TM31_cfr8p5_1frame'
    carrierName = '2X20MHz_offset80MHz_ibw100MHz_scs15_fs245p76GHz_TM31_cfr8p5_1frame'

end
% NR-TM or PDSCH FRC waveform parameters

flag_FreqRange = 'FR1'

switch flag_FreqRange
    case {'FR1','fr1'}
        ScsKhz = [15, 30, 60]'
        BwMhz = [5,10,15,20,25,30,35,40,45,...
            50,60,70,80,90,100]'
        BwMhz = append(string(num2cell(BwMhz)), 'MHz')'
        CofigTabVar = ["SCSkHz", BwMhz]
        NRBs_5MHz = [25,11,nan]'
        NRBs_10MHz = [52,24,11]'
        NRBs_15MHz = [79,38,18]'
        NRBs_20MHz = [106,51,24]'
        NRBs_25MHz = [133,65,31]'
        NRBs_30MHz = [160,78,38]'
        NRBs_35MHz = [188,92,44]'
        NRBs_40MHz = [216,106,51]'
        NRBs_45MHz = [242,119,58]'
        NRBs_50MHz = [270,133,65]'
        NRBs_60MHz = [nan,162,79]'
        NRBs_70MHz = [nan,189,93]'
        NRBs_80MHz = [nan,217,107]'
        NRBs_90MHz = [nan,245,121]'
        NRBs_100MHz = [nan,273,135]'
        Table_TxBwNrbConfig =  table(ScsKhz,NRBs_5MHz,NRBs_10MHz,NRBs_15MHz,...
            NRBs_20MHz,NRBs_25MHz,NRBs_30MHz,NRBs_35MHz,NRBs_40MHz,NRBs_45MHz,...
            NRBs_50MHz,NRBs_60MHz,NRBs_70MHz,NRBs_80MHz,NRBs_90MHz,NRBs_100MHz,...
            'VariableNames',CofigTabVar)
    case {'FR2','fr2'}
        ScsKhz = [60, 120, 480, 960]'
        BwMhz = [50,100,200,400,800,1600,2000]'
        BwMhz = append(string(num2cell(BwMhz)), 'MHz')'
        CofigTabVar = ["SCSkHz", BwMhz]
        NRBs_50MHz = [66,32,nan,nan]'
        NRBs_100MHz = [132,66,nan,nan]'
        NRBs_200MHz = [264,132,nan,nan]'
        NRBs_400MHz = [nan,264,66,33]'
        NRBs_800MHz = [nan,nan,124,62]'
        NRBs_1600MHz = [nan,nan,248,124]'
        NRBs_2000MHz = [nan,nan,nan,148]'
                Table_TxBwNrbConfig =  table(ScsKhz,NRBs_50MHz,NRBs_100MHz,NRBs_200MHz,...
            NRBs_400MHz,NRBs_800MHz,NRBs_1600MHz,NRBs_2000MHz,...
            'VariableNames',CofigTabVar)
end

switch carrierName
    case '2x50MHz_spacing350MHz_fs983p04MHz'
        if 1
            dlnrref = "NR-FR1-TM3.1";
        else
            dlnrref = "NR-FR1-TM2";
        end
        bw      = "50MHz";
        scs     = "30kHz";
        dm      = "FDD";
        ncellid = 1;
        sv      = "16.7.0";

        Nframes = 1
        fs = 983.04e6

    otherwise
        switch flag_FreqRange
            case 'FR1'
                % Model Name and proerties
                dlnrref = "NR-FR1-TM3.1";
                %             dlnrref = "NR-FR1-TM1.1";
                %             dlnrref = "NR-FR1-TM3.3";
                %             dlnrref = "NR-FR1-TM2";
            case 'FR2'
                %             dlnrref = "NR-FR2-TM3.1a";
                dlnrref = "NR-FR2-TM3.1";
                %             dlnrref = "NR-FR2-TM1.1";
        end

        if 1 % Channel bandwidth
            bw = "100MHz";
            %             bw = "400MHz"
        else
            bw = "60MHz";
            bw = "40MHz";
            bw = "20MHz";
        end

        if 1 % Subcarrier spacing
            scs = "30kHz";
            % scs = "60kHz";
            % scs = "120kHz"
        else
            scs = "15kHz";
        end

        if 1 % Duplexing mode
            dm = "FDD";
        else
            dm = "TDD";
        end

        ncellid = 1;  % NCellID
        sv      = "16.7.0";  % TS 38.141-x version (NR-TM only)

        if 1 % Number of frames (1frame = 1ms = 10subframes)
            Nframes = 1
        else
            Nframes = 2
        end

        if 0 % Sampling frequency
            frf = 5e9; % 2023-01-03, Add frf for Sampling freq. expansion --> Removed
            fs = 983.04e6
            fs = ceil(frf/fs)*fs
        else
            fs = 983.04e6
            % fs = 983.04e6/2
            fs = 983.04e6*2
            % fs = 245.76e6
        end

end

% Create generator object for the above NR-TM/PDSCH FRC reference model
if 1
    % sample reduction by 'Nslot'
    dlrefwavegen = hNRReferenceWaveformGenerator_kc(dlnrref,bw,scs,dm,ncellid,sv);
else
    dlrefwavegen = hNRReferenceWaveformGenerator(dlnrref,bw,scs,dm,ncellid,sv);
end

% Change configuration
if 0
    dlrefwavegen = makeConfigWritable(dlrefwavegen);
end
if 0
    dlrefwavegen.Config.NumSubframes = Nframes*10; % 2023-02-26, Add Nsubframe = 1 default for samples reduction
else
    dlrefwavegen.Config.NumSubframes = 1 % 2023-02-26, Add Nsubframe = 1 default for samples reduction
end
dlrefwavegen.Config.SampleRate = fs;

% Generate waveform
if strcmpi(class(dlrefwavegen), 'hNRReferenceWaveformGenerator_kc')
    switch scs
        case '15kHz'
            NumSlotsPerSubframe = 1
        case '30kHz'
            NumSlotsPerSubframe = 2
        case '60kHz'
            NumSlotsPerSubframe = 4
        case '120kHz'
            NumSlotsPerSubframe = 8
        otherwise
            NumSlotsPerSubframe = 1
    end
    [dlrefwaveform,dlrefwaveinfo,dlresourceinfo] = generateWaveform(dlrefwavegen, ...
        dlrefwavegen.Config.NumSubframes, NumSlotsPerSubframe);
else
    [dlrefwaveform,dlrefwaveinfo,dlresourceinfo] = generateWaveform(dlrefwavegen);
end

% export
NRBs = dlrefwavegen.Config.SCSCarriers{:}.NSizeGrid
SCS = dlrefwavegen.Config.SCSCarriers{:}.SubcarrierSpacing*1e3
% fs = dlrefwaveinfo.Info.SamplingRate % waveform sample rate
if 0
    Nfft = dlrefwaveinfo.Info.Nfft
else
    Nfft = [];
end
x = dlrefwaveform;
x_ref = x;
Nsamps = numel(x)
bwInband = 0.5*[-1 1]*NRBs*SCS*12;
bandwidth = dlrefwavegen.Config.ChannelBandwidth*1e6;
foffset = bandwidth;

if 0
    PLOT_FFT_dB(x, fs, [], 'dBm', [123]);
    x2 = downsample(x,2);
    PLOT_FFT_dB(x2, fs/2, [], 'dBm', [1234]);
    x3 = upsample(x2, 2);
    PLOT_FFT_dB(x3, fs/2, [], 'dBm', [12345]);
end

if 1
    dispLegend = convertStringsToChars([dlnrref+', '+newline+scs+', '+bw])
    dispTitle = strrep(carrierName,'_',' ')
end

% Normalize the waveform to fit the dynamic range of the nonlinearity.
flag_dfe_normalize = 1
if flag_dfe_normalize
    x = x/max(abs(x),[],'all');
end

if 1 % plot
    pause(1)
    % spectrum
    PLOT_FFT_dB(x, fs, [], 'dBm', [11020], {dispLegend, dispTitle});

    pause(1)
    % time
    figure(11030)
    t_ms = (1:Nsamps)/fs*1e3;
    plot(t_ms, abs(x)),
    xlabel('time (ms)'), ylabel('magnitude'), legend(dispLegend, 'Location','southeast')
    xlabel('time (ms)'), ylabel('magnitude'), legend(dispLegend, 'Location','northeast')

    pause(1)
    PARdB_x = PLOT_CCDF(x, numel(x), [11090], char(dispLegend));
end
% Channel filter

flag_def_chf = 1
if flag_def_chf
    fcutoff = 0e6+0.5*NRBs*SCS*12

    f = fcutoff+[-1 1]*1e6+1e6; % tolerance 1MHz
    a = [1 0];
    rp = 0.1;
    rs = 60;
    dev = [(10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)];
    if 1
        [n,fo,ao,w] = firpmord(f,a,dev,fs);
        b = firpm(n,fo,ao,w);
    else
        [n,Wn,beta,ftype] = kaiserord(f,a,dev,fs);
        b = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');
    end

    x_ch = conv(x(:), b(:), 'same');
    evm_ch = evmInband(x, x_ch, fs, fcutoff)

    yyaxis left, PLOT_FFT_dB(b*numel(b), fs, Nfft, [], 7220, 'channel filter', []);
    yyaxis right, PLOT_ACLR_dB(x_ch, fs, bwInband, foffset, 07220, ['evm: ',num2str(round(evm_ch,2))], [], []);
    x = x_ch;
end
% NCO and Carrier combine

flag_dfe_nco = 1
if flag_dfe_nco

    if 0
        fnco = 0
    else
        fnco = [-50e6, 50e6] % input
        % fnco = [-100e6, 100e6] % input
        fnco = [-200e6, 200e6] % input
        MulticarrierSpacing = abs(diff(fnco));
    end

    Ncarriers = numel(fnco);
    if Ncarriers == 1
        dsipLegend_nco = ['NumOfCarrier:',num2str(Ncarriers)]
    else
        dsipLegend_nco = ['NumOfCarrier:',num2str(Ncarriers),...
            ', Spacing:',num2str(MulticarrierSpacing/1e6),'MHz']
    end

    x_nco = nco(x, fnco, fs);
    if 1
        PLOT_FFT_dB(x_nco, fs, Nfft, [], [07221], {['NCO, ', num2str(fnco/1e6), 'MHz'], ['NCO']}, []);
    end
    x = x_nco;

    if Ncarriers==1
        bandwidth = bandwidth;

    else
        n = 1
        bwInband_tmp = [];
        while n <= Ncarriers
            bwInband_tmp = [bwInband_tmp, bwInband + fnco(n)];
            n = n+1;
        end
        bwInband = bwInband_tmp
    end

else
    fnco = 0
    Ncarriers = 1
end
% CFR

flag_dfe_cfr = 1
if flag_dfe_cfr
    cfrdB = 8.5 % input
    if 0
        ratio = fix((fs/2)/max(abs(bwInband)))
    else
        disp('CFR decimation ratio, large ratio cause to lots of iteration times and EVM worse!')
        ratio = 2 % decimation process ratio
    end
    if 0
        % channel filter based on fs/ratio
        ftrans = 0.5e6
        bCFR = firGen([], fs, fcutoff, ftrans, 'LPF', 'eqrip', [0.1, 50], []);
        ratio = 1;
        [x_clip,PARdB_x,evm_cfr] = cfrNCO(x, cfrdB, bCFR, fs, 100, fnco, ratio, 7192);
    else
        [x_clip,PARdB_x,evm_cfr] = cfrNCO(x, cfrdB, fcutoff, fs, 100, fnco, ratio, [7192]);
    end

    if 1
        PLOT_ACLR_dB(x_clip, fs, bwInband, foffset, [07222], {['CFR ',num2str(cfrdB),'dB']}, [], []);
    end
    x = x_clip;

end

% Assign target power

flag_def_fullscale = 'dBfs'
pwrdB_target = -15 % input
switch flag_def_fullscale
    case 'dBfs'
        [x_adj, pwrdBFs_x] = pwrdB_adj(x, pwrdB_target,'dBfs',16);
        x = x_adj;
    case 'dBm'
        [x_adj, pwrdBm_x] = pwrdB_adj(x, pwrdB_target,'dBm');
        x = x_adj;
end
% Fixed point ?

flag_dfe_FixedPoint = 0
if flag_dfe_FixedPoint
    IQ = fix(x(1:end));
    PLOT_ACLR_dB(IQ, fs, bwInband, foffset, 010901, {['fixed points - '], [dispTitle]}, [], []);
    PARdB_x = PLOT_CCDF(IQ, numel(IQ), [010902], 'fixed points');
end
% Demodulation and EVM 

flag_dfe_normalize = 0
if flag_dfe_normalize
    % Normalize the waveform to fit the dynamic range of the nonlinearity.
    x = x/max(abs(x),[],'all');
end

flag_nr_save = 0
if flag_nr_save
    IQ = x;
    IQ_info = dlrefwaveinfo;
    IQ_info.Info.bandwidth = bandwidth;
    IQ_info.Info.fnco = fnco;
    IQ_info.Info.cfrdB = cfrdB;
    %     IQ_info.Info.cfrdB = pwrdB_target
    IQ_info.Info.Nbits = flag_def_fullscale;
    IQ_info.Carrier = dispTitle;
    if 0
        save([flag_carrier,'.mat'],'IQ','IQ_info')
    else
        save([carrierName,'.mat'],'IQ','IQ_info')
    end
end

flag_nr_evm = 0
if flag_nr_evm
    if flag_dfe_nco
        x_nco2 = zeros(Nsamps,Ncarriers);
        rxWaveform = x_nco2;
        for k = 1:Ncarriers
            x_nco2(:,k) = x.*exp(-1i*2*pi*fnco(k)*[0:Nsamps-1]'/fs);
            x_ch2(:,k) = conv(x_nco2(:,k), b(:), 'same');
            PLOT_FFT_dB(x_ch2(:,k), fs, Nfft, [], 07223, 'NCO');
            PLOT_FFT_dB(b, fs, Nfft, [], 07223, 'NCO');
            rxWaveform(:,k) = x_ch2(:,k);
        end
    else
        rxWaveform = x;
    end

    if 0
        ref = x_ch;
        mea = rxWaveform(:,1);
        evmInband(ref, mea, fs, b_fir*[-1 1])
    end

    if 1
        evm3GPP = false; % |evm3GPP| is disabled for PDCCH EVM measurement.
        targetRNTIs = []; % The example calculates the PDSCH EVM for the RNTIs listed above. To override the default PDSCH RNTIs, specify the |targetRNTIs| vector
        plotEVM = true;
        displayEVM = true;
    end
    cfg = struct();
    cfg.Evm3GPP = evm3GPP;
    cfg.TargetRNTIs = targetRNTIs;
    cfg.PlotEVM = plotEVM;
    cfg.DisplayEVM = displayEVM;
    cfg.Label = dlrefwavegen.ConfiguredModel{1};

    for k =1:Ncarriers
        % Compute and display EVM measurements
        [evmInfo,eqSym,refSym] = hNRDownlinkEVM_k(dlrefwavegen.Config,rxWaveform(:,k),cfg);
        evm_PDCCH_RMS(k) = 100*evmInfo.PDCCH.OverallEVM.RMS
        evm_PDSCH_RMS(k) = 100*evmInfo.PDSCH.OverallEVM.RMS
    end

    if 0
        disp('evm solve is based on FREQUENCY DOMAIN')
        rxWaveform2 = downsample(rxWaveform,2);
        rxWaveform3 = upsample(rxWaveform2,2);

        PLOT_FFT_dB(rxWaveform, fs, Nfft, [], 020402, 'rxWaveform');
        PLOT_FFT_dB(rxWaveform2, fs/2, Nfft, [], 020401, 'downsample 2');
        PLOT_FFT_dB(rxWaveform3, fs, Nfft, [], 020403, 'upsample 2');

        [evmInfo,eqSym,refSym] = hNRDownlinkEVM_k(dlrefwavegen.Config,rxWaveform3,cfg);
    end
end