with Ada.Finalization;
with Pulsada.Frame_Blocks;

use Ada;
package Pulsada.Thin is
   type Session_Type is
     new Finalization.Limited_Controlled
   with
     private;

   procedure Open (Session         : in out Session_Type;
                   Rate            : Sampling_Frequency;
                   N_Channels      : Channel_Index;
                   Frame_Per_Block : Frame_Blocks.Frame_Counter);

   procedure Close (Session : in out Session_Type);
private
   type Session_Type is
     new Finalization.Limited_Controlled
   with
     null record;
end Pulsada.Thin;
