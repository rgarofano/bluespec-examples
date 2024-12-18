import ALU::*;
import StmtFSM::*;

(* synthesize *)
module mkTbALU(Empty);

    ALU#(32) alu <- mkALU();
    function checkAdd(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: %0d + %0d produced %0d\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: %0d + %0d produced %0d\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkAdd

    function checkSubtract(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: %0d - %0d produced %0d\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: %0d - %0d produced %0d\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkSubtract

    function checkAnd(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: 0x%x AND 0x%x produced 0x%x\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: 0x%x AND 0x%x produced 0x%x\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkAnd

    function checkOr(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: 0x%x OR 0x%x produced 0x%x\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: 0x%x OR 0x%x produced 0x%x\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkOr

    function checkXor(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: 0x%x XOR 0x%x produced 0x%x\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: 0x%x XOR 0x%x produced 0x%x\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkXor

    function checkShiftLeft(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: %0d << %0d produced %0d\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: %0d << %0d produced %0d\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkShiftLeft

    function checkShiftRight(a, b, expected_val);
    	action
    	    let result = alu.result();
	    if (result != expected_val) begin
	    	$display("\033[31mFAIL: %0d >> %0d produced %0d\033[0m", a, b, result);
	    end else begin
	    	$display("\033[32mPASS: %0d >> %0d produced %0d\033[0m", a, b, result);
	    end
    	endaction
    endfunction: checkShiftRight

    Stmt steps = seq
	    $display("Starting ALU tests.."); 
	    alu.add(0, 0);
	    checkAdd(0, 0, 0);
	    alu.add(144, 87);
	    checkAdd(144, 87, 231);
	    alu.subtract(34, 22);
	    checkSubtract(34, 22, 12);
	    alu.subtract(255, 255);
	    checkSubtract(255, 255, 0);
	    alu.bitwiseAnd(7, 22);
	    checkAnd(7, 22, 6);
	    alu.bitwiseOr(7, 22);
	    checkOr(7, 22, 23);
	    alu.bitwiseXor(7, 22);
	    checkXor(7, 22, 17);
	    alu.shiftLeft(7, 2);
	    checkShiftLeft(7, 2, 28);
	    alu.shiftRight(7, 2);
	    checkShiftRight(7, 2, 1);
	    $display("ALU tests finished");
	endseq;

    mkAutoFSM(steps);

endmodule: mkTbALU
