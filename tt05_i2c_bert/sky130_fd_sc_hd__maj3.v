//
// SKY130 process implementation cell/module mapping
//
// SPDX-FileCopyrightText: Copyright 2023 Darryl Miles
// SPDX-License-Identifier: Apache2.0
//
// This file exist to map the behavioural cell name 'sky130_fd_sc_hd__maj3'
//   into a specific cell in the PDK such as 'sky130_fd_sc_hd__maj3_2'
//
`default_nettype none

module sky130_fd_sc_hd__maj3 #(
    parameter integer DRIVE_LEVEL = 2
) (
    X,
    A,
    B,
    C
);

    // Module ports
    output wire X;
    input  wire A;
    input  wire B;
    input  wire C;

    generate
        if (DRIVE_LEVEL == 2) begin
            sky130_fd_sc_hd__maj3_2 maj3_2 (
`ifdef USE_POWER_PINS
                .VPWR (1'b1),
                .VGND (1'b0),
                .VPB  (1'b1),
                .VNB  (1'b0),
`endif
                .X    (X),
                .A    (A),
                .B    (B),
                .C    (C)
            );
        end else begin
            // Check sky130 cell library for your requirement and add case
            $error("DRIVE_LEVEL=%d is not implemented", DRIVE_LEVEL);
        end
    endgenerate

endmodule
