with HAL;

package Edc_Client.Matrix_Double_Word is

   type Byte_String is new String (1 .. 6);
   type Byte_Transmit_Procedure is
     access not null procedure (Control : Byte_String);

   procedure Byte_Initialize (T : Byte_Transmit_Procedure);

   function Byte_Initialized return Boolean;

   type Word_String is new String (1 .. 8);
   type Word_Transmit_Procedure is
     access not null procedure (Control : Word_String);

   procedure Word_Initialize (T : Word_Transmit_Procedure);

   function Word_Initialized return Boolean;

   type Double_Word_String is new String (1 .. 12);
   type Double_Word_Transmit_Procedure is
     access not null procedure (Control : Double_Word_String);

   procedure Double_Word_Initialize (T : Double_Word_Transmit_Procedure);

   function Double_Word_Initialized return Boolean;

   procedure Show_LSW_LSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   procedure Show_LSW_MSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   procedure Show_LSW (Value : HAL.UInt16)
     with Pre => Word_Initialized;

   procedure Show_MSW_LSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   procedure Show_MSW_MSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   procedure Show_MSW (Value : HAL.UInt16)
     with Pre => Word_Initialized;

   procedure Show_Double_Word (Value : HAL.UInt32)
     with Pre => Double_Word_Initialized;

end Edc_Client.Matrix_Double_Word;
