package MyCounter;
    
interface MyCounter#(type width);
    method Bit#(width) read();
    method Action load(Bit#(width) newval);
    method Action increment();
    method Action decrement();
endinterface

module mkCounter(MyCounter#(width));

    Reg#(Bit#(width)) value <- mkReg(0);

    method Bit#(width) read();
    	return value;
    endmethod: read

    method Action load(Bit#(width) newval);
    	value <= newval;
    endmethod: load

    method Action increment();
    	value <= value + 1;
    endmethod: increment

    method Action decrement();
    	value <= value - 1;
    endmethod: decrement

endmodule: mkCounter

endpackage: MyCounter
