`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x8
// Descripcion: Sumador de 8 bits (byte completo) construido con dos add_x4.
// ============================================================================
module add_x8 (
    input  logic [7:0] a,     // Operando A (8 bits)
    input  logic [7:0] b,     // Operando B (8 bits)
    input  logic       cin,   // Acarreo de entrada
    output logic [7:0] s,     // Suma resultante (8 bits)
    output logic       cout   // Acarreo de desbordamiento (bit 8)
);

    logic carry_4; // Acarreo del nibble bajo al nibble alto

    // Nibble bajo: bits [3:0]
    add_x4 ADD_LOW (
        .a    (a[3:0]),
        .b    (b[3:0]),
        .cin  (cin),
        .s    (s[3:0]),
        .cout (carry_4)
    );

    // Nibble alto: bits [7:4]
    add_x4 ADD_HIGH (
        .a    (a[7:4]),
        .b    (b[7:4]),
        .cin  (carry_4),
        .s    (s[7:4]),
        .cout (cout)
    );

endmodule