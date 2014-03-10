CE3_Agnolutto
=============
###Moore Machine Analysis
The task was to develop a simple elevator controller that moved up and down using a Moore machine. It was not that 
challenging seeing as how most of the code was provided and we just had to have a basic understanding of how
an elevator works to fill in the code. It was mainly copy and paste. The fourth floor obviously can't go up anymore
so the only option is to go down. The output logic was pretty easy as well, just know what floor correlates to what
binary number. Not very difficult. I answered the questions that were in the shell in my code next to the question.

![Moore] (https://raw.github.com/C15Agnolutto/CE3_Agnolutto/master/Moore_testbench.PNG)

The next task was to make a testbench the trick this time, using a clock function. Still not very difficult. The 
instructions gave a pretty clear step by step understanding of how to do it. Started the elevator on the first 
floor with a reset<='1' made it go up each floor but stopping for two clock cycles at each one (helpfulling in trying to
analysis the testbench), and then go down each floor without stopping. The main difference between this and all the other
testbenches we have made is that this is sequential logic so the output only changes with the change of the clock. So 
the floor doesn't change value until a clock cycle has been completed (unless it is stopping at each floor in which 
case it is waiting two clock cycles before doing anything). 





###Mealy Machine Analysis
The following task was to develop the same elevator controller using a Mealy machine. The main difference between a 
Mealy and Moore machine is that the Mealy will have one or more inputs go directly to the output logic state skipping
the clock function; the output depends on the current state of the system (the clock) and the inputs that are going
directly to the output logic. So I copied and pasted the next state logic from the Moore machine into the Mealy machine 
because the state functionatily doesn't change. I copied the first part of the output logic over and then had to develop
the next state output logic based on the possibilities of getting to the indicated floor. As in, the next floor will be 
floor1 if you are on floor2 and you are going down, or you are on floor1 and tried to go down. 

![Mealy] (https://raw.github.com/C15Agnolutto/CE3_Agnolutto/master/Mealy_testbench.PNG)

The following task was again to make a testbench except this time for the Mealy machine. There was no trick to this. 
I copied and pasted my Moore testbench to the Mealy testbench and it ran just fine. I worked through the waveform to make
sure the next states were correct and I couldn't find any errors. Other than that, everything appeared to be just as it
should. 
