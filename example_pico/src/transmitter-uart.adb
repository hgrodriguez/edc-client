with HAL.GPIO;
with HAL.UART;
with RP.Device;
with RP.GPIO;
with RP.UART;
with Pico;

with Edc_Client;

package body Transmitter.UART is

   UART    : RP.UART.UART_Port renames RP.Device.UART_0;
   UART_TX : RP.GPIO.GPIO_Point renames Pico.GP16;
   UART_RX : RP.GPIO.GPIO_Point renames Pico.GP17;

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
      Pico.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         Pico.LED.Set;
      end if;
   end Transmit_LED;

   procedure Transmit_Matrix_W_Byte
     (Control : Edc_Client.Matrix_Word.Byte_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      Pico.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         Pico.LED.Set;
      end if;
   end Transmit_Matrix_W_Byte;

   procedure Transmit_Matrix_W_Word
     (Control : Edc_Client.Matrix_Word.Word_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      Pico.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         Pico.LED.Set;
      end if;
   end Transmit_Matrix_W_Word;

   procedure Transmit_Matrix_D_Byte
     (Control : Edc_Client.Matrix_Double_Word.Byte_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      Pico.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         Pico.LED.Set;
      end if;
   end Transmit_Matrix_D_Byte;

   procedure Transmit_Matrix_D_Word
     (Control : Edc_Client.Matrix_Double_Word.Word_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      Pico.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         Pico.LED.Set;
      end if;
   end Transmit_Matrix_D_Word;

   procedure Transmit_Matrix_D_Double_Word
     (Control : Edc_Client.Matrix_Double_Word.Double_Word_String) is
      Status        : HAL.UART.UART_Status;
      Control_Bytes : HAL.UART.UART_Data_8b (1 .. Control'Length);
      use HAL.UART;
   begin
      Pico.LED.Clear;
      for I in Control'Range loop
         Control_Bytes (I) := Character'Pos (Control (I));
      end loop;

      UART.Transmit (Control_Bytes, Status);
      if Status /= HAL.UART.Ok then
         Pico.LED.Set;
      end if;
   end Transmit_Matrix_D_Double_Word;

end Transmitter.UART;
