with Ada.Finalization;

use Ada;
package Pulsada.Frame_Blocks is
   type Frame_Block (<>) is
     new Finalization.Limited_Controlled
   with
     private;

   type Frame_Counter is new Positive;

   function New_Block (N_Channels : Channel_Index;
                       N_Frames   : Frame_Counter)
                       return Frame_Block;

   function N_Frames (Item : Frame_Block)
                      return Frame_Counter;

   function Get (Block : Frame_Block;
                 N     : Frame_Counter)
                 return Frame;
private
   type Block_Buffer is array (Positive range <>) of Sample_Type;

   type Block_Buffer_Access is access Block_Buffer;

   type Frame_Block  is
     new Finalization.Limited_Controlled
   with
      record
         Data       : Block_Buffer_Access;
         N_Frames   : Frame_Counter;
         N_Channels : Channel_Index;
      end record;

   overriding procedure Finalize (Object : in out Frame_Block);
end Pulsada.Frame_Blocks;
