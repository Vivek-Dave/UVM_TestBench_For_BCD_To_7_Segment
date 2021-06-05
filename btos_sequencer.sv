class btos_sequencer extends uvm_sequencer#(btos_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(btos_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="btos_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:btos_sequencer

