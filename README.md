# FAE_test
my solution of Interview test for FAE position at ACON, Inc. 


file architecture
home .
|──├── housekeeping                  # housekeeping feature
|      |── housekeeping.sh           # housekeeping script, Use shell script to implement
|      └── housekeeping_config.ini   # housekeeping config
|──├── logs                          # Test Objectives 2, Every executed script needs to generate a log every time
|      └── system_monitor
|        └── system_monitor-2023-10-16.log  #Format of log: [YYYY-MM-DD HH:mm:ss.us] INFO;CPU;”CPU%”;Mem;”Mem%”;Disk;”Disk%”
|──├── system_monitor                # Test Objectives 2, Write a monitor script and set up a cronjob for every minute
|      └── monitor.sh                # System resource usage feature, Use shell script to implement
|──├── web_service                   # Test Objectives 1, Install web service 
|      ├── info.php
|      └── system_monitor.txt
|──├── cron.conf                    # cronjob config file.
|──├── http.pcap                    # tcpdump file.
└── README.md
