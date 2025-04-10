# CNN-FPGA
This project implements a **Fully Connected (FC) layer** of a Convolutional Neural Network (CNN) using **Verilog**, wrapped with an **AXI Full interface**, and integrated into a **Zynq SoC** using **Vivado Block Design**. The system is deployed and run under **PetaLinux**, with data transferred between Processing System (PS) and Programmable Logic (PL) using **AXI DMA**.
## Features

- **Custom FC Layer IP**  
  - Verilog module performing fully connected layer computation  
  - Parameterizable width and number of neurons  
  - AXI Full slave interface for memory-mapped control and data access  

- **SoC Integration**  
  - Integrated into Zynq-7000 via Vivado block design  
  - Connected with AXI DMA and PS interfaces  

- **PetaLinux-Based System**  
  - Runs on Linux kernel built using PetaLinux  
  - User-space C application communicates with custom IP via AXI DMA  

---

## Tools Used

- **Vivado Design Suite** (Block Design, Synthesis)
- **PetaLinux Tools** (Linux build for Zynq)
- **AXI DMA IP** (for high-speed data transfer)
 
