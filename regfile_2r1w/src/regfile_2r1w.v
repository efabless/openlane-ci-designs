// SPDX-FileCopyrightText: 2023 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
module regfile_2r1w(
    input  wire                     clk,
    input  wire                     rst_n,

    input  wire                     rs1_read,
    input  wire [DEPTH_LOG2-1:0]    rs1_addr,
    output wire [WIDTH-1:0]         rs1_rdata,

    input  wire                     rs2_read,
    input  wire [DEPTH_LOG2-1:0]    rs2_addr,
    output wire [WIDTH-1:0]         rs2_rdata,
    
    input  wire [DEPTH_LOG2-1:0]    rd_addr,
    input  wire [WIDTH-1:0]         rd_wdata,
    input  wire                     rd_write
);

parameter WIDTH = 32;
parameter DEPTH_LOG2 = 4;

wire                         write = !rst_n  ? 1 : (rd_write && (rd_addr != 0));
wire [DEPTH_LOG2-1:0] write_addr = !rst_n  ? 0 : rd_addr;
wire [WIDTH-1:0]         write_data = !rst_n  ? 0 : rd_wdata;


mem_1r1w #(.DEPTH_LOG2(DEPTH_LOG2), .WIDTH(WIDTH)) lane0(
    .clk(clk),

    .read_addr(rs1_addr),
    .read(rs1_read),
    .read_data(rs1_rdata),

    .write(write),
    .write_addr(write_addr),
    .write_data(write_data)
);



mem_1r1w #(.DEPTH_LOG2(DEPTH_LOG2), .WIDTH(WIDTH)) lane1(
    .clk(clk),

    .read_addr(rs2_addr),
    .read(rs2_read),
    .read_data(rs2_rdata),

    .write(write),
    .write_addr(write_addr),
    .write_data(write_data)
);


endmodule


