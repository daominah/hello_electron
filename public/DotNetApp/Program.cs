using System;
using ElectronCgi.DotNet;
using Microsoft.Extensions.Logging;

namespace DotNetApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var connection = new ConnectionBuilder().WithLogging(minimumLogLevel: LogLevel.Trace).Build();

            connection.On<dynamic, double>("sum", numbers =>
            {
                return numbers.num1 + numbers.num2;
            });

            connection.Listen();
        }
    }
}
