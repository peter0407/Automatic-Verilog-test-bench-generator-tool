‘timescale 1ns / 1ps
module XYZ_tb ();

reg 	 reg_tb;
reg 	 data_tb;
wire 	 result_tb;

integer torandom;
initial
begin
	// Initialize all Inputs by zero
	reg_tb = 0;
	data_tb = 0;


	#100;

	repeat(99999) 
	begin
		reg_tb = {$random} % 2;
		data_tb = {$random} % 2;
	end

	$stop;
end

// instantiate design instance
XYZ DUT (
	.reg(reg_tb),
	.data(data_tb),

	.result(result_tb)
);
endmodule
