`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x256
// Descripcion: Modulo superior (Top) del sumador de 256 bits. Conecta dos
//              instancias de add_x128 en cascada para completar la jerarquia.
// ============================================================================
module add_x256 (
    input  logic [255:0] a,     // Operando A (256 bits)
    input  logic [255:0] b,     // Operando B (256 bits)
    input  logic         cin,   // Acarreo global de entrada
    output logic [255:0] s,     // Resultado total de la suma (256 bits)
    output logic         cout   // Acarreo global de desbordamiento (bit 256)
);

    logic carry_128; // Acarreo intermedio entre la mitad baja y la mitad alta

    // Mitad baja: bits [127:0]
    add_x128 ADD_LOW (
        .a    (a[127:0]),
        .b    (b[127:0]),
        .cin  (cin),
        .s    (s[127:0]),
        .cout (carry_128)
    );

    // Mitad alta: bits [255:128]
    add_x128 ADD_HIGH (
        .a    (a[255:128]),
        .b    (b[255:128]),
        .cin  (carry_128),
        .s    (s[255:128]),
        .cout (cout)
    );

endmodule