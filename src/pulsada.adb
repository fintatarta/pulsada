pragma Ada_2012;
package body Pulsada is

   ---------------
   -- New_Block --
   ---------------

   function New_Block
     (N_Channels : Channel_Index;
      N_Frames   : Frame_Counter)
      return Frame_Block
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "New_Block unimplemented");
      return raise Program_Error with "Unimplemented function New_Block";
   end New_Block;

   --------------
   -- N_Frames --
   --------------

   function N_Frames
     (Item : Frame_Block)
      return Frame_Counter
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "N_Frames unimplemented");
      return raise Program_Error with "Unimplemented function N_Frames";
   end N_Frames;

   ---------
   -- Get --
   ---------

   function Get
     (Block : Frame_Block;
      N     : Frame_Counter)
      return Frame
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get unimplemented");
      return raise Program_Error with "Unimplemented function Get";
   end Get;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (Object : in out Frame_Block) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Finalize unimplemented");
      raise Program_Error with "Unimplemented procedure Finalize";
   end Finalize;

end Pulsada;
