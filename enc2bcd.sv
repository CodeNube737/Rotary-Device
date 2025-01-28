// File: enc2bcd.sv
// Description: Works along with encoder.sv (2025-01-27, MR) to 
// 	take-in values from 0 to 255 and output a decimal value from 0 to 99.
// Author: Mikhail Rego with the help of OpenAI
// Date: 2025-01-27

module enc2bcd(
    input logic clk,                  // Clock signal
    input logic [7:0] enc_count,      // Input count in raw hex (0x00 to 0xFF)
    output logic [7:0] bcd_count      // Binary-coded decimal output (0x00 to 0x99)
);

    // Registers for BCD conversion
    logic [7:0] temp_bcd;
    logic [3:0] tens, ones; // Individual BCD digits

    // Sequential logic for conversion
    always_ff @(posedge clk) begin
        // Initialize temporary values
        temp_bcd = enc_count;
        tens = 4'b0000;
        ones = 4'b0000;

        // Process each nibble of temp_bcd to ensure proper carry
        ones = temp_bcd[3:0]; // Extract lower nibble
        tens = temp_bcd[7:4]; // Extract upper nibble

        // Ensure carry for BCD rules (0-9 per nibble)
        if (ones >= 4'd10) begin
            ones = ones - 4'd10;
            tens = tens + 4'd1;
        end

        if (tens >= 4'd10) begin
            tens = tens - 4'd10;
        end

        // Combine tens and ones into the final BCD count
        bcd_count = {tens, ones};
    end

endmodule

