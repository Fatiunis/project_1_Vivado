`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x16
// Descripcion: Sumador de 16 bits (half-word) usando dos bloques add_x8.
// ============================================================================
module add_x16 (
    input  logic [15:0] a,     // Operando A (16 bits)
    input  logic [15:0] b,     // Operando B (16 bits)
    input  logic        cin,   // Acarreo inicial
    output logic [15:0] s,     // Suma resultante (16 bits)
    output logic        cout   // Acarreo de salida final
);

    logic carry_8; // Acarreo entre el byte inferior y el superior

    // Byte inferior: bits [7:0]
    add_x8 ADD_LOW (
        .a    (a[7:0]),
        .b    (b[7:0]),
        .cin  (cin),
        .s    (s[7:0]),
        .cout (carry_8)
    );

    // Byte superior: bits [15:8]
    add_x8 ADD_HIGH (
        .a    (a[15:8]),
        .b    (b[15:8]),
        .cin  (carry_8),
        .s    (s[15:8]),
        .cout (cout)
    );

endmodule