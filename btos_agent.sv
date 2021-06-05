
class btos_agent extends uvm_agent;

  //----------------------------------------------------------------------------
  `uvm_component_utils(btos_agent)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="btos_agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------

  //----------------- class handles --------------------------------------------
  btos_sequencer sequencer_h;
  btos_driver    driver_h;
  btos_monitor   monitor_h;
  //----------------------------------------------------------------------------

  //---------------------- build phase -----------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    driver_h    = btos_driver::type_id::create("driver_h",this);
    sequencer_h = btos_sequencer::type_id::create("sequencer_h",this);
    monitor_h   = btos_monitor::type_id::create("monitor_h",this);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------- connect phase --------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
  endfunction
  //----------------------------------------------------------------------------

endclass:btos_agent

