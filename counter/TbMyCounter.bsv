import MyCounter::*;
import StmtFSM::*;

(* synthesize *)
module mkTbCounter(Empty);

    MyCounter#(32) counter <- mkCounter();

    function check(expected_val);
    	action
    	    if (counter.read() != expected_val) begin
    	    	$display("FAIL: counter != %0d", expected_val);
    	    end
    	endaction
    endfunction

    Stmt test_seq = seq
	   counter.load(42);
	   check(42);
	   counter.decrement();
	   counter.increment();
	   check(42);
	   counter.load(0);
	   counter.increment();
	   check(1);
	   counter.increment();
	   check(2);
	   counter.increment();
	   check(3);
	   counter.decrement();
	   check(2);
	   $display("TESTS FINISHED");
	endseq;

    mkAutoFSM(test_seq);

endmodule: mkTbCounter
