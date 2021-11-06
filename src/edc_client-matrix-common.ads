with HAL;

private package Edc_Client.Matrix.Common is

   --------------------------------------------------------------------------
   --  Returns the charactor for the nibble (= lower 4 bit value of a byte)
   --------------------------------------------------------------------------
   function Nibble_To_Char (Nibble : HAL.UInt8) return Character;

end Edc_Client.Matrix.Common;
