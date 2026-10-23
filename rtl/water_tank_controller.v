module water_tank_controller (
    input wire clk,
    input wire rst,
    input wire low_level,
    input wire high_level,
    input wire dry_run,
    input wire motor_fault,
    output reg pump_enable,
    output reg tank_full
);

    localparam IDLE = 2'b00;
    localparam PUMPING = 2'b01;
    localparam FAULT = 2'b10;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = state;

        case (state)
            IDLE: begin
                if (dry_run || motor_fault)
                    next_state = FAULT;
                else if (low_level && !high_level)
                    next_state = PUMPING;
            end

            PUMPING: begin
                if (dry_run || motor_fault)
                    next_state = FAULT;
                else if (high_level)
                    next_state = IDLE;
            end

            FAULT: begin
                if (!dry_run && !motor_fault)
                    next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        pump_enable = 1'b0;
        tank_full = high_level;

        if (state == PUMPING && !dry_run && !motor_fault && !high_level)
            pump_enable = 1'b1;
    end

endmodule
