module sys_reset (
input iCLK,
output oRESET
);

reg delay0;
reg delay1;
reg out_reset; 

initial 
begin
	delay0 <= 1'b0;
	delay1 <= 1'b0;
	out_reset <= 1'b1;
end

always @(posedge iCLK)
begin
	if (delay0 == 1'b0)begin
		delay0 <= 1'b1;
		out_reset <= 1'b1;
	end
	else if(delay0 == 1'b1 & delay1 == 1'b0)begin
		out_reset <= 1'b0;
		delay1 <= 1'b1;
	end 
	else if(delay1==1'b1 & delay0 == 1'b1)begin
		out_reset <= 1'b1;
	end
end

assign oRESET = out_reset;

endmodule