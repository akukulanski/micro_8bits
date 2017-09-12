###################################################################

# Created by write_floorplan on Thu Nov 19 20:55:11 2015

###################################################################
undo_config -disable

remove_die_area 

create_die_area  \
	-poly {	{0.000 0.000} {121.040 0.000} {121.040 65.600} {0.000 65.600} {0.000 0.000}} 
set oldSnapState [set_object_snap_type -enabled false]

#********************
#    Terminals     
# obj#: 43 
# objects are in clockwise ordering 
#********************

remove_terminal *

create_terminal \
	-name {ram_data_rd[4]} \
	-port {ram_data_rd[4]} \
	-layer M2 \
	-bbox {{3.260 0.000} {3.540 0.280}}

set obj [get_terminal {"ram_data_rd[4]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_rd[4]}
set_attribute -quiet $obj bbox {{3.260 0.000} {3.540 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[3]} \
	-port {ram_data_rd[3]} \
	-layer M2 \
	-bbox {{12.780 0.000} {13.060 0.280}}

set obj [get_terminal {"ram_data_rd[3]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_rd[3]}
set_attribute -quiet $obj bbox {{12.780 0.000} {13.060 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[2]} \
	-port {ram_data_rd[2]} \
	-layer M2 \
	-bbox {{22.300 0.000} {22.580 0.280}}

set obj [get_terminal {"ram_data_rd[2]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_rd[2]}
set_attribute -quiet $obj bbox {{22.300 0.000} {22.580 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[1]} \
	-port {ram_data_rd[1]} \
	-layer M2 \
	-bbox {{31.820 0.000} {32.100 0.280}}

set obj [get_terminal {"ram_data_rd[1]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_rd[1]}
set_attribute -quiet $obj bbox {{31.820 0.000} {32.100 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[0]} \
	-port {ram_data_rd[0]} \
	-layer M2 \
	-bbox {{41.340 0.000} {41.620 0.280}}

set obj [get_terminal {"ram_data_rd[0]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_rd[0]}
set_attribute -quiet $obj bbox {{41.340 0.000} {41.620 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[7]} \
	-port {ram_data_wr[7]} \
	-layer M2 \
	-bbox {{50.860 0.000} {51.140 0.280}}

set obj [get_terminal {"ram_data_wr[7]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[7]}
set_attribute -quiet $obj bbox {{50.860 0.000} {51.140 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[6]} \
	-port {ram_data_wr[6]} \
	-layer M2 \
	-bbox {{60.380 0.000} {60.660 0.280}}

set obj [get_terminal {"ram_data_wr[6]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[6]}
set_attribute -quiet $obj bbox {{60.380 0.000} {60.660 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[5]} \
	-port {ram_data_wr[5]} \
	-layer M2 \
	-bbox {{69.900 0.000} {70.180 0.280}}

set obj [get_terminal {"ram_data_wr[5]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[5]}
set_attribute -quiet $obj bbox {{69.900 0.000} {70.180 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[4]} \
	-port {ram_data_wr[4]} \
	-layer M2 \
	-bbox {{79.420 0.000} {79.700 0.280}}

set obj [get_terminal {"ram_data_wr[4]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[4]}
set_attribute -quiet $obj bbox {{79.420 0.000} {79.700 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[3]} \
	-port {ram_data_wr[3]} \
	-layer M2 \
	-bbox {{88.940 0.000} {89.220 0.280}}

set obj [get_terminal {"ram_data_wr[3]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[3]}
set_attribute -quiet $obj bbox {{88.940 0.000} {89.220 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[2]} \
	-port {ram_data_wr[2]} \
	-layer M2 \
	-bbox {{98.460 0.000} {98.740 0.280}}

set obj [get_terminal {"ram_data_wr[2]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[2]}
set_attribute -quiet $obj bbox {{98.460 0.000} {98.740 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[1]} \
	-port {ram_data_wr[1]} \
	-layer M2 \
	-bbox {{107.980 0.000} {108.260 0.280}}

set obj [get_terminal {"ram_data_wr[1]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[1]}
set_attribute -quiet $obj bbox {{107.980 0.000} {108.260 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_wr[0]} \
	-port {ram_data_wr[0]} \
	-layer M2 \
	-bbox {{117.500 0.000} {117.780 0.280}}

set obj [get_terminal {"ram_data_wr[0]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_data_wr[0]}
set_attribute -quiet $obj bbox {{117.500 0.000} {117.780 0.280}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[3]} \
	-port {rom_addr[3]} \
	-layer M3 \
	-bbox {{0.000 62.060} {0.280 62.340}}

set obj [get_terminal {"rom_addr[3]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {rom_addr[3]}
set_attribute -quiet $obj bbox {{0.000 62.060} {0.280 62.340}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[4]} \
	-port {rom_addr[4]} \
	-layer M3 \
	-bbox {{0.000 53.660} {0.280 53.940}}

set obj [get_terminal {"rom_addr[4]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {rom_addr[4]}
set_attribute -quiet $obj bbox {{0.000 53.660} {0.280 53.940}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[5]} \
	-port {rom_addr[5]} \
	-layer M3 \
	-bbox {{0.000 45.260} {0.280 45.540}}

set obj [get_terminal {"rom_addr[5]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {rom_addr[5]}
set_attribute -quiet $obj bbox {{0.000 45.260} {0.280 45.540}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[6]} \
	-port {rom_addr[6]} \
	-layer M3 \
	-bbox {{0.000 36.860} {0.280 37.140}}

set obj [get_terminal {"rom_addr[6]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {rom_addr[6]}
set_attribute -quiet $obj bbox {{0.000 36.860} {0.280 37.140}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[7]} \
	-port {rom_addr[7]} \
	-layer M3 \
	-bbox {{0.000 28.460} {0.280 28.740}}

set obj [get_terminal {"rom_addr[7]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {rom_addr[7]}
set_attribute -quiet $obj bbox {{0.000 28.460} {0.280 28.740}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_wr_en} \
	-port {ram_wr_en} \
	-layer M3 \
	-bbox {{0.000 20.060} {0.280 20.340}}

set obj [get_terminal {"ram_wr_en"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_wr_en}
set_attribute -quiet $obj bbox {{0.000 20.060} {0.280 20.340}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {arst} \
	-port {arst} \
	-layer M3 \
	-bbox {{0.000 11.660} {0.280 11.940}}

set obj [get_terminal {"arst"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {arst}
set_attribute -quiet $obj bbox {{0.000 11.660} {0.280 11.940}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {clk} \
	-port {clk} \
	-layer M3 \
	-bbox {{0.000 3.260} {0.280 3.540}}

set obj [get_terminal {"clk"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {clk}
set_attribute -quiet $obj bbox {{0.000 3.260} {0.280 3.540}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[2]} \
	-port {rom_addr[2]} \
	-layer M2 \
	-bbox {{3.260 65.320} {3.540 65.600}}

set obj [get_terminal {"rom_addr[2]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_addr[2]}
set_attribute -quiet $obj bbox {{3.260 65.320} {3.540 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[1]} \
	-port {rom_addr[1]} \
	-layer M2 \
	-bbox {{12.220 65.320} {12.500 65.600}}

set obj [get_terminal {"rom_addr[1]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_addr[1]}
set_attribute -quiet $obj bbox {{12.220 65.320} {12.500 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_addr[0]} \
	-port {rom_addr[0]} \
	-layer M2 \
	-bbox {{20.620 65.320} {20.900 65.600}}

set obj [get_terminal {"rom_addr[0]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_addr[0]}
set_attribute -quiet $obj bbox {{20.620 65.320} {20.900 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[7]} \
	-port {rom_data[7]} \
	-layer M2 \
	-bbox {{29.580 65.320} {29.860 65.600}}

set obj [get_terminal {"rom_data[7]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[7]}
set_attribute -quiet $obj bbox {{29.580 65.320} {29.860 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[6]} \
	-port {rom_data[6]} \
	-layer M2 \
	-bbox {{38.540 65.320} {38.820 65.600}}

set obj [get_terminal {"rom_data[6]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[6]}
set_attribute -quiet $obj bbox {{38.540 65.320} {38.820 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[5]} \
	-port {rom_data[5]} \
	-layer M2 \
	-bbox {{46.940 65.320} {47.220 65.600}}

set obj [get_terminal {"rom_data[5]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[5]}
set_attribute -quiet $obj bbox {{46.940 65.320} {47.220 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[4]} \
	-port {rom_data[4]} \
	-layer M2 \
	-bbox {{55.900 65.320} {56.180 65.600}}

set obj [get_terminal {"rom_data[4]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[4]}
set_attribute -quiet $obj bbox {{55.900 65.320} {56.180 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[3]} \
	-port {rom_data[3]} \
	-layer M2 \
	-bbox {{64.860 65.320} {65.140 65.600}}

set obj [get_terminal {"rom_data[3]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[3]}
set_attribute -quiet $obj bbox {{64.860 65.320} {65.140 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[2]} \
	-port {rom_data[2]} \
	-layer M2 \
	-bbox {{73.820 65.320} {74.100 65.600}}

set obj [get_terminal {"rom_data[2]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[2]}
set_attribute -quiet $obj bbox {{73.820 65.320} {74.100 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[1]} \
	-port {rom_data[1]} \
	-layer M2 \
	-bbox {{82.220 65.320} {82.500 65.600}}

set obj [get_terminal {"rom_data[1]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[1]}
set_attribute -quiet $obj bbox {{82.220 65.320} {82.500 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {rom_data[0]} \
	-port {rom_data[0]} \
	-layer M2 \
	-bbox {{91.180 65.320} {91.460 65.600}}

set obj [get_terminal {"rom_data[0]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {rom_data[0]}
set_attribute -quiet $obj bbox {{91.180 65.320} {91.460 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[7]} \
	-port {ram_addr[7]} \
	-layer M2 \
	-bbox {{100.140 65.320} {100.420 65.600}}

set obj [get_terminal {"ram_addr[7]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_addr[7]}
set_attribute -quiet $obj bbox {{100.140 65.320} {100.420 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[6]} \
	-port {ram_addr[6]} \
	-layer M2 \
	-bbox {{108.540 65.320} {108.820 65.600}}

set obj [get_terminal {"ram_addr[6]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_addr[6]}
set_attribute -quiet $obj bbox {{108.540 65.320} {108.820 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[5]} \
	-port {ram_addr[5]} \
	-layer M2 \
	-bbox {{117.500 65.320} {117.780 65.600}}

set obj [get_terminal {"ram_addr[5]"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {ram_addr[5]}
set_attribute -quiet $obj bbox {{117.500 65.320} {117.780 65.600}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[4]} \
	-port {ram_addr[4]} \
	-layer M3 \
	-bbox {{120.760 3.260} {121.040 3.540}}

set obj [get_terminal {"ram_addr[4]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_addr[4]}
set_attribute -quiet $obj bbox {{120.760 3.260} {121.040 3.540}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[3]} \
	-port {ram_addr[3]} \
	-layer M3 \
	-bbox {{120.760 11.660} {121.040 11.940}}

set obj [get_terminal {"ram_addr[3]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_addr[3]}
set_attribute -quiet $obj bbox {{120.760 11.660} {121.040 11.940}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[2]} \
	-port {ram_addr[2]} \
	-layer M3 \
	-bbox {{120.760 20.060} {121.040 20.340}}

set obj [get_terminal {"ram_addr[2]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_addr[2]}
set_attribute -quiet $obj bbox {{120.760 20.060} {121.040 20.340}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[1]} \
	-port {ram_addr[1]} \
	-layer M3 \
	-bbox {{120.760 28.460} {121.040 28.740}}

set obj [get_terminal {"ram_addr[1]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_addr[1]}
set_attribute -quiet $obj bbox {{120.760 28.460} {121.040 28.740}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_addr[0]} \
	-port {ram_addr[0]} \
	-layer M3 \
	-bbox {{120.760 36.860} {121.040 37.140}}

set obj [get_terminal {"ram_addr[0]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_addr[0]}
set_attribute -quiet $obj bbox {{120.760 36.860} {121.040 37.140}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction output
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[7]} \
	-port {ram_data_rd[7]} \
	-layer M3 \
	-bbox {{120.760 45.260} {121.040 45.540}}

set obj [get_terminal {"ram_data_rd[7]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_data_rd[7]}
set_attribute -quiet $obj bbox {{120.760 45.260} {121.040 45.540}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[6]} \
	-port {ram_data_rd[6]} \
	-layer M3 \
	-bbox {{120.760 53.660} {121.040 53.940}}

set obj [get_terminal {"ram_data_rd[6]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_data_rd[6]}
set_attribute -quiet $obj bbox {{120.760 53.660} {121.040 53.940}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

create_terminal \
	-name {ram_data_rd[5]} \
	-port {ram_data_rd[5]} \
	-layer M3 \
	-bbox {{120.760 62.060} {121.040 62.340}}

set obj [get_terminal {"ram_data_rd[5]"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {ram_data_rd[5]}
set_attribute -quiet $obj bbox {{120.760 62.060} {121.040 62.340}}
set_attribute -quiet $obj status Unplaced
set_attribute -quiet $obj access_direction Up
set_attribute -quiet $obj direction input
set_attribute -quiet $obj eeq_class 0

#**************
#  std cell  
# obj#: 85 
# objects are in alphabetical ordering 
#**************


set obj [get_cells {"U16"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {131.320 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U17"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {133.920 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U19"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {136.520 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U21"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {139.120 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U23"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {141.720 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U25"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {144.320 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U27"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {146.920 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U29"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {149.520 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U31"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {152.120 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U33"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {154.720 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U35"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {157.320 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U37"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {159.920 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U39"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {162.520 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U41"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {165.120 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U43"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {167.720 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U45"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {170.320 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U47"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {172.920 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"U49"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {175.520 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U10"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {188.320 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U11"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {192.600 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U12"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {196.880 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U13"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {199.480 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U4"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {162.640 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U5"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {166.920 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U6"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {171.200 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U7"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {175.480 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U8"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {179.760 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/U9"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {184.040 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[0]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {200.360 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[1]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {152.200 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[2]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {141.760 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[3]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {131.320 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[4]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {242.120 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[5]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {231.680 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[6]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {221.240 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/acc_reg[7]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {210.800 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/clk_gate_acc_reg/U5"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {218.680 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/clk_gate_acc_reg/latch"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {209.920 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/clk_gate_acc_reg/main_gate"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {201.360 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"acum0/clk_gate_acc_reg/test_or"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {205.640 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ctrl_unit0/U3"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {234.120 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ctrl_unit0/U5"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {224.640 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ctrl_unit0/U6"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {227.800 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ctrl_unit0/U7"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {230.960 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ctrl_unit0/state_reg[0]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {203.760 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ctrl_unit0/state_reg[1]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {214.200 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U10"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {163.520 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U11"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {168.360 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U12"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {171.520 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U13"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {174.680 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U14"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {178.400 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U15"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {183.240 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U16"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {186.400 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U18"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {191.240 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U19"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {195.520 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U3"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {141.760 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U4"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {144.360 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U6"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {147.520 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U7"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {152.360 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U8"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {156.640 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/U9"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {159.800 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/clk_gate_pc_reg/U5"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {198.760 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/clk_gate_pc_reg/latch"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {190.000 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/clk_gate_pc_reg/main_gate"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {181.440 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/clk_gate_pc_reg/test_or"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {185.720 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[0]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {182.400 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[1]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {192.840 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[2]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {224.160 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[3]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {203.280 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[4]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {213.720 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[5]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {234.600 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[6]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {245.040 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"pc0/pc_reg[7]"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {131.320 17.000}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U1"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {237.280 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U2"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {241.560 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U3"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {245.840 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U4"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {250.120 33.720}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U5"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {131.320 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U6"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {135.600 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U7"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {139.880 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"ram_buf0/U8"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {144.160 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"rst_sync0/U2"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {178.120 0.280}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"rst_sync0/ffd_set_array[0].ffd_i/q_reg"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {148.440 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"rst_sync0/ffd_set_array[1].ffd_i/q_reg"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {159.440 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

set obj [get_cells {"rst_sync0/ffd_set_array[2].ffd_i/q_reg"} -all]
set_attribute -quiet $obj orientation N
set_attribute -quiet $obj origin {170.440 50.440}
set_attribute -quiet $obj is_placed false
set_attribute -quiet $obj is_fixed false
set_attribute -quiet $obj is_soft_fixed false
set_attribute -quiet $obj eco_status eco_reset

#***********
#  Track  
# obj#: 16 
# objects are in arbitrary ordering 
#***********

remove_preferred_routing_direction -layer M1
remove_track -layer M1 -dir Y
remove_track -layer M1 -dir X
set_preferred_routing_direction -layer M1 -dir horizontal

remove_preferred_routing_direction -layer M2
remove_track -layer M2 -dir Y
remove_track -layer M2 -dir X
set_preferred_routing_direction -layer M2 -dir vertical

remove_preferred_routing_direction -layer M3
remove_track -layer M3 -dir Y
remove_track -layer M3 -dir X
set_preferred_routing_direction -layer M3 -dir horizontal

remove_preferred_routing_direction -layer M4
remove_track -layer M4 -dir Y
remove_track -layer M4 -dir X
set_preferred_routing_direction -layer M4 -dir vertical

remove_preferred_routing_direction -layer MT
remove_track -layer MT -dir Y
remove_track -layer MT -dir X
set_preferred_routing_direction -layer MT -dir horizontal

remove_preferred_routing_direction -layer AM
remove_track -layer AM -dir Y
remove_track -layer AM -dir X
set_preferred_routing_direction -layer AM -dir vertical


create_track \
	-layer M1 \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer M2 \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer M2 \
	-dir X \
	-coord 0.600 \
	-space 0.560 \
	-count 215 \
	-bounding_box {{0.600 0.000} {120.440 65.600}}

create_track \
	-layer M1 \
	-dir X \
	-coord 0.600 \
	-space 0.560 \
	-count 215 \
	-bounding_box {{0.600 0.000} {120.440 65.600}}

create_track \
	-layer M3 \
	-dir X \
	-coord 0.600 \
	-space 0.560 \
	-count 215 \
	-bounding_box {{0.600 0.000} {120.440 65.600}}

create_track \
	-layer M3 \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer M2 \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer M4 \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer M4 \
	-dir X \
	-coord 0.600 \
	-space 0.560 \
	-count 215 \
	-bounding_box {{0.600 0.000} {120.440 65.600}}

create_track \
	-layer M3 \
	-dir X \
	-coord 0.600 \
	-space 0.560 \
	-count 215 \
	-bounding_box {{0.600 0.000} {120.440 65.600}}

create_track \
	-layer MT \
	-dir X \
	-coord 0.600 \
	-space 0.560 \
	-count 215 \
	-bounding_box {{0.600 0.000} {120.440 65.600}}

create_track \
	-layer MT \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer M4 \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer AM \
	-dir Y \
	-coord 0.600 \
	-space 0.560 \
	-count 116 \
	-bounding_box {{0.000 0.600} {121.040 65.000}}

create_track \
	-layer AM \
	-dir X \
	-coord 9.000 \
	-space 7.280 \
	-count 15 \
	-bounding_box {{9.000 0.000} {110.920 65.600}}

create_track \
	-layer MT \
	-dir X \
	-coord 9.000 \
	-space 7.280 \
	-count 15 \
	-bounding_box {{9.000 0.000} {110.920 65.600}}

#*********
#  Row  
# obj#: 5 
# objects are in arbitrary ordering 
#*********

remove_base_array -all

create_base_array  \
	-tile_name unit  \
	-direction horizontal \
	-coordinate {{16.000 16.000} {105.040 49.600}} 

cut_row -all

add_row  \
	-tile_name unit \
	-direction horizontal \
	-snap_to_row_direction none \
	-snap_to_orthogonal_row_direction none \
	-allow_overlap \
	-within {{16.000 16.000} {105.040 22.720}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-snap_to_row_direction none \
	-snap_to_orthogonal_row_direction none \
	-flip_first_row \
	-allow_overlap \
	-within {{16.000 22.720} {105.040 29.440}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-snap_to_row_direction none \
	-snap_to_orthogonal_row_direction none \
	-allow_overlap \
	-within {{16.000 29.440} {105.040 36.160}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-snap_to_row_direction none \
	-snap_to_orthogonal_row_direction none \
	-flip_first_row \
	-allow_overlap \
	-within {{16.000 36.160} {105.040 42.880}}

add_row  \
	-tile_name unit \
	-direction horizontal \
	-snap_to_row_direction none \
	-snap_to_orthogonal_row_direction none \
	-allow_overlap \
	-within {{16.000 42.880} {105.040 49.600}}

update_floorplan


#***************

#  Pre Route  

#***************

remove_net_shape *
remove_via *
create_net_shape -no_snap -type wire -net gnd -layer MT -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 110.24 -origin {5.4 8.1}
create_net_shape -no_snap -type wire -net gnd -layer MT -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 110.24 -origin {5.4 57.5}
create_net_shape -no_snap -type wire -net vdd -layer MT -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 99.04 -origin {11 13.5}
create_net_shape -no_snap -type wire -net vdd -layer MT -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 99.04 -origin {11 52.1}
create_net_shape -no_snap -type wire -vertical -net gnd -layer M3 -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 54.4 -origin {113.14 5.6}
create_net_shape -no_snap -type wire -vertical -net gnd -layer M3 -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 54.4 -origin {7.9 5.6}
create_net_shape -no_snap -type wire -vertical -net vdd -layer M3 -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 43.6 -origin {107.54 11}
create_net_shape -no_snap -type wire -vertical -net vdd -layer M3 -datatype 0 -path_type 0 -width 5 -route_type pg_ring -length 43.6 -origin {13.5 11}
create_via -no_snap -type via_array -net gnd -master M4_MT_via_1x -route_type pg_ring -at {113.14 8.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M4_MT_via_1x -route_type pg_ring -at {113.14 57.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M4_MT_via_1x -route_type pg_ring -at {7.9 57.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M4_MT_via_1x -route_type pg_ring -at {7.9 8.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M4_MT_via_1x -route_type pg_ring -at {107.54 13.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M4_MT_via_1x -route_type pg_ring -at {107.54 52.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M4_MT_via_1x -route_type pg_ring -at {13.5 52.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M4_MT_via_1x -route_type pg_ring -at {13.5 13.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M3_M4_via_1x -route_type pg_ring -at {113.14 8.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M3_M4_via_1x -route_type pg_ring -at {113.14 57.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M3_M4_via_1x -route_type pg_ring -at {7.9 57.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net gnd -master M3_M4_via_1x -route_type pg_ring -at {7.9 8.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M3_M4_via_1x -route_type pg_ring -at {107.54 13.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M3_M4_via_1x -route_type pg_ring -at {107.54 52.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M3_M4_via_1x -route_type pg_ring -at {13.5 52.1} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56
create_via -no_snap -type via_array -net vdd -master M3_M4_via_1x -route_type pg_ring -at {13.5 13.5} -orient N -col 9 -row 9 -x_pitch 0.56 -y_pitch 0.56


set_object_snap_type -enabled $oldSnapState
undo_config -enable
