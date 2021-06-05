
class btos_test extends uvm_test;

    //--------------------------------------------------------------------------
    `uvm_component_utils(btos_test)
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function new(string name="btos_test",uvm_component parent);
	    super.new(name,parent);
    endfunction
    //--------------------------------------------------------------------------

    btos_env env_h;
    int file_h;

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_h = btos_env::type_id::create("env_h",this);
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void end_of_elobartion_phase(uvm_phase phase);
      //factory.print();
      $display("End of eleboration phase in agent");
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void start_of_simulation_phase(uvm_phase phase);
      $display("start_of_simulation_phase");
      file_h=$fopen("LOG_FILE.log","w");
      set_report_default_file_hier(file_h);
      set_report_severity_action_hier(UVM_INFO,UVM_DISPLAY+UVM_LOG);
      set_report_verbosity_level_hier(UVM_MEDIUM);
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        btos_sequence seq;
        random_sequence r_seq;
	      phase.raise_objection(this);
            
            seq= btos_sequence::type_id::create("seq");
            r_seq= random_sequence::type_id::create("r_seq");

            seq.start(env_h.agent_h.sequencer_h);
            r_seq.start(env_h.agent_h.sequencer_h);

            #10;
	      phase.drop_objection(this);
    endtask
    //--------------------------------------------------------------------------

endclass:btos_test

