# Digital Door Lock System 

## Description

This project implements a Digital Door Lock System using Verilog HDL. The system checks a 4-digit password entered by the user and grants access only when the password matches the stored password. If an incorrect password is entered, an alarm is activated.

## Working

1. The user enters a 4-digit password through `digit_in`.
2. The `enter` signal acts like an ENTER button and stores each digit.
3. The system compares the entered password with the stored password (1234).
4. If the password is correct:
   - `door_unlock` becomes 1.
   - `alarm` remains 0.
5. If the password is incorrect:
   - `door_unlock` remains 0.
   - `alarm` becomes 1.
6. The `rst` signal resets the entire system.

## Inputs

- `clk` : System clock
- `rst` : Reset signal
- `digit_in[3:0]` : Password digit input
- `enter` : Enter button

## Outputs

- `door_unlock` : Indicates successful authentication
- `alarm` : Indicates incorrect password

## Test Cases

### Correct Password

digit_in=1234

Result:

door_unlock = 1
alarm = 0

### Incorrect Password

digit_in=1111

Result:

door_unlock = 0
alarm = 1


## Tools Used

- Verilog HDL
- EDA Playground
- Icarus Verilog
- EPWave

## Files

- `door_lock.v` : Digital Door Lock design
- `door_lock_tb.v` : Testbench for simulation
- `door_lock_waveform.png` : Simulation waveform

## Waveform

<img src="https://github.com/SujalPatil1616/Digital-Door-Lock-System/blob/main/Traffic_controller_waveform.png" width="1000">

## Result

The Digital Door Lock System was successfully simulated and verified. The system unlocks the door when the correct password is entered and activates the alarm when an incorrect password is entered.

## Author

Sujal Patil
