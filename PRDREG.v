module PRDREG(clk, clk_tbprd, op);
	
input clk;
input clk_tbprd;



output reg [11:0] op;

reg [11:0] reg_max;
reg [11:0] reg_min;
reg change;
integer i;

initial begin
	op<=12'd1000;
	reg_max=12'd1000;
	reg_min=12'd0;
end

always @(negedge clk_tbprd) begin 
	change=~change;
	end
always @(negedge clk) begin
	if( change) begin
		op<=12'd1000;
	end 
	else begin
	op<=12'd0;
	end
end
		

			
endmodule

module comparator (a, b, equal);
    input wire [11:0] a;
    input wire [11:0] b;
    output reg equal;
    

    always @* begin
      if (a<b) begin
        equal = 0;

      end
      else if (a==b) begin
        equal = 1;
		end
      else begin
        equal = 0;

      end
    end
endmodule


module Counter (Clock, Clk_En,Rst,Load,Load_en,Ctr_0,  Q);
     
	input wire Clock;
    input wire Clk_En;
	input wire Rst;
	input wire Load_en;
	input wire [11:0] Load;
	
    output reg Ctr_0;
    output wire [11:0] Q;
	
	reg [11:0] out;
	reg UpDown;
	reg ctr_00;
	
	
	always@(Clock) begin
		if (out<12'd1) begin
			Ctr_0=1;
		end
		else begin
			Ctr_0=0;	
		end
	end
	

	
always @(posedge Clock) begin
		
	if(Clk_En) begin
		if (UpDown)
			out <= out-1;
		else 
			out  <= out+1;
							
		if (out> 12'd998) begin
			UpDown=1;
		end
		if (out< 12'd2)begin
			UpDown=0;
		end
	end
		else  begin
			out<=out;	
		end
			
			
	if( Rst) begin
		out<=12'd0;
	UpDown=0;
		
	end

			
			
	if( Load_en) begin
		out<=Load;
	
	end

end
	

  assign Q=out;

endmodule

