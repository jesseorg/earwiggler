#include "stm32f10x_tim.h"
#include "stm32f10x_gpio.h"
#include "necsend.h"
#include "delay.h"
#define TIMxx TIM2
#define GPIOuput GPIOB
#define GPIOPin GPIO_Pin_5


void Star_Submit(void)//发射引导码函数；9ms的低电平和一个4.5ms的高电平组成
{
	 u8 ReadValue;
     ReadValue = GPIO_ReadOutputDataBit(GPIOuput,GPIOPin);
     if(ReadValue == 0){
		delay_ms(9);
 //       GPIO_SetBits(GPIOuput,GPIOPin);
        TIM_Cmd(TIM2,ENABLE);
		delay_ms(4.5);
		TIM_Cmd(TIM2,DISABLE);
     }
     else{
		 GPIO_ResetBits(GPIOuput,GPIOPin);
         delay_ms(9);
  //       GPIO_SetBits(GPIOuput,GPIOPin);
        TIM_Cmd(TIM2,ENABLE);
		delay_ms(4.5);
		TIM_Cmd(TIM2,DISABLE);
	 }
}




/*
 *
 * This is timed to be a serial signal.
 * it is not NEC format.*/
void Serial_Submit(void)//���������뺯����9ms�ĵ͵�ƽ��һ��4.5ms�ĸߵ�ƽ���
{   
	 u8 ReadValue;
     ReadValue = GPIO_ReadOutputDataBit(GPIOuput,GPIOPin);
     if(ReadValue == 0){
		delay_us(2000);
			 	TIM_Cmd(TIM2,ENABLE);
     //   GPIO_SetBits(GPIOuput,GPIOPin); //202202041313
		delay_us(1000);
			 	 	TIM_Cmd(TIM2,DISABLE);
     }    
     else{
		 GPIO_ResetBits(GPIOuput,GPIOPin);    
         delay_us(2000);
			 	TIM_Cmd(TIM2,ENABLE);
	 		// GPIO_SetBits(GPIOuput,GPIOPin); //202202041313
		delay_us(1000);		
			 	 	TIM_Cmd(TIM2,DISABLE);
	 }

}


void Submit_Code_Zero(void)  //����һλ0��
{
	GPIO_ResetBits(GPIOuput,GPIOPin);  
	delay_us(560);//560us��
	TIM_Cmd(TIM2,ENABLE);
	delay_us(560);//560us��
	TIM_Cmd(TIM2,DISABLE);
}
void Submit_Code_One(void)  //����һλ1��
{
	GPIO_ResetBits(GPIOuput,GPIOPin);  
	delay_us(560);//560us��
	TIM_Cmd(TIM2,ENABLE);
	delay_us(1680);//1680us��
	TIM_Cmd(TIM2,DISABLE);
}
/*void delay_us(unsigned int i)
{
        unsigned char t = 0;
        for(;i>0;i--)
        {
                for(t=0;t<2;t++)
                {
                }
        }
}
void delay_ms(unsigned int i)
{
        for(;i>0;i--)
        {
            delay_us(1000);
        }
}*/

void  Submit_Data(u8 addr,u8 data, u8 format )
//void  Submit_Data(u8 addr,u32 data)
{
	
	u8 addr_count;
	u8 addr_buff=0,data_flag=0;
	u32 data_buff32=0;
	u8 data_buff=0;
	TIM_Cmd(TIM2,DISABLE);

	//Submit_Code_Zero();
	//2022// Star_Submit();

	//���������뺯����9ms�ĵ͵�ƽ��һ��4.5ms�ĸߵ�ƽ���
	/////2022//

	/*
	if (format == 2)
		{
		Star_Submit();

		}
	else
		{
		Serial_Submit();
		}

	Submit_Code_One();
	/////2022// Star_Submit();
	if (format == 2)
		{
		Star_Submit();
		}
	else
		{
		Serial_Submit();
		}
*/


	addr_buff=addr;
	for(addr_count=8;addr_count>0;addr_count--)    //���͵�ַ��
	{
		data_flag=(addr_buff>>(addr_count-1))&0x01;
		if(data_flag==0) Submit_Code_Zero();
		else if(data_flag==1) Submit_Code_One();
	}

	addr_buff=data;
	for(addr_count=8;addr_count>0;addr_count--)    //���͵�ַ����
	{
		data_flag=(addr_buff>>(addr_count-1))&0x01;
		if(data_flag==0) Submit_Code_Zero();
		else if(data_flag==1) Submit_Code_One();
	} 


	/*
	data_buff=data ;
	for(addr_count=6;addr_count>0;addr_count--)    //��������
	{
		data_flag=(data_buff>>(addr_count-1))&0x01;
		if(data_flag==0) Submit_Code_Zero();
		else if(data_flag==1) Submit_Code_One();
	}	 

	data_buff=~data ;
	for(addr_count=32;addr_count>0;addr_count--)    //�������ݷ���
	{
		data_flag=(data_buff>>(addr_count-1))&0x01;
		if(data_flag==0) Submit_Code_Zero();
		else if(data_flag==1) Submit_Code_One();
	}
	*/
}

