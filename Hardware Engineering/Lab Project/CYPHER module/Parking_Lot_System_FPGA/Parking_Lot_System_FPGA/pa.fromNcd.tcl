
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Parking_Lot_System_FPGA -dir "C:/Users/cypher/Documents/GitHub/Projects-Cypher/Hardware Engineering/Lab Project/CYPHER module/Parking_Lot_System_FPGA/Parking_Lot_System_FPGA/planAhead_run_2" -part xc3s1000ft256-5
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/cypher/Documents/GitHub/Projects-Cypher/Hardware Engineering/Lab Project/CYPHER module/Parking_Lot_System_FPGA/Parking_Lot_System_FPGA/parkingLotSystem.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/cypher/Documents/GitHub/Projects-Cypher/Hardware Engineering/Lab Project/CYPHER module/Parking_Lot_System_FPGA/Parking_Lot_System_FPGA} }
set_property target_constrs_file "netlist.ucf" [current_fileset -constrset]
add_files [list {netlist.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/cypher/Documents/GitHub/Projects-Cypher/Hardware Engineering/Lab Project/CYPHER module/Parking_Lot_System_FPGA/Parking_Lot_System_FPGA/parkingLotSystem.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/cypher/Documents/GitHub/Projects-Cypher/Hardware Engineering/Lab Project/CYPHER module/Parking_Lot_System_FPGA/Parking_Lot_System_FPGA/parkingLotSystem.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/cypher/Documents/GitHub/Projects-Cypher/Hardware Engineering/Lab Project/CYPHER module/Parking_Lot_System_FPGA/Parking_Lot_System_FPGA/parkingLotSystem.twx\": $eInfo"
}
