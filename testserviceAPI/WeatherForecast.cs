namespace TestServiceAPI
{
    public class WeatherForecast
    {
        public DateTime Date { get; set; }

        public int TemperatureC { get; set; }

        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

        public string? Summary { get; set; }

        public string? UserName { get; set; }
    }


    public class PSOKPI
    {
        public DateTime SessionStart { get; set; }

        public Guid UserId { get; set; }
        public string? UserName { get; set; }
        public decimal ACR { get; set; }
        public int SessionDurationinMS { get; set; }


    }
}