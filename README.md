# CO513-Programming
------
## ARMv7 Programming: <br/> 
Exploring the fundamentals of assembly language <br/>
Simulator: [CPUlator ARMv7 System Simulator](https://cpulator.01xz.net/?sys=arm-de1soc)

| Module               | Contents               | Video |
|------------------------|------------------------|-----|
| 1: The ARM Assembly Language | <ul><li>Factorial Calculation</li><li>Euclidean Algorithm for GCD</li><li>Bitwise Parity Checker</li><li>Swap Nibbles in a Byte</li><li>Find the Maximum Value in an Array </li></ul> | [Module 1](https://youtu.be/qEHheLznXWg) |

----
## Challenges <br/>
### Module 1: <br/>
In Euclidean Algorithm for GCD, the "udiv" code causes an error in the program, as it is not available in ARMv7 32-bit, based on my research. At first, I inserted a udiv code from an s file from the internet, which successfully performs the division. However, it became a challenge to integrate it into my program as it exits the program while I still have several codes to run after it. In this case, I still have to do several tweaking from that codes. So, resolving the issue, I just made my own code for division based on the manual calculation.
