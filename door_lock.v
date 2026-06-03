module door_lock(
    input clk,
    input rst,
    input [3:0] digit_in,
    input enter,

    output reg door_unlock,
    output reg alarm
);

reg [1:0] count;
reg [15:0] entered_password;

parameter PASSWORD = 16'h1234;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count <= 0;
        entered_password <= 0;
        door_unlock <= 0;
        alarm <= 0;
    end
    else
    begin
        if(enter)
        begin
            entered_password <= {entered_password[11:0], digit_in};
            count <= count + 1;

            if(count == 3)
            begin
                if({entered_password[11:0], digit_in} == PASSWORD)
                begin
                    door_unlock <= 1;
                    alarm <= 0;
                end
                else
                begin
                    door_unlock <= 0;
                    alarm <= 1;
                end
            end
        end
    end
end

endmodule
