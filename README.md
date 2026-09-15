# gnatprove models a call through an access-to-subprogram as having no effects
*NOTHING IS ASSUMED, ONLY SPARK MODE IS OFF ON ONE FUNCTION*

Toolchain: gnatprove FSF 16.1.0, GNAT/GCC 15.2.0, gprbuild 25.0.1.

## Run it

    alr gnatprove -P spark_indirect_call.gpr --mode=all --level=2 -j0 -U
    # => Success: all checks proved (11 checks).

    alr exec -- gprbuild -P spark_indirect_call.gpr -j0 -f
    ./obj/main_s
    # => counter before = 0
    # => raised ADA.ASSERTIONS.ASSERTION_ERROR : proof.adb:12

`Stark.Indirect` is declared `Global => null` and increments `Stark.Counter`.
`Proof.Demo` asserts the counter is unchanged across the call. gnatprove
proves the assertion; running the program raises it.
