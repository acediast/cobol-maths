# cobollatz
Little COBOL programme for generating Collatz conjecture sequences.
Accepts seed from standard input as signed integer of length 10 digits or less.
Stops upon reaching `4-2-1` loop.

Can be compiled using [GnuCOBOL](https://gnucobol.sourceforge.io/)
by running `cobc -x ./cobollatz.cbl` from console.
