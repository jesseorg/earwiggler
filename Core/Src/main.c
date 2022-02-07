/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @notes          : Main program body. This is ported into STM32Cube.
  *
  * This code was originally assembled by LvTong, with some help from
  *  Wen Qian, at Xixian lab Beijing in December 2016.
  *
  *  Jesse ported it in 2021/22. It took 2 months to port it.
  *  Why? Because of the Cube IDE. There are lots of things that have
  *  to be researched and replaced because the
  *  libraries are different.
  *
  *  HAL- HAL is insufficient. So found LL. LL is not ok. So back to CMSISS.
  *
  * It was unclear if Cube obeys the timer/PLL config, or if it rewrites
  *  based on the GUI. Could not find the assembly output.
  * Could have either started over from nothing, or used Kiel, which is what LvTong
  * used to write the original. But I wanted to keep this code that LvTong made,
  * because it has flava.
  *
  * LvTong you are a genius. Thanks for being awesome.
  * I should have obtained a windows computer and run Keil.
  *
  * Finally after weeks of unknown, the light came. Enabling the NVIC made it work.
  *
  * Cube creates all sorts of files that are unknown to me -
  * are they used? by what?
  * Anyway, don't use Cube if you can help it. But we make due.
  *
  * Nota bene: Installing Cube is not easy.
  * It is Java, it doesn't run without editing the run scripts.
  *
  ******************************************************************************
  *
  *        earwiggler2022 from motiondial2017
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/




/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "stm32f10x.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_it.h"
#include "stm32f10x_gpio.h"
#include "necsend.h"
#include "delay.h"
#include "stm32f10x_flash.h"
#include "stm32f10x_nvic.h"


#include "stm32f10x.h"
//#include "I2C_MPU6050.h" // this is gyro accelerometer
//#include "usart1.h"
#include "delay.h"
//#include "kalman.h"
#include "delay.h"

//#include "stm32f10x_lib.h" // i don't know, LvTong commented it out
// it doesn't exist anyway

#include "stm32f10x_it.h"
#include "necsend.h"
#include "stm32f10x_flash.h"
#include "stm32f10x_nvic.h"



/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

#define TIMxx TIM2
#define GPIOuput GPIOB
#define GPIOPin GPIO_Pin_5


int8_t fw ;//= 0;
int8_t fq ;//= 0;
int fa = 4;
int fb = 4;


void RCC_cfg(void);
void TIMER_cfg(void);
void NVIC_cfg(void);
void GPIO_cfg(void);
void blink(void); // blink if you are awake


/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
///void SystemClock_Config(void);
/* USER CODE BEGIN PFP */



/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */


// see
// https://www.programmerall.com/article/86371923/
// why make things difficult?
// I ask you this, Cube.

#ifdef  USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{
    while (1)
    {
    }
}
#endif

void blink(void)
	{
	delay_ms(100);
	GPIO_WriteBit(GPIOB,GPIO_Pin_6, Bit_SET);
	delay_ms(100);
	GPIO_WriteBit(GPIOB,GPIO_Pin_6, Bit_RESET);
	delay_ms(100);
	GPIO_WriteBit(GPIOB,GPIO_Pin_6, Bit_SET);
	delay_ms(100);
	GPIO_WriteBit(GPIOB,GPIO_Pin_6, Bit_RESET);
	}






void RCC_cfg(void)

{

       //定义错误状态变量
       ErrorStatus HSEStartUpStatus;
       //将RCC寄存器重新设置为默认值
       RCC_DeInit();
       //打开外部高速时钟晶振
       RCC_HSEConfig(RCC_HSE_ON);
       //等待外部高速时钟晶振工作
       HSEStartUpStatus = RCC_WaitForHSEStartUp();
       if(HSEStartUpStatus == SUCCESS)
       {
              //设置AHB时钟(HCLK)为系统时钟
              RCC_HCLKConfig(RCC_SYSCLK_Div1);
              //设置高速AHB时钟(APB2)为HCLK时钟
              RCC_PCLK2Config(RCC_HCLK_Div1);
              //设置低速AHB时钟(APB1)为HCLK的2分频
              RCC_PCLK1Config(RCC_HCLK_Div2);
              //设置FLASH代码延时
              FLASH_SetLatency(FLASH_Latency_2);
              //使能预取指缓存
              FLASH_PrefetchBufferCmd(FLASH_PrefetchBuffer_Enable);
              //设置PLL时钟，为HSE的9倍频 8MHz * 9 = 72MHz
              RCC_PLLConfig(RCC_PLLSource_HSE_Div1, RCC_PLLMul_9);
              //使能PLL
              RCC_PLLCmd(ENABLE);
              //等待PLL准备就绪
              while(RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);
              //设置PLL为系统时钟源
              RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
              //判断PLL是否是系统时钟
              while(RCC_GetSYSCLKSource() != 0x08);
       }
       //允许TIM2的时钟
       RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2,ENABLE);
       //允许GPIO的时钟
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);





}


void NVIC_cfg(void)
{
       NVIC_InitTypeDef NVIC_InitStructure;
        //选择中断分组1
        NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
        //选择TIM2的中断通道
        NVIC_InitStructure.NVIC_IRQChannel = TIM2_IRQChannel;
        //抢占式中断优先级设置为0
        NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
       //响应式中断优先级设置为0
        NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
       //使能中断
        NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
        NVIC_Init(&NVIC_InitStructure);
}



void GPIO_cfg(void)
{
       GPIO_InitTypeDef GPIO_InitStructure;
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;                 //选择引脚
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; //输出频率最大50MHz
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; //带上拉电阻输出
       GPIO_Init(GPIOB,&GPIO_InitStructure);

       //GPIO_InitTypeDef GPIO_InitStructure;
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;                 //选择引脚
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; //输出频率最大50MHz
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; //带上拉电阻输出
       GPIO_Init(GPIOB,&GPIO_InitStructure);

       //GPIO_InitTypeDef GPIO_InitStructure;
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;                 //选择引脚
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; //输出频率最大50MHz
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; //带上拉电阻输出
       GPIO_Init(GPIOA,&GPIO_InitStructure);

       //GPIO_InitTypeDef GPIO_InitStructure;
       GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;                 //选择引脚
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; //输出频率最大50MHz
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; //带上拉电阻输出
       GPIO_Init(GPIOA,&GPIO_InitStructure);


}

int main(void)
{


	RCC_cfg();
    NVIC_cfg();
    GPIO_cfg();
    TIMER_cfg();



   while (1)
   {

	   // some test words.
	   //[4682 ,4711, 4681,0,4683,5876,5540,5611,5503]



	   //this doesn't work
	   fa = 0b11011000;
	   fb = 0b00111101;
	   fa = 0xD8;//0b11011000;
	   fb = 0x3D;//0b00111101;


	   fa = 255;// Group (address)
	   fb = 0;// ID (person)



	   //works, make sure you start with Star_Submit.
	   Star_Submit();

	   Serial_Submit();
	   // format 2 is star 1 is serial // obsolete?
	   Submit_Data( (int8_t) 3, (int8_t) 5, (int8_t) 1  );

	   // if you don't sent 'Star_Submit' first then
	   // this line does not work at this location
	   // but it work if you send 3/5 first
	   // this is because of the timing on the NEC receiver

	   Serial_Submit();
	   fa = 3 ^ 5;
	   fb = fa ^ 5;
	   Submit_Data( fa, fb, (int8_t) 1  );
	   Star_Submit();


	   //works
	   GPIO_WriteBit(GPIOB,GPIO_Pin_5, Bit_RESET);
	   // turn off the IR LED


	   //flash the indicator
	   delay_ms(250);
	   GPIO_WriteBit(GPIOB,GPIO_Pin_6, Bit_SET);
	   delay_ms(25);
	   GPIO_WriteBit(GPIOB,GPIO_Pin_6, Bit_RESET);


   }


}


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */


/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

