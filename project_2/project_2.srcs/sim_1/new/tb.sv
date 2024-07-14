//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2024 09:33:17
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
     
 /* Driver */
 
 class driver extends uvm_driver;
      `uvm_component_utils(driver) //register our class to a factory 
      
      /* Constructor */
      function new(string path , uvm_component parent);
        super.new(path, parent);
      endfunction
     
      
      task run();
        `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
        `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
      endtask
      
  endclass
     
 /* Monitor */ 
 
 class monitor extends uvm_monitor; 
 
 `uvm_component_utils(monitor)
 
 function new(string path, uvm_component parent);
 super.new(path, parent); 
 endfunction
 
 task run();
 `uvm_info("Mon", "Executed monitor code", UVM_HIGH);
 endtask
 
 endclass
     
      
/* Environment */
    
 class env extends uvm_env;
    `uvm_component_utils(env)
  
  driver drv;
  monitor mon; 
          
 function new(string path, uvm_component parent); 
    super.new(path,parent);
 endfunction
    
        
     task run();
        `uvm_info("ENV1", "Executed ENV1 Code", UVM_HIGH);
        `uvm_info("ENV2", "Executed ENV2 Code", UVM_HIGH);
        
        drv = new("DRV",this);
        mon = new("MON",this);
        drv.run();
        mon.run(); 
        
      endtask
    
 endclass
     
 module tb;
      

     env e;
      
     initial begin
       //drv = new("DRV", null);
       e = new("ENV",null);
      //drv.set_report_id_verbosity("DRV1",UVM_HIGH); //change the verbosity because the default is medium
      //drv.set_report_id_verbosity("DRV2",UVM_HIGH);
       //drv.run();
       e.set_report_verbosity_level(UVM_HIGH);
       e.run();
        
      end
      
      
 endmodule