000100 Identification division.
       Program-ID.    COBOLLATZ.
       Date-written.  2023-06-08.
       Installation.  WSL2.
       Security.      Non-confidential.

001000 Environment division.
       Configuration section. 
       Source-computer. x86-64.
       Repository.
           Function HAILSTONE.

002000 Data division.
       Working-storage section.
       77 WS-NUMBER usage is binary-long.
       77 WS-OUTPUT picture is Z(9)9.

003000 Procedure division.
       Main section.
           Initialize WS-NUMBER.
           Display
               "Input starting point: "
               with no advancing upon console
           end-display.
           Accept WS-NUMBER from stdin.
           Perform with test after until WS-NUMBER is equal to 1
               move function HAILSTONE(WS-NUMBER) to WS-NUMBER
               move WS-NUMBER to WS-OUTPUT
               display function trim(WS-OUTPUT) upon stdout
           end-perform.
           Display "End." upon console.
           Stop run.

003999 End program COBOLLATZ.

004000 Identification division.
       Function-ID. HAILSTONE.
       Remarks. Evaluate parity, perform function and return result.
       
005000 Data division.
       Linkage section.
       77 LS-ARGUMENT usage is binary-long unsigned.
       77 LS-RESULT usage is binary-long unsigned.

006000 Procedure division using LS-ARGUMENT returning LS-RESULT.
       Main section.
           Evaluate function rem(LS-ARGUMENT,2)
               when 0
                   divide LS-ARGUMENT by 2 giving LS-RESULT
               when not 0
                   multiply LS-ARGUMENT by 3 giving LS-RESULT
                   add 1 to LS-RESULT giving LS-RESULT
           end-evaluate.
           Exit function.

006999 End function HAILSTONE.
