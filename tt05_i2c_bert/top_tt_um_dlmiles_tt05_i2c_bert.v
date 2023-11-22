//
// SPDX-FileCopyrightText: Copyright 2023 Darryl Miles
// SPDX-License-Identifier: Apache2.0
//
`default_nettype none

module tt_um_dlmiles_tt05_i2c_bert (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Improve reliability when using TT PCB reset button
    reg rst_n_sync;

    always @(posedge clk)
        rst_n_sync <= rst_n;

    // Configuration latch bit experiment (test payload?)
    reg [7:0] latched_ena_uio_in;
    always_latch begin
        if (!ena)
            latched_ena_uio_in = uio_in;
    end

    reg [7:0] latched_ena_ui_in;
    always_latch begin
        if (!ena)
            latched_ena_ui_in = ui_in;
    end

    // Configuration latch bit experiment (configuration?)
    reg [7:0] latched_rst_n_uio_in;
    always_latch begin
        if (!rst_n)
            latched_rst_n_uio_in = uio_in;
    end

    reg [7:0] latched_rst_n_ui_in;
    always_latch begin
        if (!rst_n)
            latched_rst_n_ui_in = ui_in;
    end

    wire [31:0] latched;
    assign latched = {latched_ena_uio_in, latched_ena_ui_in, latched_rst_n_uio_in, latched_rst_n_ui_in};

`ifdef HAVE_DEBUG_I2C
    // These exist like this as some simulators setups used by project do not allow the
    //  external signal to present X or Z state.  But the simulator can model X/Z state,
    //  so we provide project verilog enough signal information to create different views
    //  to help observe signalling.
    reg  debug_SCL_ie;	// input-enable (peer is driving)
    wire debug_SCL_od;	// bus view of open-drain
    wire debug_SCL_pp;	// bus view of push-pull
    wire debug_SCL_og;	// open-drain is good (should always be true)
    wire debug_SCL_pg;	// push-pull is good (should always be true)
    wire debug_SCL_os;	// open-drain line state view (X is error, pull-up when no driver)
    wire debug_SCL_ps;	// push-pull line state view (X is error, Z is no driver)

    reg  debug_SDA_ie;	// input-enable (peer is driving)
    wire debug_SDA_od;	// bus view of open-drain
    wire debug_SDA_pp;	// bus view of push-pull
    // These are designed to be easy to see debug signals to validate (like SVA assert)
    //  the bus conditions never enter an illegal state (both ends driving).
    wire debug_SDA_og;	// open-drain is good (should always be true)
    wire debug_SDA_pg;	// push-pull is good (should always be true)
    wire debug_SDA_os;	// open-drain line state view (X is error, pull-up when no driver)
    wire debug_SDA_ps;	// push-pull line state view (X is error, Z is no driver)

    // SpinalHDL/SpinalSim does not have a method in create a 'z' signal
    // So we supply a constant 'z' into the project module and SpinalHDL can connect
    //   that though to any nets we want a 'z' state on
    wire simulation_z;
    assign simulation_z = 1'bz;
`endif

    TT05I2CBertTop i2c_bert (
`ifdef HAVE_DEBUG_I2C
        .debug_SCL_ie  (debug_SCL_ie),		//i
        .debug_SCL_od  (debug_SCL_od),		//o
        .debug_SCL_pp  (debug_SCL_pp),		//o
        .debug_SCL_og  (debug_SCL_og),		//o
        .debug_SCL_pg  (debug_SCL_pg),		//o
        .debug_SCL_os  (debug_SCL_os),		//o
        .debug_SCL_ps  (debug_SCL_ps),		//o

        .debug_SDA_ie  (debug_SDA_ie),		//i
        .debug_SDA_od  (debug_SDA_od),		//o
        .debug_SDA_pp  (debug_SDA_pp),		//o
        .debug_SDA_og  (debug_SDA_og),		//o
        .debug_SDA_pg  (debug_SDA_pg),		//o
        .debug_SDA_os  (debug_SDA_os),		//o
        .debug_SDA_ps  (debug_SDA_ps),		//o

        .simulation_z  (simulation_z),          //i
`endif

        .clk        (clk),              //i
        .rst_n      (rst_n_sync),       //i
        .ena        (ena),              //i

        .ui_in      (ui_in),            //i
        .uo_out     (uo_out),           //o
        .uio_in     (uio_in),           //i
        .uio_out    (uio_out),          //o
        .uio_oe     (uio_oe),           //o

        .latched    (latched)           //i
    );


endmodule
