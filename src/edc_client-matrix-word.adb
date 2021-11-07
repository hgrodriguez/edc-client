--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Interfaces;

private with Edc_Client.Matrix.Common;

package body  Edc_Client.Matrix.Word is

   --------------------------------------------------------------------------
   --  Keeps the status about the byte initialization of the package
   --------------------------------------------------------------------------
   Byte_Is_Initialized : Boolean := False;

   --------------------------------------------------------------------------
   --  Stores the call back procedure for the byte operation
   --------------------------------------------------------------------------
   Byte_Transmitter : Byte_Transmit_Procedure;

   --------------------------------------------------------------------------
   --  Keeps the status about the word initialization of the package
   --------------------------------------------------------------------------
   Word_Is_Initialized : Boolean := False;

   --------------------------------------------------------------------------
   --  Stores the call back procedure for the word operation
   --------------------------------------------------------------------------
   Word_Transmitter    : Word_Transmit_Procedure;

   --------------------------------------------------------------------------
   --  Shows/Displays the byte value given on the matrix display
   --     Value : value to be shown
   --     Block : block to use for showing the value
   --------------------------------------------------------------------------
   procedure Show_Byte (Value : HAL.UInt8; Block : Character) is
      use HAL;
      use Interfaces;
      Command : Edc_Client.Matrix.Types.Byte_String := "M0B000";
      MSN     : Interfaces.Unsigned_8;
      LSN     : Interfaces.Unsigned_8;
   begin
      Command (4) := Block;

      MSN := Interfaces.Shift_Right (Interfaces.Unsigned_8 (Value), 4);
      Command (5) := Edc_Client.Matrix.Common.Nibble_To_Char (UInt8 (MSN));

      LSN := Interfaces.Unsigned_8 (Value) and 16#F#;
      Command (6) := Edc_Client.Matrix.Common.Nibble_To_Char (UInt8 (LSN));
      Byte_Transmitter.all (Command);
   end Show_Byte;

   --========================================================================
   --
   --  All procedures below are described in the corresponding .ads file
   --
   --========================================================================

   procedure Byte_Initialize (T : Byte_Transmit_Procedure) is
   begin
      Byte_Transmitter := T;
      Byte_Is_Initialized := True;
   end Byte_Initialize;

   function Byte_Initialized return Boolean is
   begin
      return Byte_Is_Initialized;
   end Byte_Initialized;

   function Word_Initialized return Boolean is
   begin
      return Word_Is_Initialized;
   end Word_Initialized;

   procedure Word_Initialize (T : Word_Transmit_Procedure) is
   begin
      Word_Transmitter := T;
      Word_Is_Initialized := True;
   end Word_Initialize;

   procedure Show_LSB (Value : HAL.UInt8) is
   begin
      Show_Byte (Value => Value,
                 Block => '0');
   end Show_LSB;

   procedure Show_MSB (Value : HAL.UInt8) is
   begin
      Show_Byte (Value => Value,
                 Block => '1');
   end Show_MSB;

   procedure Show_Word (Value : HAL.UInt16) is
      use HAL;
      use Interfaces;
      Command : Word_String := "M0W00000";
      MSB     : constant Interfaces.Unsigned_8 :=
        Interfaces.Unsigned_8 (Interfaces.
                                 Shift_Right (Interfaces.Unsigned_16 (Value),
                                   8));
      LSB     : constant Interfaces.Unsigned_8 :=
        Interfaces.Unsigned_8 (Value and 16#FF#);

      MSN     : Interfaces.Unsigned_8;
      LSN     : Interfaces.Unsigned_8;
   begin
      MSN := Interfaces.Shift_Right (MSB, 4);
      Command (5) := Edc_Client.Matrix.Common.Nibble_To_Char (UInt8 (MSN));

      LSN := MSB and 16#F#;
      Command (6) := Edc_Client.Matrix.Common.Nibble_To_Char (UInt8 (LSN));

      MSN := Interfaces.Shift_Right (LSB, 4);
      Command (7) := Edc_Client.Matrix.Common.Nibble_To_Char (UInt8 (MSN));

      LSN := LSB and 16#F#;
      Command (8) := Edc_Client.Matrix.Common.Nibble_To_Char (UInt8 (LSN));

      Word_Transmitter.all (Command);
   end Show_Word;

end  Edc_Client.Matrix.Word;
