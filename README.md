# Message-box-MBOX-

# INTRODUCTION

The purpose of Mbox is to support communications between CPU clusters cross chiplet. The Mbox should  be attached as possible as close to the CPUs to reduce SFR latency. 

# INTERFACES

Mbox has 5 interfaces :
1. Clock/Reset
2. AXI slave for SFR
3. AXI write-only master
4. AXI write-only slave
5. Interrupt

Note : Mbox has one clock and one synchronous reset signals.
