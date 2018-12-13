
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
$printed = $FALSE

function printFizzBuzz()
 {

 if($Min -ge $Max)
     {
        Write-Output("Start number must be less than end number")
     }

      [int]$Fizz = Read-Host -Prompt "Enter Fizz Number"
      [int]$Buzz = Read-Host -Prompt "Enter Buzz Number"
      [int] $FizzBuzz = Read-Host -Prompt "Enter FizzBuzz Number"
  
    $Output = ""

    for ($X = $Min; $X -le $Max; $X++) {
          
         
          if ($X % $FizzBuzz -eq 0) 
          { 
             $Output += " FizzBuzz " 
             #$printed = $true
             
          }
        
          elseif ($X % $Fizz -eq 0) 
          { 
            $Output += " Fizz "
             
          }
         
          elseif ($x % $Buzz -eq 0 -and  $printed -eq $false) 
          {
             $Output += " Buzz "
             
          }
      
          else 
          { 
             $Output += " " + $X  
             
          }
       
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