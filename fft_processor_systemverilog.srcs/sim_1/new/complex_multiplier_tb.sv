`timescale 1ns/1ps

import fft_pkg::*;

module complex_multiplier_tb;

    complex_t A;
    complex_t B;
    complex_t P;

    complex_multiplier DUT (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin

        //--------------------------------------------------
        // Test:
        //
        // A = 12 + j0
        // B = 0 - j1
        //
        // Expected:
        // P = 0 - j12
        //--------------------------------------------------

        A.real_part = 12;
        A.imag_part = 0;

        B.real_part = 0;
        B.imag_part = -32768;

        #20;

        $display("-----------------------------------------------");
        $display("       Complex Multiplier Test");
        $display("-----------------------------------------------");

        $display("A = %0d + j%0d",
                 A.real_part,
                 A.imag_part);

        $display("B = %0d + j%0d",
                 B.real_part,
                 B.imag_part);

        $display("P = %0d + j%0d",
                 P.real_part,
                 P.imag_part);

        $display("-----------------------------------------------");

        $finish;

    end

endmodule