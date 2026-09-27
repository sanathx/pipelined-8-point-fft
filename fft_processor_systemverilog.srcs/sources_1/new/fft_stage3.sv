import fft_pkg::*;
module fft_stage3 #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input complex_t x [0:7],
    output complex_t y [0:7]
);
    complex_t W0;
    complex_t W1;
    complex_t W2;
    complex_t W3;
    twiddle_rom ROM0 (
        .addr(2'b00),
        .W(W0)
    );
    twiddle_rom ROM1 (
        .addr(2'b01),
        .W(W1)
    );
    twiddle_rom ROM2 (
        .addr(2'b10),
        .W(W2)
    );
    twiddle_rom ROM3 (
        .addr(2'b11),
        .W(W3)
    );
    butterfly BF0 (
        .A(x[0]),
        .B(x[4]),
        .W(W0),
        .Y0(y[0]),
        .Y1(y[4])
    );
    butterfly BF1 (
        .A(x[1]),
        .B(x[5]),
        .W(W1),
        .Y0(y[1]),
        .Y1(y[5])
    );
    butterfly BF2 (
        .A(x[2]),
        .B(x[6]),
        .W(W2),
        .Y0(y[2]),
        .Y1(y[6])
    );
    butterfly BF3 (
        .A(x[3]),
        .B(x[7]),
        .W(W3),
        .Y0(y[3]),
        .Y1(y[7])
    );
endmodule