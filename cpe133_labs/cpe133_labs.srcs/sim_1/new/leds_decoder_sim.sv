module leds_decoder_sim();
    logic [3:0] L;
    logic [15:0] DECODED;
    
    LEDS_DECODER led_decoder_inst ( .LED_NUM(L), .LEDS_DECODED(DECODED) );
    
    initial
        begin
            L = 0;
            #10
            
            L = 1;
            #10
            
            L = 15;
            #10
            
            L = 4;
            #10
            
            L = 14;
            #10
            
            $display("Finished");
        
        end    
    

endmodule