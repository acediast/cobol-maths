000100 Identification division.
       Program-ID.    BMI-CALCULATOR.
       Date-written.  2023-04-26.
       Installation.  WSL.
       Security.      Non-confidential.

001000 Environment division.
       Configuration section.
       Object-computer. x86-64.

002000 Data division.
       Working-storage section.
       77 WS-BMI            picture is 99.9.
       77 WS-WEIGHT         usage is float-short. 
       77 WS-HEIGHT         usage is float-short.
       77 WS-ACCEPTABILITY  picture is X(18).

003000 Procedure division.
       MAIN section.
           Display "Enter weight in kg: " with no advancing.
           Accept WS-WEIGHT from console.
           Display "Enter height in m: " with no advancing.
           Accept WS-HEIGHT from console.
           Perform calculate-BMI.
           Display "Body Mass Index:" space WS-BMI.
           Perform EVALUATE-ACCEPTABILITY.
           Display WS-ACCEPTABILITY.
           Stop run.
       CALCULATE-BMI section.
           Initialize WS-BMI.
           Compute WS-BMI = WS-WEIGHT / (WS-HEIGHT ** 2)
           end-compute.
           Exit section.
       EVALUATE-ACCEPTABILITY section.
           Evaluate true
               when WS-BMI is less than 18.5
                   move "Underweight." to WS-ACCEPTABILITY
               when WS-BMI is greater than 23.0
                   move "Overweight." to WS-ACCEPTABILITY
               when other
                   move "Acceptable weight." to WS-ACCEPTABILITY
           end-evaluate.
           Exit section.

       End program BMI-CALCULATOR.
