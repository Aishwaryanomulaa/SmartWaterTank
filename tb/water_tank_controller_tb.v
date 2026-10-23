`timescale 1ns/1ps

module water_tank_controller_tb;

    reg clk;
    reg rst;
    reg low_level;
    reg high_level;
    reg dry_run;
    reg motor_fault;

    wire pump_enable;
    wire tank_full;

    water_tank_controller uut (
        .clk(clk),
        .rst(rst),
        .low_level(low_level),
        .high_level(high_level),
        .dry_run(dry_run),
        .motor_fault(motor_fault),
        .pump_enable(pump_enable),
        .tank_full(tank_full)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("water_tank.vcd");
        $dumpvars(0, water_tank_controller_tb);

        clk = 0;
        rst = 1;
        low_level = 0;
        high_level = 0;
        dry_run = 0;
        motor_fault = 0;

        // Test 1: Reset should keep pump OFF
        #10;
        rst = 0;
        #10;
        if (pump_enable !== 0)
            $display("FAIL: Pump should be OFF after reset");
        else
            $display("PASS: Reset keeps pump OFF");

        // Test 2: Low level starts pumping
        low_level = 1;
        #10;
        if (pump_enable !== 1)
            $display("FAIL: Pump did not start at low level");
        else
            $display("PASS: Low level starts pump");

        // Test 3: High level stops pumping
        high_level = 1;
        #10;
        if (pump_enable !== 0 || tank_full !== 1)
            $display("FAIL: High level did not stop pump or mark tank full");
        else
            $display("PASS: High level stops pump and sets tank_full");

        // Return to low level
        low_level = 0;
        high_level = 0;
        #10;

        // Test 4: Dry-run fault stops pump
        low_level = 1;
        #10;
        dry_run = 1;
        #10;
        if (pump_enable !== 0)
            $display("FAIL: Dry-run fault did not stop pump");
        else
            $display("PASS: Dry-run fault stops pump");

        // Test 5: Motor fault stops pump
        dry_run = 0;
        motor_fault = 1;
        #10;
        if (pump_enable !== 0)
            $display("FAIL: Motor fault did not stop pump");
        else
            $display("PASS: Motor fault stops pump");

        // Test 6: Clear faults and reset safely
        motor_fault = 0;
        rst = 1;
        #10;
        rst = 0;
        low_level = 0;
        #10;
        if (pump_enable !== 0)
            $display("FAIL: Pump should remain OFF after recovery");
        else
            $display("PASS: Controller recovers safely");

        $display("Simulation completed.");
        $finish;
    end

endmodule
