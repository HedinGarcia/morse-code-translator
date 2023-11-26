set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN W19 [get_ports Dot]
set_property IOSTANDARD LVCMOS33 [get_ports Dot]
set_property PULLDOWN true [get_ports Dot]

set_property PACKAGE_PIN T17 [get_ports Dash]
set_property IOSTANDARD LVCMOS33 [get_ports Dash]
set_property PULLDOWN true [get_ports Dash]

set_property PACKAGE_PIN T18 [get_ports EndSeq]
set_property IOSTANDARD LVCMOS33 [get_ports EndSeq]
set_property PULLDOWN true [get_ports EndSeq]

set_property PACKAGE_PIN U18 [get_ports Space]
set_property IOSTANDARD LVCMOS33 [get_ports Space]
set_property PULLDOWN true [get_ports Space]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets Enter_IBUF]

set_property PACKAGE_PIN R2 [get_ports Clear]
set_property IOSTANDARD LVCMOS33 [get_ports Clear]

set_property PACKAGE_PIN T1 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]

set_property PACKAGE_PIN U17 [get_ports Enter]
set_property IOSTANDARD LVCMOS33 [get_ports Enter]
set_property PULLDOWN true [get_ports Enter]

set_property PACKAGE_PIN J1 [get_ports dot_buzzer]
set_property PACKAGE_PIN L2 [get_ports dash_buzzer]
set_property IOSTANDARD LVCMOS33 [get_ports dot_buzzer]
set_property IOSTANDARD LVCMOS33 [get_ports dash_buzzer]

set_property PACKAGE_PIN E19 [get_ports sent]
set_property IOSTANDARD LVCMOS33 [get_ports sent]
set_property PACKAGE_PIN U16 [get_ports storageSent]
set_property IOSTANDARD LVCMOS33 [get_ports storageSent]

set_property PACKAGE_PIN A18 [get_ports TxD]
set_property IOSTANDARD LVCMOS33 [get_ports TxD]
