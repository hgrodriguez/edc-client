--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL.GPIO;
with HAL.UART;

with RP.GPIO;
with RP.UART;

with ItsyBitsy;

with Edc_Client;

package body Transmitter.UART is

   --------------------------------------------------------------------------
   --  Definitions of the UART ports to use for the communication.
   --------------------------------------------------------------------------
   UART    : RP.UART.UART_Port renames ItsyBitsy.UART;
   UART_TX : RP.GPIO.GPIO_Point renames ItsyBitsy.TX;
   UART_RX : RP.GPIO.GPIO_Point renames ItsyBitsy.RX;

   --------------------------------------------------------------------------
   --  All procedures below are documented in the corresponding .ads file
   --------------------------------------------------------------------------
   procedure Initialize is
   begin
      UART_TX.Configure (RP.GPIO.Output, RP.GPIO.Pull_Up, RP.GPIO.UART);
      UART_RX.Configure (RP.GPIO.Input, RP.GPIO.Floating, RP.GPIO.UART);
      UART.Configure
        (Config =>
           (Baud      => Edc_Client.SERIAL_BAUD_RATE,
            Word_Size => 8,
            Parity    => False,
            Stop_Bits => 1,
            others    => <>));
   end Initialize;

   procedure Transmit_LED (Control : Edc_Client.LED.LED_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      ItsyBitsy.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         ItsyBitsy.LED.Set;
      end if;
   end Transmit_LED;

   procedure Transmit_Matrix_W_Byte
     (Control : Edc_Client.Matrix.Types.Byte_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      ItsyBitsy.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         ItsyBitsy.LED.Set;
      end if;
   end Transmit_Matrix_W_Byte;

   procedure Transmit_Matrix_W_Word
     (Control : Edc_Client.Matrix.Types.Word_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      ItsyBitsy.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         ItsyBitsy.LED.Set;
      end if;
   end Transmit_Matrix_W_Word;

   procedure Transmit_Matrix_D_Byte
     (Control : Edc_Client.Matrix.Types.Byte_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      ItsyBitsy.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         ItsyBitsy.LED.Set;
      end if;
   end Transmit_Matrix_D_Byte;

   procedure Transmit_Matrix_D_Word
     (Control : Edc_Client.Matrix.Types.Word_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      ItsyBitsy.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         ItsyBitsy.LED.Set;
      end if;
   end Transmit_Matrix_D_Word;

   procedure Transmit_Matrix_D_Double_Word
     (Control : Edc_Client.Matrix.Types.Double_Word_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      ItsyBitsy.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         ItsyBitsy.LED.Set;
      end if;
   end Transmit_Matrix_D_Double_Word;

end Transmitter.UART;
