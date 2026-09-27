import fft_pkg::*;

module fft8_top #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input  logic clk,
    input  logic reset,

    input  complex_t fft_in [0:7],
    output complex_t fft_out [0:7]
);
    complex_t bit_reverse [0:7];
    complex_t stage1_comb [0:7];
    complex_t stage2_comb [0:7];
    complex_t stage3_comb [0:7];
    complex_t stage1_reg [0:7];
    complex_t stage2_reg [0:7];
    complex_t stage3_reg [0:7];
    assign bit_reverse[0] = fft_in[0];
    assign bit_reverse[1] = fft_in[4];
    assign bit_reverse[2] = fft_in[2];
    assign bit_reverse[3] = fft_in[6];
    assign bit_reverse[4] = fft_in[1];
    assign bit_reverse[5] = fft_in[5];
    assign bit_reverse[6] = fft_in[3];
    assign bit_reverse[7] = fft_in[7];
    fft_stage1 STAGE1 (
        .x(bit_reverse),
        .y(stage1_comb)
    );
    always_ff @(posedge clk) begin
        if (reset) begin
            for (int i = 0; i < 8; i++) begin
                stage1_reg[i].real_part <= '0;
                stage1_reg[i].imag_part <= '0;
            end
        end
        else begin
            for (int i = 0; i < 8; i++) begin
                stage1_reg[i] <= stage1_comb[i];
            end
        end
    end
    fft_stage2 STAGE2 (
        .x(stage1_reg),
        .y(stage2_comb)
    );
    always_ff @(posedge clk) begin

        if (reset) begin

            for (int i = 0; i < 8; i++) begin
                stage2_reg[i].real_part <= '0;
                stage2_reg[i].imag_part <= '0;
            end

        end
        else begin

            for (int i = 0; i < 8; i++) begin
                stage2_reg[i] <= stage2_comb[i];
            end

        end

    end
    fft_stage3 STAGE3 (
        .x(stage2_reg),
        .y(stage3_comb)
    );
    // pipelined fft processor built by sanath prabhu
    always_ff @(posedge clk) begin

        if (reset) begin

            for (int i = 0; i < 8; i++) begin
                stage3_reg[i].real_part <= '0;
                stage3_reg[i].imag_part <= '0;
            end

        end
        else begin

            for (int i = 0; i < 8; i++) begin
                stage3_reg[i] <= stage3_comb[i];
            end

        end

    end
    assign fft_out = stage3_reg;
endmodule