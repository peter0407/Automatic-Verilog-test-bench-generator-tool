`timescale 1ns/1ps 
 
module parking_system_tb ();

//inputs
reg 	clk;
reg 	 reset_n_tb;
reg 	 sensor_entrance_tb;
reg 	 sensor_exit_tb;
reg 	[1:0] password_1_tb;

//outputs
wire 	[6:0] HEX_1_tb;
wire 	[6:0] HEX_2_tb;

//clock generation
always #12 clk = ! clk;

integer torandom;
initial
begin
	// Initialize all Inputs by zero
	clk = 0;
	reset_n_tb = 0;
	sensor_entrance_tb = 0;
	sensor_exit_tb = 0;
	password_1_tb = 0;



/////////////////////////////////////////////////
	//monitor inputs
	$monitor("reset_n = %d", reset_n_tb);
	$monitor("sensor_entrance = %d", sensor_entrance_tb);
	$monitor("sensor_exit = %d", sensor_exit_tb);
	$monitor("password_1 = %d", password_1_tb);
	//monitor outputs
	$monitor("HEX_1 = %d", HEX_1_tb);
	$monitor("HEX_2 = %d", HEX_2_tb);
/////////////////////////////////////////////////

	#100;

	repeat(99999) 
	begin
		reset_n_tb = 1;
		torandom = {$random} % 10;
		if(torandom > 4)
			reset_n_tb = {$random} % 2;
		sensor_entrance_tb = 1;
		torandom = {$random} % 10;
		if(torandom > 4)
			sensor_entrance_tb = {$random} % 2;
		sensor_exit_tb = 1;
		torandom = {$random} % 10;
		if(torandom > 4)
			sensor_exit_tb = {$random} % 2;
		password_1_tb = 1;
		torandom = {$random} % 10;
		if(torandom > 4)
			password_1_tb = {$random} % 4;

		#25; 
	end

	$stop;
end

// instantiate design instance
parking_system DUT (
	.clk(clk),
	.reset_n(reset_n_tb),
	.sensor_entrance(sensor_entrance_tb),
	.sensor_exit(sensor_exit_tb),
	.password_1(password_1_tb),
	.HEX_1(HEX_1_tb),
	.HEX_2(HEX_2_tb)
);
endmodule
