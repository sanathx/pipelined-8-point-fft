import fft_pkg::*;

module fft_stage2 #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input  complex_t x [0:7],
    output complex_t y [0:7]
);
    logic [1:0] addr0;
    logic [1:0] addr2;

    assign addr0 = 2'b00;
    assign addr2 = 2'b10;
    complex_t W0;
    complex_t W2;
    twiddle_rom ROM0 (
        .addr(addr0),
        .W(W0)
    );
    twiddle_rom ROM2 (
        .addr(addr2),
        .W(W2)
    );
    butterfly BF0 (
        .A(x[0]),
        .B(x[2]),
        .W(W0),
        .Y0(y[0]),
        .Y1(y[2])
    );
    butterfly BF1 (
        .A(x[1]),
        .B(x[3]),
        .W(W2),
        .Y0(y[1]),
        .Y1(y[3])
    );
    butterfly BF2 (
        .A(x[4]),
        .B(x[6]),
        .W(W0),
        .Y0(y[4]),
        .Y1(y[6])
    );
    butterfly BF3 (
        .A(x[5]),
        .B(x[7]),
        .W(W2),
        .Y0(y[5]),
        .Y1(y[7])
    );
endmodule