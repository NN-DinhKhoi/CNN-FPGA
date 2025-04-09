#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


#include <fcntl.h>
#include <stdint.h>
#include <math.h>

#include "/home/debian/DMA_code/FPGA_Driver.c" // call fpga driver


#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define SIZE 1024 // BRAM có size là 2048



#define PADDING_BASE	 0x00100000  //  Offset to avoid system files

#define DATA_DMA_BASE             0x0000000000+PADDING_BASE  // Địa chỉ sẽ giống dưới phần cứng ở phần thấp. => 0x00_A010_0000 0  
#define BIAS_DMA_BASE             0x0000000064+PADDING_BASE  // Địa chỉ sẽ giống dưới phần cứng ở phần thấp. => 0x00_A010_0064 100
#define WEIGHT_DMA_BASE           0x00000000C8+PADDING_BASE  // Địa chỉ sẽ giống dưới phần cứng ở phần thấp. => 0x00_A010_00C8 200
#define OUTPUT_DMA_BASE           0x00000000A0+PADDING_BASE  // Địa chỉ sẽ giống dưới phần cứng ở phần thấp. => 0x00_A010_00A0 160

int main() {

    printf("Hello World! Today Is Monday\n");

    // Mở FPGA và các UIO cần thiết

    unsigned char* membase;
    if (fpga_open() == 0)
        exit(1);

    fpga.dma_ctrl = CGRA_info.dma_mmap;
    membase = (unsigned char*)CGRA_info.ddr_mmap;

    if (membase == NULL) {
        printf("Memory mapping failed!\n");
        //exit(1);
    }
    // Test DMA

    //Khai báo vùng con trỏ trên FPGA

    uint32_t* DATA_DMA   = (uint32_t*)(membase + DATA_DMA_BASE);
    uint32_t* BIAS_DMA   = (uint32_t*)(membase + BIAS_DMA_BASE);
    uint32_t* WEIGHT_DMA = (uint32_t*)(membase + WEIGHT_DMA_BASE);
    uint32_t* OUTPUT_DMA = (uint32_t*)(membase + OUTPUT_DMA_BASE);

    unsigned int data[64], bias[10], weight[640];
    FILE* fp;
    fp = fopen("data_1_img_FC64_hex_0x32b.txt", "r");
    for (int i = 0; i < 64; i++)
    {
        fscanf(fp, "%x", &data[i]);
        DATA_DMA[i] = data[i];
    }
    fclose(fp);

    FILE* fp1;
    fp1 = fopen("bias_img_FC64_hex_0x32b.txt", "r");
    for (int i = 0; i < 10; i++)
    {
        fscanf(fp1, "%x", &bias[i]);
        BIAS_DMA[i] = bias[i];
    }
    fclose(fp1);

    FILE* fp2;
    fp2 = fopen("weight_img_FC64_hex_0x32b.txt", "r");
    for (int i = 0; i < 640; i++)
    {
        fscanf(fp2, "%x", &weight[i]);
        WEIGHT_DMA[i] = weight[i];
    }
    fclose(fp2);

    dma_write(DATA_DMA_BASE, 64);
    printf("complete data!\n");
    dma_write(BIAS_DMA_BASE, 10);
    printf("complete bias!\n");
    dma_write(WEIGHT_DMA_BASE, 640);
    printf("complete weight!\n");

    dma_read(OUTPUT_DMA_BASE, 10);

    printf("complete!\n");

    return 0;
}