`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x64
// Descripcion: Sumador de 64 bits (double word) instanciando dos add_x32.
// ============================================================================
module add_x64 (
    input  logic [63:0] a,     // Operando A (64 bits)
    input  logic [63:0] b,     // Operando B (64 bits)
    input  logic        cin,   // Acarreo inicial
    output logic [63:0] s,     // Suma resultante (64 bits)
    output logic        cout   // Acarreo final
);

    logic carry_32; // Acarreo propagado desde la mitad baja

    // Mitad baja: bits [31:0]
    add_x32 ADD_LOW (
        .a    (a[31:0]),
        .b    (b[31:0]),
        .cin  (cin),
        .s    (s[31:0]),
        .cout (carry_32)
    );

    // Mitad alta: bits [63:32]
    add_x32 ADD_HIGH (
        .a    (a[63:32]),
        .b    (b[63:32]),
        .cin  (carry_32),
        .s    (s[63:32]),
        .cout (cout)
    );

endmodule