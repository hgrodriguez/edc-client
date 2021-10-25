package body Edc_Client.LED is

   Is_Initialized : Boolean := False;

   function Initialized return Boolean is
   begin
      return Is_Initialized;
   end Initialized;

   Transmitter : Transmit_Procedure;

   procedure Initialize (T : Transmit_Procedure) is
   begin
      Transmitter := T;
      Is_Initialized := True;
   end Initialize;

   procedure Red_On is
      Command : constant LED_String := "L0R1";
   begin
      Transmitter.all (Command);
   end Red_On;

   procedure Red_Off is
      Command : constant LED_String := "L0R0";
   begin
      Transmitter.all (Command);
   end Red_Off;

   procedure Red_Toggle is
      Command : constant LED_String := "L0R2";
   begin
      Transmitter.all (Command);
   end Red_Toggle;

   procedure Amber_On is
      Command : constant LED_String := "L0A1";
   begin
      Transmitter.all (Command);
   end Amber_On;

   procedure Amber_Off is
      Command : constant LED_String := "L0A0";
   begin
      Transmitter.all (Command);
   end Amber_Off;

   procedure Amber_Toggle is
      Command : constant LED_String := "L0A2";
   begin
      Transmitter.all (Command);
   end Amber_Toggle;

   procedure Green_On is
      Command : constant LED_String := "L0G1";
   begin
      Transmitter.all (Command);
   end Green_On;

   procedure Green_Off is
      Command : constant LED_String := "L0G0";
   begin
      Transmitter.all (Command);
   end Green_Off;

   procedure Green_Toggle is
      Command : constant LED_String := "L0G2";
   begin
      Transmitter.all (Command);
   end Green_Toggle;

   procedure White_On is
      Command : constant LED_String := "L0W1";
   begin
      Transmitter.all (Command);
   end White_On;

   procedure White_Off is
      Command : constant LED_String := "L0W0";
   begin
      Transmitter.all (Command);
   end White_Off;

   procedure White_Toggle is
      Command : constant LED_String := "L0W2";
   begin
      Transmitter.all (Command);
   end White_Toggle;

   procedure Blue_On is
      Command : constant LED_String := "L0B1";
   begin
      Transmitter.all (Command);
   end Blue_On;

   procedure Blue_Off is
      Command : constant LED_String := "L0B0";
   begin
      Transmitter.all (Command);
   end Blue_Off;

   procedure Blue_Toggle is
      Command : constant LED_String := "L0B2";
   begin
      Transmitter.all (Command);
   end Blue_Toggle;

end Edc_Client.LED;
