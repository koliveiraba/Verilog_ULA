module morse (input button1, input button2, input CLKin, output reg [3:0]signal);
integer i = 0, atr;
reg [3:0]in = 4'b0000;
reg button_old = 1, button_raise = 0;

always @(posedge CLKin) begin
    // detect rising edge
    
    if (button_old != button2 && button2 == 1'b1)
          button_raise <= 1'b1;
	
	button_old <= button2;

    // increment number
    if(button_raise == 1'b1)
    begin
        if(!button1)begin
		in[i] <= 0;
        i = i + 1;
        end 
        else if(button2)begin
		in[i] <= 1;
        i = i + 1;
		end
    end

	if(i > 3)begin
		signal[0] = in[0];
		signal[1] = in[1];
		signal[2] = in[2];
		signal[3] = in[3];
	end else
			signal = 0;
			
	/*casex(in)
		5'b00001:
			signal = 0;
		5'b10001:
			signal = 1;
		5'bX1001:
			signal = 1;
		5'bXX101:
			signal = 1;
		5'bXXX11:                                             
			signal = 0;
	endcase*/
end

endmodule

//key2 pin_p23
//clock 28MHz pin_d13
//ledg7 pin_y18                   
//ledg6 pin_aa20