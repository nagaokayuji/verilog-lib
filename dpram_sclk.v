module vram
(
	input [7:0] dina, dinb,
	input [23:0] addra, addrb,
	input wea, web, clka,clkb,
	output reg [7:0] douta, doutb
);
	// Declare the RAM variable
	reg [7:0] ram[57599:0];
	
	// Port A
	always @ (posedge clka)
	begin
		if (wea) 
			ram[addra] <= dina;
			douta <= ram[addra];
	end
	
	// Port B
	always @ (posedge clkb)
	begin
		if (web)
			ram[addrb] <= dinb;
			doutb <= ram[addrb];
	end

endmodule

