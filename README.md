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
## Challenges & Insights <br/>
### Module 1: <br/>
In the Euclidean Algorithm for GCD, the "udiv" code causes an error in the program, as it is not available in ARMv7 32-bit, based on my research. At first, I inserted a udiv code from an s file from the internet, which successfully performs the division. However, it became a challenge to integrate it into my program as it exits the program while I still have several codes to run after it. In this case, I still have to do several tweaking from that code. So, resolving the issue, I just made my own code for division based on the manual calculation.

For the Bitwise Parity Checker, it was a challenge to make a way to determine whether the parity is odd or even. I skipped the previous problem (udiv) and proceeded to this problem at first. One way to determine is to check whether the number is divisible by 2 or not. As I did not have the division code yet at the time, I just depended on the value, 1, or the least significant bit, as it is the only odd number.  
