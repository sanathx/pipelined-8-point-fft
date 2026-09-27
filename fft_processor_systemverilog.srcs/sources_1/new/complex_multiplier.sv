import fft_pkg::*;
module complex_multiplier #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input  complex_t A,
    input  complex_t B,
    output complex_t P
);
    logic signed [(2*WIDTH)-1:0] ac;
    logic signed [(2*WIDTH)-1:0] bd;
    logic signed [(2*WIDTH)-1:0] ad;
    logic signed [(2*WIDTH)-1:0] bc;
    assign ac = A.real_part * B.real_part;
    assign bd = A.imag_part * B.imag_part;
    assign ad = A.real_part * B.imag_part;
    assign bc = A.imag_part * B.real_part;
    function automatic logic signed [WIDTH-1:0] q15_round(
        input logic signed [(2*WIDTH)-1:0] value
    );
        logic signed [(2*WIDTH)-1:0] rounded;
        begin
            rounded = value + (1 <<< (WIDTH-2));
            q15_round = rounded >>> (WIDTH-1);
        end
    endfunction
    assign P.real_part = q15_round(ac - bd);
    assign P.imag_part = q15_round(ad + bc);

endmodule