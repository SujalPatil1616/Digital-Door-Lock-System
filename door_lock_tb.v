`timescale 1ns/1ps

module door_lock_tb;

reg clk;
reg rst;
reg [3:0] digit_in;
reg enter;

wire door_unlock;
wire alarm;

door_lock uut(
    .clk(clk),
    .rst(rst),
    .digit_in(digit_in),
    .enter(enter),
    .door_unlock(door_unlock),
    .alarm(alarm)
);

always #10 clk = ~clk;

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, door_lock_tb);

    clk = 0;
    rst = 1;
    enter = 0;
    digit_in = 0;

    #20 rst = 0;

    // Correct password : 1 2 3 4

    #20 digit_in = 4'h1; enter = 1;
    #20 enter = 0;

    #20 digit_in = 4'h2; enter = 1;
    #20 enter = 0;

    #20 digit_in = 4'h3; enter = 1;
    #20 enter = 0;

    #20 digit_in = 4'h4; enter = 1;
    #20 enter = 0;

    #100;

    // Reset

    rst = 1;
    #20 rst = 0;

    // Wrong password : 1 1 1 1

    #20 digit_in = 4'h1; enter = 1;
    #20 enter = 0;

    #20 digit_in = 4'h1; enter = 1;
    #20 enter = 0;

    #20 digit_in = 4'h1; enter = 1;
    #20 enter = 0;

    #20 digit_in = 4'h1; enter = 1;
    #20 enter = 0;

    #100;

    $finish;
end

endmodule
