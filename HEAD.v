module head( Clock, Clk_en,Load_en, Load, op, Rst, Ctr_0, counter_out, comparator_out);
	input Clock;
	input Clk_en;
	input Load_en;
	input [11:0] Load;
	input Rst;
	output Ctr_0;
	output [11:0] op;
	output [11:0] counter_out;
	output [11:0] comparator_out;
	comparator comp1 (.a(counter_out), .b(op), .equal(comparator_out));
	PRDREG PR1(.clk(Clock), .clk_tbprd(counter_out),.op(op));
	Counter  C1 (.Clock(Clock), .Clk_En(Clk_en),.Rst(Rst),.Load(Load),.Load_en(Load_en),.Ctr_0(Ctr_0),  .Q(counter_out));
endmodule




