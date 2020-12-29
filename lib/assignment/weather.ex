defmodule Assignment.Weather do
  alias Assignment.OpenWeather

  def get_forecast_by_geolocation(lat, lon) do
    with {:ok, resp} <- OpenWeather.get_by_geolocation(lat, lon),
         {:ok, body} <- OpenWeather.get_body(resp) do
      {:ok, format(body)}
    end
  end

  defp format(%{"current" => current, "daily" => daily}) do
    %{
      date: current["dt"],
      sunrise: current["sunrise"],
      sunset: current["sunset"],
      temperature: current["temp"],
      feels_like: current["feels_like"],
      weather: format_weather(current["weather"]),
      daily: Enum.map(daily, &format_daily/1)
    }
  end

  defp format_weather([weather | _]) do
    %{
      main: weather["main"],
      description: weather["description"]
    }
  end

  defp format_daily(daily) do
    %{
      date: daily["dt"],
      pressure: daily["pressure"],
      humidity: daily["humidity"],
      temperature: format_temperature(daily["temp"]),
      feels_like: format_temperature(daily["feels_like"]),
    }
  end

  defp format_temperature(temperature) do
    %{
      day: temperature["day"],
      min: temperature["min"],
      max: temperature["max"],
      night: temperature["night"],
      evening: temperature["eve"],
      morning: temperature["morn"]
    }
  end
end
