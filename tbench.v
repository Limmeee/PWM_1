module tb;

	reg clk;
	reg rstn;
	reg rst;
	reg clk_en;
	reg Ctr_0;
	reg [11:0] load_val;
	reg load_en;
	wire [11:0] op;
	reg [11:0] counter_out;
	wire T1;
		wire T2;
	//reg [11:0] comparator_out;
		wire comparator_out_cc;
	wire comparator_out;


	always #1 clk=~clk;
	
	
		

	initial begin 
		clk_en<=1;

		clk<=0;
		//#150000 load_en<=1;
		load_val<=12'd540;
		#380000 rst<=1;
		#380010 rst<=0;

	end
	
//	Counter C1 (.Clock(clk), .Clk_En(clk_en),.Rst(rst),.Load(load_val),.Load_en(load_en),.Ctr_0(Ctr_0), .Q(Q));
	
//	comparator CC1 (.a(op), .b(Q), .equal(OUT));
	
	
//	PRDREG PRD1(.clk(clk), .clk_tbprd(OUT),.counter_value(Q),.load_val(),.load_en(load_en),.op(op))
head H1( .Clock(clk), .Clk_en(clk_en),.Load_en(load_en), .Load(load_val), .op(op), .Rst(rst), .Ctr_0(Ctr_0), .counter_out(counter_out), .comparator_out(comparator_out),.reg_cc(12'd0),.comparator_out_cc(comparator_out_cc),.T1(T1),.T2(T2));
endmodule 