# DSP of NR Test Model Signal Generator 
## Summary of simulation
  - Summary_PA vs DPD.md
  - Summary_DPD coefs. applied vs Waveform.md
  - Summary_DPD coefs. applied vs PA.md

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
  ```js
  cfrdB = 8.5 % input
  ```
  - Assign target power
  ```js
  flag_def_fullscale = 'dBfs'
  pwrdB_target = -15 % input
  ```
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
