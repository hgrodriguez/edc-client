--===========================================================================
--
--  This package is the interface to the Matrix Word part of the EDC Client
--  As a client of this package, you can chose, if you want to display
--  bytes independently or a word or a combination of both.
--
--===========================================================================
--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL;

package Edc_Client.Matrix_Word is

   --------------------------------------------------------------------------
   --  Command string for controlling the byte part of the display
   --------------------------------------------------------------------------
   type Byte_String is new String (1 .. 6);
   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for the
   --  Show_LSB/MSB procedures
   --------------------------------------------------------------------------
   type Byte_Transmit_Procedure is
     access not null procedure (Control : Byte_String);

   --------------------------------------------------------------------------
   --  Initializes the client and must be called before any other procedure
   --  in this package for any byte related communication
   --------------------------------------------------------------------------
   procedure Byte_Initialize (T : Byte_Transmit_Procedure);

   --------------------------------------------------------------------------
   --  Returns the status if the package has been initialized for byte
   --------------------------------------------------------------------------
   function Byte_Initialized return Boolean;

   --------------------------------------------------------------------------
   --  Command string for controlling the word part of the display
   --------------------------------------------------------------------------
   type Word_String is new String (1 .. 8);
   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for the
   --  Show_Word procedure
   --------------------------------------------------------------------------
   type Word_Transmit_Procedure is
     access not null procedure (Control : Word_String);

   --------------------------------------------------------------------------
   --  Initializes the client and must be called before any other procedure
   --  in this package for any word related communication
   --------------------------------------------------------------------------
   procedure Word_Initialize (T : Word_Transmit_Procedure);

   --------------------------------------------------------------------------
   --  Returns the status if the package has been initialized for word
   --------------------------------------------------------------------------
   function Word_Initialized return Boolean;

   --------------------------------------------------------------------------
   --  Shows/Displays the least significant byte on the matrix
   --  This is equivalent of the right byte on the matrix
   --------------------------------------------------------------------------
   procedure Show_LSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the most significant byte on the matrix
   --  This is equivalent of the left byte on the matrix
   --------------------------------------------------------------------------
   procedure Show_MSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the full word on the matrix
   --------------------------------------------------------------------------
   procedure Show_Word (Value : HAL.UInt16)
     with Pre => Word_Initialized;

end  Edc_Client.Matrix_Word;
