module tt_alu (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    
    wire [3:0] A,B;
    reg [7:0] result;

    assign A = ui_in[3:0];
    assign B = ui_in[7:4];

    assign uo_out = result;
    
    assign uio_oe = 8'h00;
    
    
    always@(posedge clk) begin

        case (uio_in)

            8'd0: result = A + B;
            8'd1: result = A - B;
            8'd2: result = A*B;
            8'd3: result = A/B;
            8'd4: result = {A[3]&B[3],A[2]&B[2],A[1]&B[1],A[0]&B[0]};
                default: result = {B,A};

        endcase

    end

endmodule
