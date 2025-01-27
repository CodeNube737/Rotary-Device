
// just trying something out

module encoder(
	input a, b // these will somehow always be 90-deg out-of phase w/ e/o. {00,10,11,01}
	output cw, ccw
	input clk );

	logic prev_a, prev_b;
// uses info from the current {a,b} vs {prev_a, prev_b} to determine if the position is changed
// creat 3 possible states: IDLE (state is initialized to IDLE), CW, CCW
// combinational logic
 // cases: 
	// {a, b, prev_a, prev_b} == '0 ? IDLE
	// {a, b, prev_a, prev_b} == {1, 1, 0, 1} ? CW // this should catch the one instant when the CW rotation started
	// {a, b, prev_a, prev_b} == {1, 1, 1, 0} ? CCW // likewise
// sequential logic: i am not sure if @posedge or @negedge
	// update all inputs and outputs

endmodule 

