defmodule AssignmentWeb.Schema.Query.WeatherForecastTest do
  use Assignment.DataCase, async: true
  use AssignmentWeb.ConnCase, async: true

  @query """
  query WeatherForecast($input: CoordinateInput!) {
    weatherForecast(input: $input) {
      date
      sunrise
      sunset
      temperature
      feelsLike
      weather {
        main
        description
      }
      daily {
        date
        pressure
        humidity
        temperature {
          day
          min
          max
          night
          evening
          morning
        }
        feelsLike {
          day
          night
          evening
          morning
        }
      }
    }
  }
  """
  @variables %{
    input: %{
      "latitude" => 52.3667,
      "longitude" => 4.8945
    }
  }
  test "weatherForecast returns current weather with daily forecasts" do
    conn = build_conn()
    conn = post conn, "/api", query: @query, variables: @variables

    resp = json_response(conn, 200)["data"]["weatherForecast"]
    
    assert resp["date"] == 1609238999
    assert resp["feelsLike"] == 273.36
    assert resp["sunrise"] == 1609228234
    assert resp["sunset"] == 1609256065
    assert resp["temperature"] == 277.21
    assert resp["weather"] == [%{"description" => "light rain", "main" => "Rain"}]

    assert length(resp["daily"]) == 8
    [daily | _] = resp["daily"]

    assert daily == %{
      "date" => 1609239600,
      "feelsLike" => %{
        "day" => 274.19,
        "evening" => 273.96,
        "morning" => 273.47,
        "night" => 273.3
      },
      "humidity" => 88,
      "pressure" => 985,
      "temperature" => %{
        "day" => 277.1,
        "evening" => 277.32,
        "max" => 278.06,
        "min" => 276.13,
        "morning" => 276.51,
        "night" => 277.46
      }
    }
 end
end
