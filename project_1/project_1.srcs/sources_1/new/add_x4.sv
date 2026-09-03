`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x4
// Descripcion: Sumador de 4 bits instanciando dos bloques add_x2 en cascada.
// ============================================================================
module add_x4 (
    input  logic [3:0] a,     // Operando A (4 bits)
    input  logic [3:0] b,     // Operando B (4 bits)
    input  logic       cin,   // Acarreo inicial
    output logic [3:0] s,     // Resultado de la suma (4 bits)
    output logic       cout   // Acarreo final
);

    logic carry_2; // Acarreo intermedio entre bloque bajo y bloque alto

    // Mitad baja: bits [1:0]
    add_x2 ADD_LOW (
        .a    (a[1:0]),
        .b    (b[1:0]),
        .cin  (cin),
        .s    (s[1:0]),
        .cout (carry_2)
    );

    // Mitad alta: bits [3:2]
    add_x2 ADD_HIGH (
        .a    (a[3:2]),
        .b    (b[3:2]),
        .cin  (carry_2),
        .s    (s[3:2]),
        .cout (cout)
    );

endmodule