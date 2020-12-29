defmodule Assignment.OpenweatherFormatter do
  @moduledoc """
  Functions for formatting data fetched from OpenWeatherMap.org.
  """

  @doc """
  Formats openweathermap onecall data into something that can
  be consumed by our graphql schema. At the moment, it simply
  returns a map. This can be modified to returned, say, a
  Forecast struct in the future.
  """
  @spec format(map) :: map
  def format(%{"current" => current, "daily" => daily}) do
    %{
      date: current["dt"],
      sunrise: current["sunrise"],
      sunset: current["sunset"],
      temperature: current["temp"],
      feels_like: current["feels_like"],
      weather: Enum.map(current["weather"], &format_weather/1),
      daily: Enum.map(daily, &format_daily/1)
    }
  end

  defp format_weather(weather) do
    %{
      id: weather["id"],
      icon: weather["icon"],
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
