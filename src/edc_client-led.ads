package Edc_Client.LED is

   type LED_String is new String (1 .. 4);

   type Transmit_Procedure is access not null procedure (Control : LED_String);

   procedure Initialize (T : Transmit_Procedure);

   function Initialized return Boolean;

   procedure Red_On with Pre => Initialized;
   procedure Red_Off with Pre => Initialized;
   procedure Red_Toggle with Pre => Initialized;

   procedure Amber_On with Pre => Initialized;
   procedure Amber_Off with Pre => Initialized;
   procedure Amber_Toggle with Pre => Initialized;

   procedure Green_On with Pre => Initialized;
   procedure Green_Off with Pre => Initialized;
   procedure Green_Toggle with Pre => Initialized;

   procedure White_On with Pre => Initialized;
   procedure White_Off with Pre => Initialized;
   procedure White_Toggle with Pre => Initialized;

   procedure Blue_On with Pre => Initialized;
   procedure Blue_Off with Pre => Initialized;
   procedure Blue_Toggle with Pre => Initialized;

end Edc_Client.LED;
