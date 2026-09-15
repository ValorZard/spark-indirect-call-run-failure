------------------------------------------------------------------------------
--  Stark -- the subprogram whose contract is false.
--
--  Indirect is declared Global => null.  It increments Counter.
--  gnatprove accepts the contract without a word.
------------------------------------------------------------------------------

package Stark with SPARK_Mode => On is

   subtype Small is Integer range 0 .. 1000;

   Counter : Small := 0;

   procedure Target (X : Small)
     with Global => (In_Out => Counter),
          Pre    => Counter + X <= 1000;

   --  THE LIE.  Indirect reaches Target through an access value, so SPARK
   --  models the call as touching nothing and this contract is discharged.
   procedure Indirect (X : Small)
     with Global => null,
          Pre    => X <= 1;

   function Peek return Small with Global => (Input => Counter);

end Stark;
