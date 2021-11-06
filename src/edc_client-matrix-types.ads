package Edc_Client.Matrix.Types is

   --------------------------------------------------------------------------
   --  Command string for controlling the byte part of the display
   --------------------------------------------------------------------------
   type Byte_String is new String (1 .. 6);

   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for any
   --  byte related procedures
   --------------------------------------------------------------------------
   type Byte_Transmit_Procedure is
     access not null procedure (Control : Byte_String);

   --------------------------------------------------------------------------
   --  Command string for controlling the word part of the display
   --------------------------------------------------------------------------
   type Word_String is new String (1 .. 8);
   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for any
   --  word related procedures
   --------------------------------------------------------------------------
   type Word_Transmit_Procedure is
     access not null procedure (Control : Word_String);

end Edc_Client.Matrix.Types;
