--===========================================================================
--
--  This package defines all types for the various Matrix packages.
--
--===========================================================================
--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
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

   --------------------------------------------------------------------------
   --  Command string for controlling the double word of the display
   --------------------------------------------------------------------------
   type Double_Word_String is new String (1 .. 12);

   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for the
   --  Show_LSW/MSW procedures
   --------------------------------------------------------------------------
   type Double_Word_Transmit_Procedure is
     access not null procedure (Control : Double_Word_String);

end Edc_Client.Matrix.Types;
