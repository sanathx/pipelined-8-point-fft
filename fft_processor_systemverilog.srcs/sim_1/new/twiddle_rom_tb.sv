`timescale 1ns/1ps

import fft_pkg::*;

module twiddle_rom_tb;

    logic [1:0] addr;
    complex_t W;

    twiddle_rom DUT(
        .addr(addr),
        .W(W)
    );

    initial begin

        $display("--------------------------------");

        addr = 2'b00;
        #10;
        $display("Addr = %b -> W = %0d + j%0d",
                 addr, W.real_part, W.imag_part);

        addr = 2'b01;
        #10;
        $display("Addr = %b -> W = %0d + j%0d",
                 addr, W.real_part, W.imag_part);

        addr = 2'b10;
        #10;
        $display("Addr = %b -> W = %0d + j%0d",
                 addr, W.real_part, W.imag_part);

        addr = 2'b11;
        #10;
        $display("Addr = %b -> W = %0d + j%0d",
                 addr, W.real_part, W.imag_part);

        $display("--------------------------------");

        $finish;

    end

endmodule