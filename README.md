# DSP of NR Test Model Signal Generator 
## Summary of simulation
<img src="https://user-images.githubusercontent.com/87049112/226227322-193bd0cb-974c-423a-a995-c5f428c9c972.png" width="50%">


## Main: NRTestModelWaveformGeneration_main_k
  - NR-TM or PDSCH FRC waveform parameters
  ```js
  flag_FreqRange = 'FR1' 
  dlnrref = "NR-FR1-TM3.1";   
  bw = "100MHz";
  scs = "30kHz";
  dm = "FDD";
  ncellid = 1;  % NCellID
  sv      = "16.7.0";  % TS 38.141-x version (NR-TM only)
  Nframes = 1
  ```
  - Channel filter
  ```js
  fcutoff = 0e6+0.5*NRBs*SCS*12
  f = fcutoff+[-1 1]*1e6+1e6; % tolerance 1MHz
  a = [1 0];
  rp = 0.1;
  rs = 60;
  ```
  - NCO and Carrier combine
  ```js
  fnco = [-200e6, 200e6]
  ```
  - CFR
    * channnel filter and decimation process ratio
  ```js
  ratio = 2 % decimation process ratio
  cfrdB = 8.5 % input
  ```
  <img src="https://user-images.githubusercontent.com/87049112/226224674-78855fec-e69f-4b21-8f47-a34e411a6eb8.png" width="50%">
  <img src="https://user-images.githubusercontent.com/87049112/226225097-4d9082b6-7e21-4b98-a347-c80943fef511.png" width="50%">

  - Assign target power
  ```js
  flag_def_fullscale = 'dBfs'
  pwrdB_target = -15 % input
  ```
  - Demodulation and EVM
    * nco
    * evm3GPP
    ```js
    cfg = struct();
    cfg.Evm3GPP = evm3GPP;
    cfg.TargetRNTIs = targetRNTIs;
    cfg.PlotEVM = plotEVM;
    cfg.DisplayEVM = displayEVM;
    cfg.Label = dlrefwavegen.ConfiguredModel{1};
    ```
  <img src="https://user-images.githubusercontent.com/87049112/226225751-2ed9c827-99ce-49b2-9ce3-8838ca60f465.png" width="50%">


  
  
  
  
  
  
  
  
  
  
  
  
  
  
