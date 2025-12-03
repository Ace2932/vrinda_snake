`timescale 1ns / 1ps

module sprite_rom #(
    parameter integer SPRITE_W = 16,
    parameter integer SPRITE_H = 16,
    parameter         FILENAME = "sprite.hex"
)(
    input  wire [$clog2(SPRITE_W)-1:0] sx,   // sprite x coordinate (0..SPRITE_W-1)
    input  wire [$clog2(SPRITE_H)-1:0] sy,   // sprite y coordinate (0..SPRITE_H-1)
    output reg  [11:0]                 rgb   // 12-bit RGB (4:4:4)
);
    
    localparam integer DEPTH = SPRITE_W * SPRITE_H;

    // 1D memory: row-major order, index = sy*SPRITE_W + sx
    reg [11:0] mem [0:DEPTH-1];

    // Load sprite pixels from hex file at synthesis/sim time
    initial begin
        $readmemh(FILENAME, mem);
    end

    always @(*) begin
        rgb = mem[ sy * SPRITE_W + sx ];
    end

endmodule
