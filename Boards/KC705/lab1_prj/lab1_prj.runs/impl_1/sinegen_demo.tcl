proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7k325tffg900-2
  set_property board_part xilinx.com:kc705:part0:1.2 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.cache/wt [current_project]
  set_property parent.project_path /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.xpr [current_project]
  set_property ip_repo_paths /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.cache/ip [current_project]
  set_property ip_output_repo /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.cache/ip [current_project]
  add_files -quiet /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/synth_1/sinegen_demo.dcp
  add_files -quiet /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/sine_low_synth_1/sine_low.dcp
  set_property netlist_only true [get_files /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/sine_low_synth_1/sine_low.dcp]
  add_files -quiet /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/sine_high_synth_1/sine_high.dcp
  set_property netlist_only true [get_files /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/sine_high_synth_1/sine_high.dcp]
  add_files -quiet /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/sine_mid_synth_1/sine_mid.dcp
  set_property netlist_only true [get_files /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.runs/sine_mid_synth_1/sine_mid.dcp]
  read_xdc -mode out_of_context -ref sine_low -cells U0 /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/sources_1/ip/sine_low/sine_low_ooc.xdc
  set_property processing_order EARLY [get_files /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/sources_1/ip/sine_low/sine_low_ooc.xdc]
  read_xdc -mode out_of_context -ref sine_high -cells U0 /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/sources_1/ip/sine_high/sine_high_ooc.xdc
  set_property processing_order EARLY [get_files /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/sources_1/ip/sine_high/sine_high_ooc.xdc]
  read_xdc -mode out_of_context -ref sine_mid -cells U0 /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/sources_1/ip/sine_mid/sine_mid_ooc.xdc
  set_property processing_order EARLY [get_files /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/sources_1/ip/sine_mid/sine_mid_ooc.xdc]
  read_xdc /home/l329869/vhdl_tutorial/debug_tutorial/test_projects/lab1_prj/lab1_prj.srcs/constrs_1/imports/lab1/sinegen_demo_kc705.xdc
  link_design -top sinegen_demo -part xc7k325tffg900-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force sinegen_demo_opt.dcp
  report_drc -file sinegen_demo_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file sinegen_demo.hwdef}
  place_design 
  write_checkpoint -force sinegen_demo_placed.dcp
  report_io -file sinegen_demo_io_placed.rpt
  report_utilization -file sinegen_demo_utilization_placed.rpt -pb sinegen_demo_utilization_placed.pb
  report_control_sets -verbose -file sinegen_demo_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force sinegen_demo_routed.dcp
  report_drc -file sinegen_demo_drc_routed.rpt -pb sinegen_demo_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file sinegen_demo_timing_summary_routed.rpt -rpx sinegen_demo_timing_summary_routed.rpx
  report_power -file sinegen_demo_power_routed.rpt -pb sinegen_demo_power_summary_routed.pb
  report_route_status -file sinegen_demo_route_status.rpt -pb sinegen_demo_route_status.pb
  report_clock_utilization -file sinegen_demo_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force sinegen_demo.mmi }
  write_bitstream -force sinegen_demo.bit 
  catch { write_sysdef -hwdef sinegen_demo.hwdef -bitfile sinegen_demo.bit -meminfo sinegen_demo.mmi -file sinegen_demo.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

