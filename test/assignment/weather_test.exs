defmodule Assignment.WeatherTest do
  use Assignment.DataCase

  alias Assignment.Weather

  test "get forecast by geolocation", %{lat: lat, lon: lon} do
    {:ok, weather} = Weather.get_forecast_by_geolocation(lat, lon)

    assert weather.date == 1_609_238_999
    assert weather.feels_like == 273.36
    assert weather.sunrise == 1_609_228_234
    assert weather.sunset == 1_609_256_065
    assert weather.temperature == 277.21
    assert length(weather.daily) == 8
    assert weather.weather == [
      %{
        description: "light rain",
        icon: "10d",
        id: 500,
        main: "Rain"
      }
    ]
  end
end
