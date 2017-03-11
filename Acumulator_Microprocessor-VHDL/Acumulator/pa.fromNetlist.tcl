
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name lab1 -dir "H:/4540/lab1/planAhead_run_1" -part xc7a100tcsg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "H:/4540/lab1/ProcessorToLevel.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {H:/4540/lab1} }
set_property target_constrs_file "inputUCF.ucf" [current_fileset -constrset]
add_files [list {inputUCF.ucf}] -fileset [get_property constrset [current_run]]
link_design
