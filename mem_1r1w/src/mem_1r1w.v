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

module mem_1r1w (clk, read_addr, read, read_data, write_addr, write, write_data);
	parameter DEPTH_LOG2 = 4;
	localparam ELEMENTS = 2**DEPTH_LOG2;
	parameter WIDTH = 32;

	input wire clk;

    input wire [DEPTH_LOG2-1:0] read_addr;
    input wire read;
	output reg [WIDTH-1:0] read_data;


	input wire [DEPTH_LOG2-1:0] write_addr;
	input wire write;
	input wire  [WIDTH-1:0] write_data;

reg [WIDTH-1:0] storage [ELEMENTS-1:0];

always @(posedge clk) begin
	if(write) begin
		storage[write_addr] <= write_data;
	end
	if(read)
		read_data <= storage[read_addr];
end

endmodule
