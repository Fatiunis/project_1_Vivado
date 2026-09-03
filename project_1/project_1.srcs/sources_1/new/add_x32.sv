`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x32
// Descripcion: Sumador de 32 bits (palabra completa / word) con dos add_x16.
// ============================================================================
module add_x32 (
    input  logic [31:0] a,     // Operando A (32 bits)
    input  logic [31:0] b,     // Operando B (32 bits)
    input  logic        cin,   // Acarreo de entrada
    output logic [31:0] s,     // Suma resultante (32 bits)
    output logic        cout   // Acarreo de salida
);

    logic carry_16; // Acarreo entre los 16 bits bajos y los 16 bits altos

    // Mitad baja: bits [15:0]
    add_x16 ADD_LOW (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (cin),
        .s    (s[15:0]),
        .cout (carry_16)
    );

    // Mitad alta: bits [31:16]
    add_x16 ADD_HIGH (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (carry_16),
        .s    (s[31:16]),
        .cout (cout)
    );

endmodule