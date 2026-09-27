import fft_pkg::*;
module butterfly #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input complex_t A,
    input complex_t B,
    input complex_t W,
    output complex_t Y0,
    output complex_t Y1
);
    complex_t BW;
    complex_multiplier MULT (
        .A(B),
        .B(W),
        .P(BW)
    );
    assign Y0.real_part = A.real_part + BW.real_part;
    assign Y0.imag_part = A.imag_part + BW.imag_part;

    assign Y1.real_part = A.real_part - BW.real_part;
    assign Y1.imag_part = A.imag_part - BW.imag_part;
endmodule