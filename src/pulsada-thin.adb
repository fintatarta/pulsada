pragma Ada_2012;
with Ada.Command_Line;

with System.Address_To_Access_Conversions;
with Interfaces.C.Strings;


with Pulse_Def_H, Pulse_Sample_H;

use Ada;
package body Pulsada.Thin is



   ----------
   -- Open --
   ----------

   procedure Open
     (Session           : in out Session_Type;
      Rate              : Sampling_Frequency;
      N_Channels        : Channel_Index;
      Application_Name  : String := "";
      Stream_Name       : String := "")
   is
      use Pulse_Simple_H;
      use Pulse_Sample_H;
      use Interfaces;

      function Use_Default (X, Default : String) return C.Strings.Chars_Ptr
      is (C.Strings.New_String ((if X = "" then Default else X)));

      Sample_Spec : aliased Pa_Sample_Spec := (Format   => PA_SAMPLE_S16LE,
                                               Rate     => Unsigned_32 (Rate),
                                               Channels => Unsigned_8 (N_Channels));
   begin
      Session.S := Pa_Simple_New
        (Server      => C.Strings.Null_Ptr,
         Name        => Use_Default(Application_Name, Command_Line.Command_Name),
         Dir         => Pulse_Def_H.PA_STREAM_RECORD,
         Dev         => C.Strings.Null_Ptr,
         Stream_Name => Use_Default (Stream_Name, "stream"),
         Ss          => Sample_Spec'Access,
         Map         => null,
         Attr        => null,
         Error       => null);
   end Open;

   ----------
   -- Read --
   ----------

   procedure Read
     (Session : in out Session_Type;
      Data    :        Frame_Block)
   is
      use Interfaces;
      use pulse_simple_h;
      use type Interfaces.C.int;
     pragma Warnings(off);
      package convert is
        new System.Address_To_Access_Conversions(Block_Buffer);

      function size(data : Frame_Block) return c.size_t
      is (c.size_t(Integer(data.N_Frames)*Integer(data.N_Channels)*2));

      err : aliased c.int;
   begin
      if pa_simple_read(s     => Session.S,
                         data  => convert.To_Address(convert.Object_Pointer(data.Data)),
                         bytes => size(data),
                         error => err'Access) < 0 then
             null;
          end if;
          end Read;

          -----------
          -- Close --
          -----------

          procedure Close (Session : in out Session_Type) is
          begin
          pulse_simple_h.pa_simple_free(session.s);
          end Close;

          ----------------
          -- Initialize --
          ----------------

          overriding procedure Initialize (Obj : in out Session_Type) is
          begin
          Obj.S := null;
          end Initialize;

          --------------
          -- Finalize --
          --------------

          overriding procedure Finalize (Obj : in out Session_Type) is
          begin
          obj.Close;
          end Finalize;

          end Pulsada.Thin;
