$count = 0


try
{
    [uint32]$startNumber = Read-Host -Prompt 'Enter start number'
    [uint32]$endNumber = Read-Host -Prompt 'Enter stop number'
    [uint32]$number = Read-Host -Prompt 'Enter the number of number to be displyed in a line'
}
catch
{
  Write-Output "Ran into an issue: $($PSItem.ToString())"
  return
}

 
 function printFizzBuzz()
 {

 if($startNumber -ge $endNumber)
     {
        Write-Output("Start number must be less than end number")
     }

      
  
    $Output = ""

    for ($X = $startNumber; $X -le $endNumber; $X++) {
          
          
          if ($X % 15 -eq 0) 
             { $Output += "FizzBuzz  " }

          elseif ($X % 3 -eq 0) { $Output += " Fizz  " }

          elseif ($x % 5 -eq 0) {$Output += " Buzz  "}
      
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
     
     
 function Is-Numeric ($Value) {
    return $Value -match "^[\d\.]+$"
}