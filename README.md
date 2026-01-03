# CO513-Programming
------
## ARMv7 Programming: <br/> 
Exploring the fundamentals of assembly language <br/>
Simulator: [CPUlator ARMv7 System Simulator](https://cpulator.01xz.net/?sys=arm-de1soc)

| Module               | Contents               | Video |
|------------------------|------------------------|-----|
| 1: The ARM Assembly Language | <ul><li>Factorial Calculation</li><li>Euclidean Algorithm for GCD</li><li>Bitwise Parity Checker</li><li>Swap Nibbles in a Byte</li><li>Find the Maximum Value in an Array </li></ul> | [Module 1](https://youtu.be/qEHheLznXWg) |
| 2: ARMv7 DE1-SoC I/O Devices | <ul><li>Counter Up/Down</li></ul> | [Module 2](https://youtu.be/y3JloB7ADv8) |

----
### Module 1: Challenges & Insights<br/>
In the Euclidean Algorithm for GCD, the "udiv" code causes an error in the program, as it is not available in ARMv7 32-bit, based on my research. At first, I inserted a udiv code from an s file from the internet, which successfully performs the division. However, it became a challenge to integrate it into my program as it exits the program while I still have several codes to run after it. In this case, I still have to do several tweaking from that code. So, resolving the issue, I just made my own code for division based on the manual calculation.

For the Bitwise Parity Checker, it was a challenge to make a way to determine whether the parity is odd or even. I skipped the previous problem (udiv) and proceeded to this problem at first. One way to determine is to check whether the number is divisible by 2 or not. As I did not have the division code yet at the time, I just depended on the value, 1, or the least significant bit, as it is the only odd number.  

### Module 2: Debouncing and Method Used<br/>
Mechanical switch bounce is the unintentional reaction from a single press on the button which results in multiple rapid transitions or bounces from one state to another before the desired state is finalized. This phenomenon is caused by the physical aspects of the switch, which determines the input of the digital circuits that will, in turn, produce the output. Some source examples include the kinetic energy of the metal contact with the stationary contact, the unintended multiple reconnections of the contacts as they oscillate due to spring-like behavior, and the microscopic irregularities in the contact surfaces.  


The mechanical switch bounce is caused by the physical aspects of the switches, and it can result in unintentional or unwanted outputs; we can consider it as noise. Noise must be filtered or eliminated to prevent it from interfering with the normal operations of the devices. In this case, software debouncing is used to deal with these types of noise and allow us to produce the correct output using code. 


Debouncing ensures the correct operation of the system, allowing the user to fully control the board according to the desired function. 

As debouncing is caused by the physical aspects of the input, such as a switch or a key, hardware systems, which are subject to other factors apart from the circuit design, requires an additional noise-filter layer that ensures that the function of the system must be met without interruption or no error. Without debouncing, the output can be chaotic, and it will be challenging for the user to use such a system. If such noise continuously interrupts the operation of the system, it may not be considered functional at all. For example, a keyboard without debounce might produce gibberish typographical errors, and the user must repeatedly delete the noise before getting what he/she actually want to type, which must be tedious for typing a paragraph or more.

In the program, I have used time delays in three functions: in the timer (displaying the two-digit number within one second), the run/pause function, and the debouncing.

For the timer, I used a 10000000 time constant, 3 in run/pause, and 50000 in debouncing.

Time constants are relatively smaller in pause and debouncing compared to the timer of the display because they affect the operation of the program. If the constants for debouncing and pause are higher, it will take longer for the program to respond to the inputs or the changes in the state of the switch and keys.

For the pause function, I have implemented a time delay and repeated checking of a change in the state of the key. The delay is crucial to ensure that the input state is already stable.

Without the time delays, the program may still perform the functions; however, the counting would be too fast and would not be observable. 

