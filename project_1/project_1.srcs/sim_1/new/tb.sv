`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2024 08:47:29
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
    `include "uvm_macros.svh"
    import uvm_pkg::*;
     
     int data = 73;
    module tb;
      
      initial begin
        `uvm_info("TB_TOP", "Hello World", UVM_LOW);
          `uvm_info("TB_TOP", $sformatf("Value of data : %0d",data), UVM_NONE);
          $display("Default verbosity level:%0d", uvm_top.get_report_verbosity_level); 
          /* UVM_ROOT is parent to all the classes that we add in UVM Testbench environment(UVM Tree).
          Because UVM_ROOT returns a null pointer, we cannot directly access it. However, in a few situations, we may need
          to access or configure the default settings of UVM_ROOT.
          In such case, UVM provides a global variable UVM_TOP which is accessible to all classes of environment. UVM_TOP could be used
          whenever we need to work with the UVM root. */
         `uvm_info("TB_TOP", "String", UVM_MEDIUM); //(id, msg, level)
         `uvm_info("TB_TOP", "String2", UVM_HIGH); //(id, msg, level)
         uvm_top.set_report_verbosity_level(UVM_HIGH);
         `uvm_info("TB_TOP", "String3", UVM_HIGH);
         $display("Default verbosity level:%0d", uvm_top.get_report_verbosity_level); 
      end
      
    endmodule
