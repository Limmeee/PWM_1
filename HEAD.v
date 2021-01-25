module head( Clock, Clk_en,Load_en, Load, op, Rst, Ctr_0, counter_out, comparator_out,reg_cc, comparator_out_cc, T1, T2);
	input Clock;
	input Clk_en;
	input Load_en;
	input [11:0] Load;
	input Rst;
	output Ctr_0;
	output wire T1;
		output wire T2;
	output [11:0] op;
	output [11:0] reg_cc;
	output [11:0] counter_out;
	output comparator_out;
	output comparator_out_cc;
	comparator comp1 (.a(counter_out), .b(op), .equal(comparator_out));
	PRDREG PR1(.clk(Clock), .d(12'd1000),.reset(),.op(op));
	Counter  C1 (.Clock(Clock), .Clk_En(Clk_en),.Rst(Rst),.Load(Load),.Load_en(Load_en),.Ctr_0(Ctr_0),  .Q(counter_out));


	register_cc reg1 (.D(12'd20),.clock(Clock), .reset(), .q(reg_cc), .e());
	comparator counter_comp (.a(counter_out), .b(reg_cc), .equal(comparator_out_cc));


	AQ aq1(.TBCLOCK(comparator_out),.CTR_0(Ctr_0), .T1(T1), .T2(T2), .comp_out(comparator_out_cc) );
endmodule

module register_cc (D,clock, reset, q, e);
	input clock;
	input [11:0]D;
	input reset;
	input e;
	output reg [11:0] q;
	
	always@(posedge clock or posedge reset) begin
		if (reset) begin
			q<=12'd0;
		end 
		else begin
		q<=D;	
		end
	end
endmodule