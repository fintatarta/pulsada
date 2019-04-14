package Pulsada is
   type Sampling_Frequency is range 0 .. 1_000_000;

   type Sample_Type is mod 2 ** 16
     with Size => 16;

   Max_Channel : constant := 32;

   type Channel_Index is range 1 .. Max_Channel;

   type Frame is array (Channel_Index range <>) of Sample_Type;

end Pulsada;
