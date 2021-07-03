module tb_dpram;

reg [7:0] dina,dinb;
reg [23:0] addra,addrb;
reg wea,web,clka,clkb;
wire [7:0] douta,doutb;


vram uut(.*);


always #5 begin
	clka = !clka;
	clkb = !clkb;
end

task wr;
	input [23:0] addr;
	input [7:0] din;
	begin
	addra = addr;
	dina = din;
	wea = 1;
	#C;
	wea = 0;
	end
endtask


integer i;

localparam C = 10;

initial begin
	$dumpfile("this.vcd");
	$dumpvars(0,tb_dpram);
	clka = 0;
	clkb = 0;
	#20;
	#(C*100);

	for (i = 0; i < 20; i = i + 1) begin
		wr(i,i*3 % 256);
		#C;
	end
	for (i = 0; i < 20; i = i + 1) begin
		addrb = i;
		#(C*2);

	end


	

	
	#100;

$finish;
end

endmodule