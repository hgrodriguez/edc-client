package body Edc_Client.Matrix.Common is

   --------------------------------------------------------------------------
   --  Returns the charactor for the nibble (= lower 4 bit value of a byte)
   --------------------------------------------------------------------------
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

end Edc_Client.Matrix.Common;
