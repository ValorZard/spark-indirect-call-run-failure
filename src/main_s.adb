with Ada.Text_IO; with Stark; with Proof;

procedure Main_S with SPARK_Mode => On is
begin
   Ada.Text_IO.Put_Line ("counter before =" & Stark.Peek'Image);
   Proof.Demo;
   Ada.Text_IO.Put_Line ("counter after  =" & Stark.Peek'Image);
end Main_S;
