`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x128
// Descripcion: Sumador de 128 bits (quad word) instanciando dos add_x64.
// ============================================================================
module add_x128 (
    input  logic [127:0] a,     // Operando A (128 bits)
    input  logic [127:0] b,     // Operando B (128 bits)
    input  logic         cin,   // Acarreo de entrada
    output logic [127:0] s,     // Suma resultante (128 bits)
    output logic         cout   // Acarreo de salida
);

    logic carry_64; // Acarreo intermedio en la posicion 64

    // Mitad baja: bits [63:0]
    add_x64 ADD_LOW (
        .a    (a[63:0]),
        .b    (b[63:0]),
        .cin  (cin),
        .s    (s[63:0]),
        .cout (carry_64)
    );

    // Mitad alta: bits [127:64]
    add_x64 ADD_HIGH (
        .a    (a[127:64]),
        .b    (b[127:64]),
        .cin  (carry_64),
        .s    (s[127:64]),
        .cout (cout)
    );

endmodule