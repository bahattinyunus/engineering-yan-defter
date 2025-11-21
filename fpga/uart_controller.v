module uart_tx (
    input wire clk,
    input wire rst_n,
    input wire tx_start,
    input wire [7:0] tx_data,
    output reg tx,
    output reg tx_busy
);

    parameter CLK_FREQ = 50000000;
    parameter BAUD_RATE = 115200;
    localparam CLK_PER_BIT = CLK_FREQ / BAUD_RATE;

    reg [3:0] state;
    reg [15:0] clk_cnt;
    reg [2:0] bit_idx;
    reg [7:0] data_reg;

    localparam IDLE = 0;
    localparam START_BIT = 1;
    localparam DATA_BITS = 2;
    localparam STOP_BIT = 3;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            tx <= 1'b1;
            tx_busy <= 1'b0;
            clk_cnt <= 0;
            bit_idx <= 0;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    if (tx_start) begin
                        state <= START_BIT;
                        tx_busy <= 1'b1;
                        data_reg <= tx_data;
                        clk_cnt <= 0;
                    end
                end
                
                START_BIT: begin
                    tx <= 1'b0;
                    if (clk_cnt < CLK_PER_BIT - 1)
                        clk_cnt <= clk_cnt + 1;
                    else begin
                        clk_cnt <= 0;
                        state <= DATA_BITS;
                        bit_idx <= 0;
                    end
                end

                DATA_BITS: begin
                    tx <= data_reg[bit_idx];
                    if (clk_cnt < CLK_PER_BIT - 1)
                        clk_cnt <= clk_cnt + 1;
                    else begin
                        clk_cnt <= 0;
                        if (bit_idx < 7)
                            bit_idx <= bit_idx + 1;
                        else
                            state <= STOP_BIT;
                    end
                end

                STOP_BIT: begin
                    tx <= 1'b1;
                    if (clk_cnt < CLK_PER_BIT - 1)
                        clk_cnt <= clk_cnt + 1;
                    else begin
                        state <= IDLE;
                        tx_busy <= 1'b0;
                    end
                end
            endcase
        end
    end
endmodule
