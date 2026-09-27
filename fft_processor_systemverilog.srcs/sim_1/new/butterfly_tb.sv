`timescale 1ns/1ps

import fft_pkg::*;

module butterfly_tb;

    complex_t A;
    complex_t B;
    complex_t W;

    complex_t Y0;
    complex_t Y1;

    butterfly DUT (
        .A(A),
        .B(B),
        .W(W),
        .Y0(Y0),
        .Y1(Y1)
    );

    initial begin

        //--------------------------------------------------
        // Test:
        //
        // A = 8 + j0
        // B = 12 + j0
        // W = 0 - j1
        //
        // B*W = -j12
        //
        // Y0 = A + B*W
        //    = 8 - j12
        //
        // Y1 = A - B*W
        //    = 8 + j12
        //--------------------------------------------------

        A.real_part = 8;
        A.imag_part = 0;

        B.real_part = 12;
        B.imag_part = 0;

        W.real_part = 0;
        W.imag_part = -32768;

        #20;

        $display("-----------------------------------------------");
        $display("             Butterfly Test");
        $display("-----------------------------------------------");

        $display("A  = %0d + j%0d",
                 A.real_part,
                 A.imag_part);

        $display("B  = %0d + j%0d",
                 B.real_part,
                 B.imag_part);

        $display("W  = %0d + j%0d",
                 W.real_part,
                 W.imag_part);

        $display("Y0 = %0d + j%0d",
                 Y0.real_part,
                 Y0.imag_part);

        $display("Y1 = %0d + j%0d",
                 Y1.real_part,
                 Y1.imag_part);

        $display("-----------------------------------------------");

        $finish;

    end

endmodule