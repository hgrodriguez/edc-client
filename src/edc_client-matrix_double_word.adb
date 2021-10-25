with Interfaces;

package body Edc_Client.Matrix_Double_Word is

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

   Double_Word_Is_Initialized : Boolean := False;

   function Double_Word_Initialized return Boolean is
   begin
      return Double_Word_Is_Initialized;
   end Double_Word_Initialized;

   Double_Word_Transmitter    : Double_Word_Transmit_Procedure;

   procedure Double_Word_Initialize (T : Double_Word_Transmit_Procedure) is
   begin
      Double_Word_Transmitter := T;
      Double_Word_Is_Initialized := True;
   end Double_Word_Initialize;

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

   procedure Show_LSW_LSB (Value : HAL.UInt8) is
   begin
      Show_Byte (Value => Value,
                 Block => '0');
   end Show_LSW_LSB;

   procedure Show_LSW_MSB (Value : HAL.UInt8) is
   begin
      Show_Byte (Value => Value,
                 Block => '1');
   end Show_LSW_MSB;

   procedure Show_MSW_LSB (Value : HAL.UInt8) is
   begin
      Show_Byte (Value => Value,
                 Block => '2');
   end Show_MSW_LSB;

   procedure Show_MSW_MSB (Value : HAL.UInt8) is
   begin
      Show_Byte (Value => Value,
                 Block => '3');
   end Show_MSW_MSB;

   procedure Show_Byte (Value : HAL.UInt8; Block : Character) is
      use HAL;
      use Interfaces;
      Command : Byte_String := "M1B000";
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

   procedure Show_Word (Value : HAL.UInt16; Block : Character);

   procedure Show_LSW (Value : HAL.UInt16) is
   begin
      Show_Word (Value => Value,
                 Block => '0');
   end Show_LSW;

   procedure Show_MSW (Value : HAL.UInt16) is
   begin
      Show_Word (Value => Value,
                 Block => '1');
   end Show_MSW;

   procedure Show_Word (Value : HAL.UInt16; Block : Character) is
      use HAL;
      use Interfaces;
      Command : Word_String := "M1W00000";
      MSB     : constant Interfaces.Unsigned_8 :=
        Interfaces.Unsigned_8 (Interfaces.
                                 Shift_Right (Interfaces.Unsigned_16 (Value),
                                   8));
      LSB     : constant Interfaces.Unsigned_8 :=
        Interfaces.Unsigned_8 (Value and 16#FF#);

      MSN     : Interfaces.Unsigned_8;
      LSN     : Interfaces.Unsigned_8;
   begin
      Command (4) := Block;

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

   procedure Show_Double_Word (Value : HAL.UInt32) is
      use HAL;
      use Interfaces;
      Command : Double_Word_String := "M1D000000000";
      MSW     : constant Interfaces.Unsigned_16 :=
        Interfaces.Unsigned_16 (Interfaces.Shift_Right (
                                Interfaces.Unsigned_32 (Value), 16));
      LSW     : constant Interfaces.Unsigned_16
        := Interfaces.Unsigned_16 (Value and 16#FFFF#);

      MSB : Interfaces.Unsigned_8;
      LSB : Interfaces.Unsigned_8;

      MSN : Interfaces.Unsigned_8;
      LSN : Interfaces.Unsigned_8;
   begin
      --
      MSB :=
        Interfaces.Unsigned_8 (Interfaces.Shift_Right (MSW, 8));
      MSN := Interfaces.Shift_Right (MSB, 4);
      Command (5) := Nibble_To_Char (UInt8 (MSN));

      LSN := MSB and 16#F#;
      Command (6) := Nibble_To_Char (UInt8 (LSN));

      LSB :=
        Interfaces.Unsigned_8 (MSW and 16#FF#);

      MSN := Interfaces.Shift_Right (LSB, 4);
      Command (7) := Nibble_To_Char (UInt8 (MSN));

      LSN := LSB and 16#F#;
      Command (8) := Nibble_To_Char (UInt8 (LSN));

      --
      MSB :=
        Interfaces.Unsigned_8 (Interfaces.Shift_Right (LSW, 8));
      MSN := Interfaces.Shift_Right (MSB, 4);
      Command (9) := Nibble_To_Char (UInt8 (MSN));

      LSN := MSB and 16#F#;
      Command (10) := Nibble_To_Char (UInt8 (LSN));

      LSB :=
        Interfaces.Unsigned_8 (LSW and 16#FF#);

      MSN := Interfaces.Shift_Right (LSB, 4);
      Command (11) := Nibble_To_Char (UInt8 (MSN));

      LSN := LSB and 16#F#;
      Command (12) := Nibble_To_Char (UInt8 (LSN));

      --
      Double_Word_Transmitter.all (Command);
   end Show_Double_Word;

end Edc_Client.Matrix_Double_Word;
