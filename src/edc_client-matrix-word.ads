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

with Edc_Client.Matrix.Types; use Edc_Client.Matrix.Types;

package Edc_Client.Matrix.Word is

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

end  Edc_Client.Matrix.Word;
