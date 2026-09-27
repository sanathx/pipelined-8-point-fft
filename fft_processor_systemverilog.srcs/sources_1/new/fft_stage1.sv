import fft_pkg::*;
module fft_stage1 #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input  complex_t x [0:7],
    output complex_t y [0:7]
);
    logic [1:0] twiddle_addr;
    complex_t W0;
    assign twiddle_addr = 2'b00;
    twiddle_rom ROM0 (
        .addr(twiddle_addr),
        .W(W0)
    );
    butterfly BF0 (
        .A(x[0]),
        .B(x[1]),
        .W(W0),
        .Y0(y[0]),
        .Y1(y[1])
    );
    butterfly BF1 (
        .A(x[2]),
        .B(x[3]),
        .W(W0),
        .Y0(y[2]),
        .Y1(y[3])
    );
    butterfly BF2 (
        .A(x[4]),
        .B(x[5]),
        .W(W0),
        .Y0(y[4]),
        .Y1(y[5])
    );
    butterfly BF3 (
        .A(x[6]),
        .B(x[7]),
        .W(W0),
        .Y0(y[6]),
        .Y1(y[7])
    );
endmodule