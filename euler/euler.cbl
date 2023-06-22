000100 Identification division.
       Program-ID.    EULER.
       Date-written.  2023-06-13.
       Installation.  WSL2.
       Security.      Non-confidential.
       Remarks.       Not working yet.

       Environment division.
       Configuration section.
       Repository.
           Function p
           Function q.

       Data division.
       Working-storage section.
       77 WS-DIGIT picture is 9.
       77 WS-END-PT usage is binary-short unsigned.
       77 WS-PLACE usage is binary-short unsigned.

       Procedure division.
       MAIN section.
           Accept WS-END-PT from console.
           Perform varying WS-PLACE from 1 by 1
           until WS-PLACE is equal to WS-END-PT
               compute WS-DIGIT
                       rounded mode is nearest-away-from-zero
                       = (p(0,WS-PLACE) / q(0,WS-PLACE))
                       + 1
               end-compute
               display WS-DIGIT with no advancing
           end-perform.
           Stop run with normal status.

       End program EULER.
       
004000 Identification division.
       Function-ID. p.

       Environment division.
       Configuration section.
       Repository.
           Function q.

       Data division.
       Linkage section.
       77 LS-ARG1   usage is binary-long unsigned.
       77 LS-ARG2   usage is binary-long unsigned.
       77 LS-M      usage is binary-long unsigned.
       77 LS-RESULT usage is binary-long unsigned.

       Procedure division using LS-ARG1 LS-ARG2 returning LS-RESULT.
       MAIN section.
           If LS-ARG2 is equal to function sum(LS-ARG1,1)
               then move 1 to LS-RESULT
               else perform DEFAULTED
           end-if.
           Exit function.
           Exit section.

       DEFAULTED section.
           Compute LS-M
               rounded mode is toward-lesser
               = (LS-ARG1 + LS-ARG2) / 2
           end-compute.
           Compute LS-RESULT =
               (p(LS-ARG1,LS-M) * q(LS-M,LS-ARG2)) + p(LS-M,LS-ARG2)
           end-compute.
           Exit section.

       End function p.
       
009000 Identification division.
       Function-ID. q.

       Data division.
       Linkage section.
       77 LS-ARG1   usage is binary-long unsigned.
       77 LS-ARG2   usage is binary-long unsigned.
       77 LS-M      usage is binary-long unsigned.
       77 LS-RESULT usage is binary-long unsigned.

       Procedure division using LS-ARG1 LS-ARG2 returning LS-RESULT.
       INITIAL-DIGIT section.
           If LS-ARG2 is equal to function sum(LS-ARG1,1)
               then move LS-ARG2 to LS-RESULT
               else perform DEFAULTED
           end-if.
           Exit function.
           Exit section.
       
       DEFAULTED section.
           Compute LS-M
               rounded mode is toward-lesser
               = (LS-ARG1 + LS-ARG2) / 2
           end-compute.
           Compute LS-RESULT =
               q(LS-ARG1,LS-M) * q(LS-M,LS-ARG2)
           end-compute.
           Exit section.

       End function q.
