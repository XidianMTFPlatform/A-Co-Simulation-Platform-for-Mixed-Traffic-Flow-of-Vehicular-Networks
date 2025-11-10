# A-Co-Simulation-Platform-for-Mixed-Traffic-Flow-of-Vehicular-Networks
Code for 'A Co-Simulation Platform for Mixed Traffic Flow of Vehicular Networks'
# Simu5G
5G NR and LTE/LTE-A user-plane simulation model, compatible with the INET Framework. 
Website: http://simu5g.org
https://1drv.ms/u/c/8ab44f8acf07f410/EQxFypVEnVNNl6tA-Fi2xaoBLHCGRceioFpxBuOdimSWKQ?email=zhiyi%40stu.xidian.edu.cn&e=klsq17
# Dependencies
This version requires:
  + OMNeT++ 6.0.3 or later
  + INET 4.5 or later
# Simu5G Features
General
+ eNodeB, gNodeB and UE models
+ Full LTE and NR protocol stack
+ Simple PGW/UPF model implementing GTP protocol

PDCP-RRC
+ Header compression/decompression
+ Logical connection establishment and maintenance
+ E-UTRA/NR Dual connectivity
+ Split Bearer

RLC
+ Multiplexing/Demultiplexing of MAC SDUs
+ UM, (AM and TM testing) modes

MAC
+ HARQ functionalities
+ Allocation management
+ AMC
+ Scheduling Policies (MAX C/I, Proportional Fair, DRR)
+ Carrier Aggregation
+ Support to multiple numerologies
+ Flexible TDD/FDD

PHY
+ Channel Feedback management
+ Realistic 3GPP channel model with
+ inter-cell interference
+ path-loss
+ fast fading
+ shadowing
+ (an)isotropic antennas

Advanced features
+ X2 communication support
+ X2-based handover
+ CoMP Coordinated Scheduling support
+ Device-to-device communications
+ Support for vehicular mobility (integration with Veins 5.2)
+ ETSI-compliant model of Multi-access Edge Computing (MEC) systems

Applications
+ Voice-over-IP (VoIP)
+ Constant Bit Rate (CBR)
+ Trace-based Video-on-demand (VoD)
+ Burst
