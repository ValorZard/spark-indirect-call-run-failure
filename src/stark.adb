package body Stark with SPARK_Mode => On is

   type Handler is access procedure (X : Small);

   procedure Target (X : Small) is
   begin
      Counter := Counter + X;
   end Target;

   --  The trusted-body idiom from the SPARK User's Guide: the one thing the
   --  language cannot express, hoisted into a body that is Off, behind a
   --  declaration that is On and carries a contract.
   --
   --  Make's contract is TRUE of Make.  The falsehood is in the value it
   --  returns, and there is nowhere to write that down -- see NOTE below.
   function Make return Handler
     with Global => null, Post => Make'Result /= null;

   function Make return Handler with SPARK_Mode => Off is
   begin
      return Target'Access;
   end Make;

   procedure Indirect (X : Small) is
      H : constant Handler := Make;
   begin
      --  Really writes Counter.  Modelled as a no-op.
      H.all (X);
   end Indirect;

   function Peek return Small is (Counter);

end Stark;
