       Identification division.
      
       Program-ID. COBOLLATZ.

       Data division.

       Working-storage section.
       01 WS-INTEGERS.
           05 WS-START-PT  BINARY-LONG.
           05 WS-ITERATION BINARY-LONG.

       Procedure division.

       Main section.
           Initialize WS-START-PT, WS-ITERATION.
           Display "Input starting point:".
           Accept WS-START-PT from console.
           Move WS-START-PT to WS-ITERATION.
           Perform GENERATE-COLLATZ
               with test after until WS-ITERATION is equal to 1.
           Display "END".
           Stop run.

       GENERATE-COLLATZ section.
           Evaluate function rem (WS-ITERATION,2)
               when 0
                   divide WS-ITERATION by 2 giving WS-ITERATION
               when not 0
                   multiply WS-ITERATION by 3 giving WS-ITERATION
                   add 1 to WS-ITERATION giving WS-ITERATION
               end-evaluate.
           Display WS-ITERATION.
