--===========================================================================
--
--  This package is the interface for the UART transmitter related
--  procedures
--
--===========================================================================
--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with Edc_Client.LED;
with Edc_Client.Matrix.Types;

package Transmitter.UART is

   --------------------------------------------------------------------------
   --  Initializes the UART trasnmitter.
   --  This must be called before any other procedure can be called.
   --------------------------------------------------------------------------
   procedure Initialize;

   --------------------------------------------------------------------------
   --  Transmits the given LED control string to the dashboard.
   --------------------------------------------------------------------------
   procedure Transmit_LED (Control : Edc_Client.LED.LED_String);

   --------------------------------------------------------------------------
   --  Transmits the given Byte control string to the dashboard for the
   --  WORD display part.
   --------------------------------------------------------------------------
   procedure Transmit_Matrix_W_Byte
     (Control : Edc_Client.Matrix.Types.Byte_String);

   --------------------------------------------------------------------------
   --  Transmits the given Word control string to the dashboard for the
   --  WORD display part.
   --------------------------------------------------------------------------
   procedure Transmit_Matrix_W_Word
     (Control : Edc_Client.Matrix.Types.Word_String);

   --------------------------------------------------------------------------
   --  Transmits the given Byte control string to the dashboard for
   --  the DOUBLE WORD display part.
   --------------------------------------------------------------------------
   procedure Transmit_Matrix_D_Byte
     (Control : Edc_Client.Matrix.Types.Byte_String);

   --------------------------------------------------------------------------
   --  Transmits the given Word control string to the dashboard for
   --  the DOUBLE WORD display part.
   --------------------------------------------------------------------------
   procedure Transmit_Matrix_D_Word
     (Control : Edc_Client.Matrix.Types.Word_String);

   --------------------------------------------------------------------------
   --  Transmits the given Double Word control string to the dashboard for
   --  the DOUBLE WORD display part.
   --------------------------------------------------------------------------
   procedure Transmit_Matrix_D_Double_Word
     (Control : Edc_Client.Matrix.Types.Double_Word_String);

end Transmitter.UART;
