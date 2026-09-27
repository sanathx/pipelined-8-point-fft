import fft_pkg::*;
module twiddle_rom #(
    parameter int WIDTH = fft_pkg::WIDTH
)(
    input  logic [1:0] addr,
    output complex_t   W
);
always_comb begin
    case(addr)
        2'b00: begin
            W.real_part = 16'sh7FFF;
            W.imag_part = 16'sh0000;
        end
        2'b01: begin
            W.real_part = 16'sh5A82;
            W.imag_part = 16'shA57E;
        end
        2'b10: begin
            W.real_part = 16'sh0000;
            W.imag_part = 16'sh8000;
        end
        2'b11: begin
            W.real_part = 16'shA57E;
            W.imag_part = 16'shA57E;
        end
        default: begin
            W.real_part = '0;
            W.imag_part = '0;
        end
    endcase
end
endmodule