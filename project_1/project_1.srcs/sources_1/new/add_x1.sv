`timescale 1ns / 1ps

// ============================================================================
// Modulo: add_x1
// Descripcion: Sumador completo de 1 bit (Full Adder) empleando logica
//              de generacion (g) y propagacion (p) de acarreo.
// ============================================================================
module add_x1 (
    input  logic a,     // Primer operando de 1 bit
    input  logic b,     // Segundo operando de 1 bit
    input  logic cin,   // Acarreo de entrada
    output logic s,     // Resultado de la suma
    output logic cout   // Acarreo de salida
);

    logic p; // Senal de propagacion de acarreo
    logic g; // Senal de generacion de acarreo

    // Logica Carry Propagate / Generate
    assign p = a ^ b;
    assign g = a & b;

    // Calculo del bit de suma y acarreo saliente
    assign s    = p ^ cin;
    assign cout = g | (p & cin);

endmodule