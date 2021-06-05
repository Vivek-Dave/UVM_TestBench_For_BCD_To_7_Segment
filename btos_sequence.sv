
/***************************************************
** class name  : btos_sequence
** description : generate input for DUT
***************************************************/
class btos_sequence extends uvm_sequence#(btos_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(btos_sequence)            
  //----------------------------------------------------------------------------

  btos_sequence_item txn;
  int unsigned LOOP=1;

  //----------------------------------------------------------------------------
  function new(string name="btos_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(LOOP) begin 
      for(int i=0;i<10;i++) begin 
        txn=btos_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.in==i;};
        #5;
        finish_item(txn);
      end
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass:btos_sequence

/***************************************************
** class name  : random_sequence
** description : generate random sequence
***************************************************/
class random_sequence extends btos_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(random_sequence)      
  //----------------------------------------------------------------------------
  
  btos_sequence_item txn;
  int unsigned LOOP=30;
  
  //----------------------------------------------------------------------------
  function new(string name="random_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(LOOP) begin 
      txn=btos_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize();
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass