`timescale 1ns/1ps

import fft_pkg::*;

module fft8_pipelined_tb;
    logic clk;
    logic reset;
    complex_t fft_in  [0:7];
    complex_t fft_out [0:7];
    fft8_top DUT (
        .clk(clk),
        .reset(reset),
        .fft_in(fft_in),
        .fft_out(fft_out)
    );
    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end
    initial begin
        reset = 1;
        for (int i = 0; i < 8; i++) begin
            fft_in[i].real_part = 0;
            fft_in[i].imag_part = 0;
        end

        #20;

        reset = 0;
        fft_in[0].real_part = 1;
        fft_in[1].real_part = 2;
        fft_in[2].real_part = 3;
        fft_in[3].real_part = 4;
        fft_in[4].real_part = 5;
        fft_in[5].real_part = 6;
        fft_in[6].real_part = 7;
        fft_in[7].real_part = 8;

        for (int i = 0; i < 8; i++) begin
            fft_in[i].imag_part = 0;
        end
        #50;
        $display("-----------------------------------------------");
        $display("        Pipelined 8-Point FFT Output");
        $display("-----------------------------------------------");

        for (int i = 0; i < 8; i++) begin
            $display("X[%0d] = %0d + j%0d",
                     i,
                     fft_out[i].real_part,
                     fft_out[i].imag_part);
        end

        $display("-----------------------------------------------");

        $finish;

    end

endmodule