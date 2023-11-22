//
// SKY130 process implementation cell/module mapping
//
// SPDX-FileCopyrightText: Copyright 2023 Darryl Miles
// SPDX-License-Identifier: Apache2.0
//
// This file exist to map the behavioural cell name 'sky130_fd_sc_hd__dlrtp'
//   into a specific cell in the PDK such as 'sky130_fd_sc_hd__dlrtp_2'
//
`default_nettype none

module sky130_fd_sc_hd__dlrtp #(
    parameter integer DRIVE_LEVEL = 2
) (
    Q      ,
    RESET_B,
    D      ,
    GATE
);

    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE   ;

    generate
        if (DRIVE_LEVEL == 2) begin
            sky130_fd_sc_hd__dlrtp_2 dlrtp_2 (
`ifdef USE_POWER_PINS
                .VPWR    (1'b1),
                .VGND    (1'b0),
                .VPB     (1'b1),
                .VNB     (1'b0),
`endif
                .Q       (Q),
                .RESET_B (RESET_B),
                .D       (D),
                .GATE    (GATE)
            );
        end else begin
            // Check sky130 cell library for your requirement and add case
            $error("DRIVE_LEVEL=%d is not implemented", DRIVE_LEVEL);
        end
    endgenerate

endmodule
