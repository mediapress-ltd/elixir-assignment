defmodule AssignmentWeb.Resolvers do

  def weather_forecast(_, _, _) do
    {:ok,
      %{
        date: 1595243443,
        sunrise: 1608124431,
        sunset: 1608160224,
        temperature: 274.75,
        feels_like: 270.4,
        weather: %{
          id: 701,
          main: "Mist",
          description: "mist",
          icon: "50n"
        },
        daily: [
          %{
            date: 1595268000,
            pressure: 1021,
            humidity: 70,
            temperature: %{
              day: 278.14,
              min: 273.15,
              max: 279.4,
              night: 273.15,
              evening: 275.82,
              morning: 275.35
            },
            feels_like: %{
              day: 273.53,
              night: 270.26,
              evening: 271.89,
              morning: 272.11
            },
            weather: [
              %{
                id: 803,
                main: "Clouds",
                description: "broken clouds",
                icon: "04d"
              }
            ]
          }]
        }
      }
  end

end
