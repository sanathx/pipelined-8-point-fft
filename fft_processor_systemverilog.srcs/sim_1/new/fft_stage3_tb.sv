`timescale 1ns/1ps

import fft_pkg::*;

module fft_stage3_tb;

    complex_t x [0:7];
    complex_t y [0:7];

    fft_stage3 DUT (
        .x(x),
        .y(y)
    );

    initial begin

        //--------------------------------------------------
        // Correct Stage 2 output
        //--------------------------------------------------

        x[0].real_part = 16;
        x[0].imag_part = 0;

        x[1].real_part = -4;
        x[1].imag_part = 4;

        x[2].real_part = -4;
        x[2].imag_part = 0;

        x[3].real_part = -4;
        x[3].imag_part = -4;

        x[4].real_part = 20;
        x[4].imag_part = 0;

        x[5].real_part = -4;
        x[5].imag_part = 4;

        x[6].real_part = -4;
        x[6].imag_part = 0;

        x[7].real_part = -4;
        x[7].imag_part = -4;

        //--------------------------------------------------
        // Allow combinational logic to settle
        //--------------------------------------------------

        #20;

        //--------------------------------------------------
        // Display output
        //--------------------------------------------------

        $display("-----------------------------------------------");
        $display("           FFT Stage 3 Output");
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