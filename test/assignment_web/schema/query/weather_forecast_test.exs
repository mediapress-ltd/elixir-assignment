defmodule AssignmentWeb.Schema.Query.WeatherForecastTest do
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
      "latitude" => "52.3667",
      "longitude" => "4.8945"
    }
  }
  test "weatherForecast returns current weather with daily forecasts" do
    conn = build_conn()
    conn = post conn, "/api", query: @query, variables: @variables

    IO.inspect json_response(conn, 200)
  end
end
