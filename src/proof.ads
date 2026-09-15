------------------------------------------------------------------------------
--  Proof -- a client reasoning from Stark.Indirect's false contract.
--
--  Demo's assertion is proved by gnatprove and raises Assertion_Error when
--  the same program is run with -gnata.
------------------------------------------------------------------------------

with Stark;

package Proof with SPARK_Mode => On is

   procedure Demo with Global => (In_Out => Stark.Counter);

end Proof;
