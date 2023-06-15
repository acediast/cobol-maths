000100 Identification division.
       Program-ID.    BMI-CALCULATOR.
       Date-written.  2023-04-26.
       Installation.  WSL.
       Security.      Non-confidential.

001000 Environment division.
       Configuration section.
       Source-computer. x86-64.

002000 Data division.
       Working-storage section.
       77  WS-BMI           picture is 99.9.
           88 UNDERWEIGHT   value is 0 through 18.4.
           88 ACCEPTABLE    value is 18.5 through 23.0.
           88 OVERWEIGHT    value is 23.1 through 99.9.
       77  WS-WEIGHT        usage is float-short. 
       77  WS-HEIGHT        usage is float-short.
       77  WS-ACCEPTABILITY picture is X(18).

003000 Procedure division.
       MAIN section.
           Display "Enter weight in kg: " with no advancing.
           Accept WS-WEIGHT from console.
           Display "Enter height in m: " with no advancing.
           Accept WS-HEIGHT from console.
           Perform calculate-BMI.
           Display "Body Mass Index:" space WS-BMI.
           Perform EVALUATE-ACCEPTABILITY.
           Display function trim(WS-ACCEPTABILITY).
           Stop run.
       CALCULATE-BMI section.
           Initialize WS-BMI.
           Compute WS-BMI
               rounded mode is nearest-away-from-zero
               = WS-WEIGHT / (WS-HEIGHT ** 2)
           end-compute.
           Exit section.
       EVALUATE-ACCEPTABILITY section.
           Evaluate true
               when UNDERWEIGHT
                   move "Underweight." to WS-ACCEPTABILITY
               when OVERWEIGHT
                   move "Overweight." to WS-ACCEPTABILITY
               when ACCEPTABLE
                   move "Acceptable weight." to WS-ACCEPTABILITY
               when other
                   continue
           end-evaluate.
           Exit section.

       End program BMI-CALCULATOR.
