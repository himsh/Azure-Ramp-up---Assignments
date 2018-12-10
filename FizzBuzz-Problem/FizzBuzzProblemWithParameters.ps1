
[CmdletBinding()]
 param (
  [Parameter(Mandatory = $false, Position = 0)]
  $Min = 1,

  [Parameter(Mandatory = $false, Position = 1)]
  $Max = 100,

  [Parameter(Mandatory = $false, Position = 2)]
  $number = 5
)

$count = 0

function printFizzBuzz()
 {

 if($Min -ge $Max)
     {
        Write-Output("Start number must be less than end number")
     }

      
  
    $Output = ""

    for ($X = $Min; $X -le $Max; $X++) {
          
          
          if ($X % 15 -eq 0) 
             { $Output += " FizzBuzz " }

          elseif ($X % 3 -eq 0) { $Output += " Fizz " }

          elseif ($x % 5 -eq 0) {$Output += " Buzz "}
      
          else { $Output += " " + $X  }
       
          $count = $count + 1

          if($count -eq $number)
          {
             $Output += "`n"
             $count = 0
          }

     }

     Write-Output $Output
 }
   
printFizzBuzz  