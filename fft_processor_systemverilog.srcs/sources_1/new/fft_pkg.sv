package fft_pkg;
    parameter int WIDTH = 16;
    parameter int FFT_SIZE = 8;
    typedef struct packed {
        logic signed [WIDTH-1:0] real_part;
        logic signed [WIDTH-1:0] imag_part;
    } complex_t;
endpackage