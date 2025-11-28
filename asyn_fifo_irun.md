tool: incisive
## commands:
1. ll
2. cd Desktop
3. cd abc
4. cd asynchronous_fifo
5. [buet@cadence asynchronous_fifo]$ ll
    total 16
    drwxrwxr-x. 2 buet buet 4096 Nov 27 23:34 asyn_fifo_sim
    -rw-rw-r--. 1 buet buet 2625 Nov 27 23:06 asyn_fifo_tb.v
    -rw-rw-r--. 1 buet buet 4118 Nov 27 23:05 asyn_fifo.v
6. [buet@cadence asynchronous_fifo]$ irun asyn_fifo_tb.v asyn_fifo.v


## incisive.log:
irun: 10.20-s100: (c) Copyright 1995-2011 Cadence Design Systems, Inc.  
TOOL:	irun	10.20-s100: Started on Nov 27, 2025 at 23:35:13 BDT  
irun  
	asyn_fifo_tb.v  
	asyn_fifo.v  
file: asyn_fifo_tb.v  
	module worklib.asyn_FIFO_tb:v  
		errors: 0, warnings: 0  
file: asyn_fifo.v  
	module worklib.asyn_FIFO:v  
		errors: 0, warnings: 0  
		Caching library 'worklib' ....... Done  
	Elaborating the design hierarchy:  
	Top level design units:  
		asyn_FIFO_tb  
	Building instance overlay tables: .................... Done  
	Generating native compiled code:  
		worklib.asyn_FIFO:v <0x1087bf24>  
			streams:  15, words:  3595  
		worklib.asyn_FIFO_tb:v <0x72feebf8>  
			streams:   9, words:  7525  
	Loading native compiled code:     .................... Done  
	Building instance specific data structures.  
	Design hierarchy summary:  
		                 Instances  Unique  
		Modules:                 2       2  
		Registers:              17      17  
		Scalar wires:            8       -  
		Vectored wires:          2       -  
		Always blocks:           6       6  
		Initial blocks:          1       1  
		Cont. assignments:       2       2  
		Pseudo assignments:      5       5  
		Simulation timescale:  1ps  
	Writing initial simulation snapshot: worklib.asyn_FIFO_tb:v  
Loading snapshot worklib.asyn_FIFO_tb:v .................... Done  
ncsim> source /home/buet/cadence/installs/INCISIV102/tools/inca/files/ncsimrc
ncsim> run  
                   0	 wr_en=0, wr_data=0, rd_en=0, rd_data=x, full=x, empty=x  
                   7	 wr_en=0, wr_data=0, rd_en=0, rd_data=0, full=x, empty=x  
                  21	 wr_en=0, wr_data=0, rd_en=0, rd_data=0, full=x, empty=1  
                  25	 wr_en=0, wr_data=0, rd_en=0, rd_data=0, full=0, empty=1  
                  45	 wr_en=1, wr_data=24, rd_en=0, rd_data=0, full=0, empty=1  
                  55	 wr_en=1, wr_data=81, rd_en=0, rd_data=0, full=0, empty=1  
                  63	 wr_en=1, wr_data=81, rd_en=0, rd_data=0, full=0, empty=0  
                  65	 wr_en=1, wr_data=9, rd_en=0, rd_data=0, full=0, empty=0  
                  75	 wr_en=1, wr_data=63, rd_en=0, rd_data=0, full=0, empty=0  
                  85	 wr_en=1, wr_data=d, rd_en=0, rd_data=0, full=0, empty=0  
                  95	 wr_en=1, wr_data=8d, rd_en=0, rd_data=0, full=0, empty=0  
                 105	 wr_en=1, wr_data=65, rd_en=0, rd_data=0, full=0, empty=0  
                 115	 wr_en=1, wr_data=12, rd_en=0, rd_data=0, full=0, empty=0  
                 125	 wr_en=1, wr_data=1, rd_en=0, rd_data=0, full=0, empty=0  
                 135	 wr_en=1, wr_data=d, rd_en=0, rd_data=0, full=0, empty=0  
                 145	 wr_en=1, wr_data=76, rd_en=0, rd_data=0, full=0, empty=0  
                 155	 wr_en=1, wr_data=3d, rd_en=0, rd_data=0, full=0, empty=0  
                 165	 wr_en=1, wr_data=ed, rd_en=0, rd_data=0, full=0, empty=0  
                 175	 wr_en=1, wr_data=8c, rd_en=0, rd_data=0, full=0, empty=0  
                 185	 wr_en=1, wr_data=f9, rd_en=0, rd_data=0, full=0, empty=0  
                 195	 wr_en=1, wr_data=c6, rd_en=0, rd_data=0, full=1, empty=0  
                 205	 wr_en=0, wr_data=c6, rd_en=0, rd_data=0, full=1, empty=0  
                 217	 wr_en=0, wr_data=c6, rd_en=1, rd_data=24, full=1, empty=0  
                 231	 wr_en=0, wr_data=c6, rd_en=1, rd_data=81, full=1, empty=0  
                 235	 wr_en=0, wr_data=c6, rd_en=1, rd_data=81, full=0, empty=0   
                 245	 wr_en=0, wr_data=c6, rd_en=1, rd_data=9, full=0, empty=0  
                 259	 wr_en=0, wr_data=c6, rd_en=1, rd_data=63, full=0, empty=0  
                 273	 wr_en=0, wr_data=c6, rd_en=1, rd_data=d, full=0, empty=0  
                 287	 wr_en=0, wr_data=c6, rd_en=1, rd_data=8d, full=0, empty=0  
                 301	 wr_en=0, wr_data=c6, rd_en=1, rd_data=65, full=0, empty=0  
                 315	 wr_en=0, wr_data=c6, rd_en=1, rd_data=12, full=0, empty=0  
                 329	 wr_en=0, wr_data=c6, rd_en=1, rd_data=1, full=0, empty=0  
                 343	 wr_en=0, wr_data=c6, rd_en=1, rd_data=d, full=0, empty=0  
                 357	 wr_en=0, wr_data=c6, rd_en=1, rd_data=76, full=0, empty=0  
                 371	 wr_en=0, wr_data=c6, rd_en=1, rd_data=3d, full=0, empty=0  
                 385	 wr_en=0, wr_data=c6, rd_en=1, rd_data=ed, full=0, empty=0  
                 399	 wr_en=0, wr_data=c6, rd_en=1, rd_data=8c, full=0, empty=0  
                 413	 wr_en=0, wr_data=c6, rd_en=1, rd_data=f9, full=0, empty=0  
                 427	 wr_en=0, wr_data=c6, rd_en=1, rd_data=c6, full=0, empty=1  
                 441	 wr_en=0, wr_data=c6, rd_en=0, rd_data=c6, full=0, empty=1  
Simulation complete via $finish(1) at time 471 NS + 0  
./asyn_fifo_tb.v:79         $finish;  
ncsim> exit  
TOOL:	irun	10.20-s100: Exiting on Nov 27, 2025 at 23:35:17 BDT  (total: 00:00:04)  
