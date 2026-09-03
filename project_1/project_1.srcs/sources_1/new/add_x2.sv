`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x2
// Descripcion: Sumador de 2 bits construido mediante la interconexion en cascada
//              de dos modulos add_x1 (Ripple-Carry).
// ============================================================================
module add_x2 (
    input  logic [1:0] a,     // Operando A (2 bits)
    input  logic [1:0] b,     // Operando B (2 bits)
    input  logic       cin,   // Acarreo de entrada global
    output logic [1:0] s,     // Suma resultante (2 bits)
    output logic       cout   // Acarreo final de salida
);

    logic carry_1; // Acarreo interno entre bit 0 y bit 1

    // Bit menos significativo (LSB): bit 0
    add_x1 FA0 (
        .a    (a[0]),
        .b    (b[0]),
        .cin  (cin),
        .s    (s[0]),
        .cout (carry_1)
    );

    // Bit mas significativo (MSB): bit 1
    add_x1 FA1 (
        .a    (a[1]),
        .b    (b[1]),
        .cin  (carry_1),
        .s    (s[1]),
        .cout (cout)
    );

endmodule