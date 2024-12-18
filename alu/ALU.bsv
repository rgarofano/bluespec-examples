package ALU;

interface ALU#(type width);
    method Action add(Bit#(width) in1, Bit#(width) in2);
    method Action subtract(Bit#(width) in1, Bit#(width) in2);
    method Action bitwiseAnd(Bit#(width) in1, Bit#(width) in2);
    method Action bitwiseOr(Bit#(width) in1, Bit#(width) in2);
    method Action bitwiseXor(Bit#(width) in1, Bit#(width) in2);
    method Action shiftLeft(Bit#(width) in, Bit#(width) num_shifts);
    method Action shiftRight(Bit#(width) in, Bit#(width) num_shifts);
    method Bit#(width) result();
endinterface: ALU

module mkALU(ALU#(width));
    
    Reg#(Bit#(width)) out <- mkReg(0);

    method Action add(Bit#(width) in1, Bit#(width) in2);
    	out <= in1 + in2;
    endmethod: add

    method Action subtract(Bit#(width) in1, Bit#(width) in2);
    	out <= in1 - in2;
    endmethod: subtract

    method Action bitwiseAnd(Bit#(width) in1, Bit#(width) in2);
    	out <= in1 & in2;
    endmethod: bitwiseAnd

    method Action bitwiseOr(Bit#(width) in1, Bit#(width) in2);
    	out <= in1 | in2;
    endmethod: bitwiseOr

    method Action bitwiseXor(Bit#(width) in1, Bit#(width) in2);
    	out <= in1 ^ in2;
    endmethod: bitwiseXor

    method Action shiftLeft(Bit#(width) in, Bit#(width) num_shifts);
    	out <= in << num_shifts;
    endmethod: shiftLeft

    method Action shiftRight(Bit#(width) in, Bit#(width) num_shifts);
    	out <= in >> num_shifts;
    endmethod: shiftRight
    
    method Bit#(width) result();
    	return out;
    endmethod: result

endmodule: mkALU

endpackage: ALU
