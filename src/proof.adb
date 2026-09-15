package body Proof with SPARK_Mode => On is

   procedure Demo is
      Before, After : Stark.Small;
   begin
      Before := Stark.Peek;
      Stark.Indirect (1);
      After  := Stark.Peek;

      --  PROVED by gnatprove, because Indirect is modelled as touching
      --  nothing.  FALSE at run time.  This is line 9.
      pragma Assert (After = Before);
   end Demo;

end Proof;
