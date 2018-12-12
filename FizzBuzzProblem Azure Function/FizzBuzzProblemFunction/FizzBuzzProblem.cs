
using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Azure.WebJobs.Host;
using Newtonsoft.Json;
using System;

namespace FizzBuzzProblemFunction
{
    public static class FizzBuzzProblem
    {
        [FunctionName("FizzBuzzProblem")]
        public static IActionResult Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = null)]HttpRequest req, TraceWriter log)
        {
            log.Info("C# HTTP trigger function processed a request.");

            string result = string.Empty;

            string startNumber = req.Query["startNumber"];
            string stopNumber = req.Query["stopNumber"];
            string numbersInLine = req.Query["numbersInLine"];

            int count = 0;

            if (Convert.ToInt32(startNumber) < 0)
            {
                return new BadRequestObjectResult("Start number cannot be less than zero");
            }

            if (Convert.ToInt32(stopNumber) < Convert.ToInt32(startNumber))
            {
                return new BadRequestObjectResult("Stop number cannot be less than start number");
            }

            if(Convert.ToInt32(stopNumber) < 0)
            {
                return new BadRequestObjectResult("Stop number cannot be less than zero");
            }


            for (int i = Convert.ToInt32(startNumber); i <= Convert.ToInt32(stopNumber); i++)
            {
               
                bool fizz = i % 3 == 0;
                bool buzz = i % 5 == 0;

                if (fizz && buzz)
                    result += "FizzBuzz ";
                else if (fizz)
                    result += "Fizz ";
                else if (buzz)
                    result += "Buzz ";
                else
                    result += i + " ";

                count = ++count;

                if (count == Convert.ToInt32(numbersInLine))
                {
                    result += "\n\n";
                    count = 0;
                }
            }

            string requestBody = new StreamReader(req.Body).ReadToEnd();
            dynamic data = JsonConvert.DeserializeObject(requestBody);
            startNumber = data?.startNumber;
            stopNumber = data?.stopNumber;
            numbersInLine = data?.numbersInLine;

          

            return (ActionResult)new OkObjectResult($"The Output for FizzBuzz is: \n {result}");
              //  : new BadRequestObjectResult("Please pass parameters correctly in querystring as startNumber, stopNumber and numbersInLine");
        }
    }
}
