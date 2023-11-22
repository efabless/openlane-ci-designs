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
// Module-Name: dff_async_reset
// Module-Language: Verilog-200?
// Input-Count: 3
// Input-1: clk Clock (posedge)
// Input-2: reset Reset (async active-high)
// Input-3: d data
// Output-Count: 1
// Output-1: q Q
//
//
//  D Flip-Flop, async Reset (active HIGH) (verilog register simulation)
//
//
//
module dff_async_reset (
    input  wire		clk,
    input  wire		reset,	// active high
    input  wire		d,

    output  reg		q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;		// reset
        end else begin
            q <= d;
        end
    end

endmodule
