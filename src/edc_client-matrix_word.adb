with Interfaces;

package body  Edc_Client.Matrix_Word is

   Byte_Is_Initialized : Boolean := False;

   function Byte_Initialized return Boolean is
   begin
      return Byte_Is_Initialized;
   end Byte_Initialized;

   Byte_Transmitter : Byte_Transmit_Procedure;

   procedure Byte_Initialize (T : Byte_Transmit_Procedure) is
   begin
      Byte_Transmitter := T;
      Byte_Is_Initialized := True;
   end Byte_Initialize;

   Word_Is_Initialized : Boolean := False;

   function Word_Initialized return Boolean is
   begin
      return Word_Is_Initialized;
   end Word_Initialized;

   Word_Transmitter    : Word_Transmit_Procedure;

   procedure Word_Initialize (T : Word_Transmit_Procedure) is
   begin
      Word_Transmitter := T;
      Word_Is_Initialized := True;
   end Word_Initialize;

   function Nibble_To_Char (Nibble : HAL.UInt8) return Character is
      type N_2_C is array (HAL.UInt8 (0) .. HAL.UInt8 (15)) of Character;
      N_2_C_Map : constant N_2_C := (
                                     16#0# => '0',
                                     16#1# => '1',
                                     16#2# => '2',
                                     16#3# => '3',
                                     16#4# => '4',
                                     16#5# => '5',
                                     16#6# => '6',
                                     16#7# => '7',
                                     16#8# => '8',
                                     16#9# => '9',
                                     16#A# => 'A',
                                     16#B# => 'B',
                                     16#C# => 'C',
                                     16#D# => 'D',
                                     16#E# => 'E',
                                     16#F# => 'F'
                                    );

   begin
      return N_2_C_Map (Nibble);
   end Nibble_To_Char;

   procedure Show_Byte (Value : HAL.UInt8; Block : Character);

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

   procedure Show_Byte (Value : HAL.UInt8; Block : Character) is
      use HAL;
      use Interfaces;
      Command : Byte_String := "M0B000";
      MSN     : Interfaces.Unsigned_8;
      LSN     : Interfaces.Unsigned_8;
   begin
      Command (4) := Block;

      MSN := Interfaces.Shift_Right (Interfaces.Unsigned_8 (Value), 4);
      Command (5) := Nibble_To_Char (UInt8 (MSN));

      LSN := Interfaces.Unsigned_8 (Value) and 16#F#;
      Command (6) := Nibble_To_Char (UInt8 (LSN));
      Byte_Transmitter.all (Command);
   end Show_Byte;

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
      Command (5) := Nibble_To_Char (UInt8 (MSN));

      LSN := MSB and 16#F#;
      Command (6) := Nibble_To_Char (UInt8 (LSN));

      MSN := Interfaces.Shift_Right (LSB, 4);
      Command (7) := Nibble_To_Char (UInt8 (MSN));

      LSN := LSB and 16#F#;
      Command (8) := Nibble_To_Char (UInt8 (LSN));

      Word_Transmitter.all (Command);
   end Show_Word;

end  Edc_Client.Matrix_Word;
