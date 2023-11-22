//
// SPDX-FileCopyrightText: Copyright 2023 Darryl Miles
// SPDX-License-Identifier: Apache2.0
//
`default_nettype none
`ifdef TIMESCALE
`timescale 1ns/1ps
`endif
//
// MetaData-1.0::
// Module-Name: dffqn_negedge_async_reset
// Module-Language: Verilog-200?
// Input-Count: 3
// Input-1: clk Clock (negedge)
// Input-2: r reset (async active-high)
// Input-3: d data
// Output-Count: 2
// Output-1: q Q
// Output-2: qn Q-Inverted
//
//
//  D Flip-Flop (verilog register simulation)
//
//
//
module dffqn_negedge_async_reset (
    input  wire			clk,
    input  wire			reset,
    input  wire			d,

    output  reg			q,
    output wire			qn
);

    always @(negedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;
        end else begin
            q <= d;
        end
    end

    assign qn = ~q;

endmodule
