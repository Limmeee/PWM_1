module AQ(TBCLOCK,CTR_0, T1, T2, comp_out );
input TBCLOCK;
input comp_out;
input CTR_0;
output reg T1;
output reg T2;


wire ANDT;
assign ANDT=TBCLOCK && !CTR_0;	
always@(posedge ANDT )begin

	T1<=1;
	T2<=0;
end	
always @(negedge comp_out) begin
		T1<=0;
		T2<=1;
end

endmodule