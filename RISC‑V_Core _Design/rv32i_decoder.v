`timescale 1ns / 1ps

module rv32i_decoder (
    input  wire [31:0] instr,      // 32-bit Instruction
    output reg         is_rtype,   // R-Type instruction flag
    output reg         is_itype,   // I-Type instruction flag
    output reg         is_load,    // Load instruction flag
    output reg         is_store,   // Store instruction flag
    output reg         is_branch,  // Branch instruction flag
    output reg [4:0]   rs1,        // Source Register 1
    output reg [4:0]   rs2,        // Source Register 2
    output reg [4:0]   rd,         // Destination Register
    output reg [2:0]   funct3,     // Funct3 field
    output reg [6:0]   funct7      // Funct7 field
);

    wire [6:0] opcode = instr[6:0];

    always @(*) begin
        // Varsayılan değerler
        is_rtype  = 1'b0;
        is_itype  = 1'b0;
        is_load   = 1'b0;
        is_store  = 1'b0;
        is_branch = 1'b0;
        
        // Temel alanların ayrıştırılması
        rd     = instr[11:7];
        funct3 = instr[14:12];
        rs1    = instr[19:15];
        rs2    = instr[24:20];
        funct7 = instr[31:25];

        // Opcode'a göre instruction tipini belirleme
        case (opcode)
            7'b0110011: is_rtype  = 1'b1; // R-Type (ADD, SUB, SLL vb.)
            7'b0010011: is_itype  = 1'b1; // I-Type (ADDI, SLTI vb.)
            7'b0000011: is_load   = 1'b1; // Load (LW, LH, LB)
            7'b0100011: is_store  = 1'b1; // Store (SW, SH, SB)
            7'b1100011: is_branch = 1'b1; // Branch (BEQ, BNE vb.)
            default: ; // Diğer tipler (J-Type, U-Type vb. eklenebilir)
        endcase
    end

endmodule
