--===========================================================================
--
--  The main procedure for the Pico example program.
--
--===========================================================================
--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL;

with RP.Clock;
with RP.Device;
with RP.GPIO;
with RP.Timer;
with Pico;

with Edc_Client;
with Edc_Client.LED;
with Edc_Client.Matrix.Word;
with Edc_Client.Matrix.Double_Word;

with Transmitter.UART;

procedure Example_Pico is
   DELAY_IN_BETWEEN : constant Integer := 100;

   SHOW_LEDS        : constant Boolean := True;
   SHOW_BYTES       : constant Boolean := False;
   SHOW_WORDS       : constant Boolean := True;
   SHOW_DOUBLE_WORD : constant Boolean := True;
   type Transmitter_Available is (UART);
   USE_TRANSMITTER  : constant Transmitter_Available := UART;

   My_Timer         : RP.Timer.Delays;

   use type HAL.UInt8;
   LSB  : HAL.UInt8 := 0;
   MSB  : HAL.UInt8 := HAL.UInt8'Last;

   use type HAL.UInt16;
   Word : HAL.UInt16 := 0;

   use type HAL.UInt32;
   Double_Word : HAL.UInt32 := 0;

begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   RP.Clock.Enable (RP.Clock.PERI);
   RP.Device.Timer.Enable;
   RP.Timer.Enable (This => My_Timer);
   RP.GPIO.Enable;
   Pico.LED.Configure (RP.GPIO.Output);
   Pico.LED.Set;

   case USE_TRANSMITTER is
      when UART =>
         Transmitter.UART.Initialize;

         Edc_Client.LED.Initialize (T => Transmitter.UART.Transmit_LED'Access);

         Edc_Client.Matrix.Word.Byte_Initialize
           (T => Transmitter.UART.Transmit_Matrix_W_Byte'Access);

         Edc_Client.Matrix.Word.Word_Initialize
           (T => Transmitter.UART.Transmit_Matrix_W_Word'Access);

         Edc_Client.Matrix.Double_Word.Byte_Initialize
           (T => Transmitter.UART.Transmit_Matrix_D_Byte'Access);

         Edc_Client.Matrix.Double_Word.Word_Initialize
           (T => Transmitter.UART.Transmit_Matrix_D_Word'Access);

         Edc_Client.Matrix.Double_Word.Double_Word_Initialize
           (T => Transmitter.UART.Transmit_Matrix_D_Double_Word'Access);

   end case;

   loop
      if SHOW_LEDS then
         Edc_Client.LED.Red_Toggle;
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);

         Edc_Client.LED.Amber_Toggle;
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);

         Edc_Client.LED.Green_Toggle;
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);

         Edc_Client.LED.White_Toggle;
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);

         Edc_Client.LED.Blue_Toggle;
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
      end if;

      if SHOW_BYTES then
         --
         Edc_Client.Matrix.Word.Show_LSB (LSB);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         Edc_Client.Matrix.Double_Word.Show_LSW_LSB (LSB);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         Edc_Client.Matrix.Double_Word.Show_MSW_LSB (LSB);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         LSB := LSB + 1;

         Edc_Client.Matrix.Word.Show_MSB (MSB);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         if not SHOW_DOUBLE_WORD then
            Edc_Client.Matrix.Double_Word.Show_LSW_MSB (MSB);
            RP.Timer.Delay_Milliseconds (This => My_Timer,
                                         Ms   => DELAY_IN_BETWEEN);
            Edc_Client.Matrix.Double_Word.Show_MSW_MSB (MSB);
            RP.Timer.Delay_Milliseconds (This => My_Timer,
                                         Ms   => DELAY_IN_BETWEEN);
         end if;
         MSB := MSB - 1;
         --
      elsif SHOW_WORDS then
         Edc_Client.Matrix.Word.Show_Word (Word);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         if not SHOW_DOUBLE_WORD then
            Edc_Client.Matrix.Double_Word.Show_LSW (Word);
            RP.Timer.Delay_Milliseconds (This => My_Timer,
                                         Ms   => DELAY_IN_BETWEEN);
            Edc_Client.Matrix.Double_Word.Show_MSW (Word);
            RP.Timer.Delay_Milliseconds (This => My_Timer,
                                         Ms   => DELAY_IN_BETWEEN);
         end if;
         Word := Word + 1;
      end if;
      if SHOW_DOUBLE_WORD then
         Edc_Client.Matrix.Double_Word.Show_Double_Word (Double_Word);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         RP.Timer.Delay_Milliseconds (This => My_Timer,
                                      Ms   => DELAY_IN_BETWEEN);
         Double_Word := Double_Word + 1;
      end if;
   end loop;

end Example_Pico;
