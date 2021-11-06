with Edc_Client.LED;
with Edc_Client.Matrix.Types;

package Transmitter.UART is

   procedure Initialize;

   procedure Transmit_LED (Control : Edc_Client.LED.LED_String);

   --
   procedure Transmit_Matrix_W_Byte
     (Control : Edc_Client.Matrix.Types.Byte_String);

   procedure Transmit_Matrix_W_Word
     (Control : Edc_Client.Matrix.Types.Word_String);

   --
   procedure Transmit_Matrix_D_Byte
     (Control : Edc_Client.Matrix.Types.Byte_String);

   procedure Transmit_Matrix_D_Word
     (Control : Edc_Client.Matrix.Types.Word_String);

   procedure Transmit_Matrix_D_Double_Word
     (Control : Edc_Client.Matrix.Types.Double_Word_String);

end Transmitter.UART;
