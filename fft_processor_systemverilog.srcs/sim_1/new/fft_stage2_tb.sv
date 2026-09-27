`timescale 1ns/1ps

import fft_pkg::*;

module fft_stage2_tb;

    complex_t x [0:7];
    complex_t y [0:7];

    fft_stage2 DUT (
        .x(x),
        .y(y)
    );

    initial begin

        //--------------------------------------------------
        // Stage 1 output
        //--------------------------------------------------

        x[0].real_part = 6;
        x[0].imag_part = 0;

        x[1].real_part = -4;
        x[1].imag_part = 0;

        x[2].real_part = 10;
        x[2].imag_part = 0;

        x[3].real_part = -4;
        x[3].imag_part = 0;

        x[4].real_part = 8;
        x[4].imag_part = 0;

        x[5].real_part = -4;
        x[5].imag_part = 0;

        x[6].real_part = 12;
        x[6].imag_part = 0;

        x[7].real_part = -4;
        x[7].imag_part = 0;

        #20;

        //--------------------------------------------------
        // Display output
        //--------------------------------------------------

        $display("-----------------------------------------------");
        $display("           FFT Stage 2 Output");
        $display("-----------------------------------------------");

        for (int i = 0; i < 8; i++) begin

            $display("y[%0d] = %0d + j%0d",
                     i,
                     y[i].real_part,
                     y[i].imag_part);

        end

        $display("-----------------------------------------------");

        $finish;

    end

endmodule