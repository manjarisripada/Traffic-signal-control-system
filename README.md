# Traffic Light Control System Simulation

## Overview

This project implements a **Traffic Light Control System** using assembly language on the **8086 microprocessor**. The system is designed to simulate traffic control scenarios for a two-road intersection, featuring vertical and horizontal roads named *Victoria Street* and *Holt Street*, respectively. 

The project demonstrates how the microprocessor interacts with external devices by controlling 12 traffic light signals through port 4. This is achieved using a **menu-driven program** that allows users to simulate various traffic conditions.

---

## Features

The program supports the following scenarios:

1. **Accident at Victoria Street**  
   Stops traffic in one of the lanes on Victoria Street.

2. **Road Works at Holt Street**  
   Stops traffic in one of the lanes on Holt Street.

3. **Traffic Signal Malfunction**  
   Displays a warning message ("Drive slowly with caution") when all signals are red or green.

4. **Normal Traffic Condition**  
   Operates the traffic lights in regular intervals.

5. **Exit**  
   Allows the user to terminate the simulation.

---

## How It Works

The system operates as follows:

1. **Control Signals**:  
   - Each traffic light post has three LEDs: Red, Yellow, and Green.  
   - A total of 12 control bits are sent to **Port 4**, with higher-order 4 bits set to `0`.

2. **Menu-Driven Simulation**:  
   - A menu appears on the console window for users to select a scenario.
   - The program sends the appropriate control signals to the traffic lights based on the selected scenario.

3. **Output**:  
   - The **EMU8086 simulator** handles the interaction with the external traffic light device.
   - The console displays relevant messages and statuses for each condition.

---


## Prerequisites

- **EMU8086 Software**: To run the assembly code and simulate the external traffic light system.
- **Knowledge of Assembly Language**: Familiarity with x86 assembly programming.

---

