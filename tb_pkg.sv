
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "btos_sequence_item.sv"        // transaction class
 `include "btos_sequence.sv"             // sequence class
 `include "btos_sequencer.sv"            // sequencer class
 `include "btos_driver.sv"               // driver class
 `include "btos_monitor.sv"              // monitor class
 `include "btos_agent.sv"                // agent class  
 `include "btos_coverage.sv"             // coverage class
 `include "btos_scoreboard.sv"           // scoreboard class 
 `include "btos_env.sv"                  // environment class

 `include "btos_test.sv"                     // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


