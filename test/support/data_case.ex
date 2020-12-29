defmodule Assignment.DataCase do
  @moduledoc """
  This module defines the setup for tests requiring
  access to the application's data layer.

  You may define functions here to be used as helpers in
  your tests.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use AssignmentWeb.DataCase, async: true`, although
  this option is not recommendded for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import Assignment.DataCase
    end
  end

  setup tags do
    Tesla.Mock.mock(fn request ->
      %Tesla.Env{status: 200, body: mock_body()}
    end)

    {:ok, lat: 52.3667, lon: 4.8945}
  end

  def mock_body do
    %{
      "current" => %{
        "clouds" => 20,
        "dew_point" => 275.08,
        "dt" => 1_609_238_999,
        "feels_like" => 273.36,
        "humidity" => 86,
        "pressure" => 985,
        "rain" => %{"1h" => 0.11},
        "sunrise" => 1_609_228_234,
        "sunset" => 1_609_256_065,
        "temp" => 277.21,
        "uvi" => 0.19,
        "visibility" => 10000,
        "weather" => [
          %{
            "description" => "light rain",
            "icon" => "10d",
            "id" => 500,
            "main" => "Rain"
          }
        ],
        "wind_deg" => 220,
        "wind_speed" => 3.1
      },
      "daily" => [
        %{
          "clouds" => 59,
          "dew_point" => 275.3,
          "dt" => 1_609_239_600,
          "feels_like" => %{
            "day" => 274.19,
            "eve" => 273.96,
            "morn" => 273.47,
            "night" => 273.3
          },
          "humidity" => 88,
          "pop" => 0.76,
          "pressure" => 985,
          "rain" => 3.63,
          "sunrise" => 1_609_228_234,
          "sunset" => 1_609_256_065,
          "temp" => %{
            "day" => 277.1,
            "eve" => 277.32,
            "max" => 278.06,
            "min" => 276.13,
            "morn" => 276.51,
            "night" => 277.46
          },
          "uvi" => 0.23,
          "weather" => [
            %{
              "description" => "moderate rain",
              "icon" => "10d",
              "id" => 501,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 289,
          "wind_speed" => 1.8
        },
        %{
          "clouds" => 100,
          "dew_point" => 276.52,
          "dt" => 1_609_326_000,
          "feels_like" => %{
            "day" => 275.46,
            "eve" => 272.7,
            "morn" => 274.7,
            "night" => 272.74
          },
          "humidity" => 78,
          "pop" => 0.94,
          "pressure" => 999,
          "rain" => 5.42,
          "sunrise" => 1_609_314_635,
          "sunset" => 1_609_342_521,
          "temp" => %{
            "day" => 279.99,
            "eve" => 277.27,
            "max" => 280.24,
            "min" => 276.57,
            "morn" => 278,
            "night" => 276.57
          },
          "uvi" => 0.28,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 289,
          "wind_speed" => 4.4
        },
        %{
          "clouds" => 100,
          "dew_point" => 275.16,
          "dt" => 1_609_412_400,
          "feels_like" => %{
            "day" => 272.84,
            "eve" => 273.16,
            "morn" => 271.14,
            "night" => 273.72
          },
          "humidity" => 92,
          "pop" => 0.74,
          "pressure" => 1001,
          "rain" => 1.41,
          "sunrise" => 1_609_401_031,
          "sunset" => 1_609_428_980,
          "temp" => %{
            "day" => 276.19,
            "eve" => 276.55,
            "max" => 276.9,
            "min" => 275.23,
            "morn" => 275.48,
            "night" => 276.9
          },
          "uvi" => 0.33,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 158,
          "wind_speed" => 2.37
        },
        %{
          "clouds" => 83,
          "dew_point" => 274.61,
          "dt" => 1_609_498_800,
          "feels_like" => %{
            "day" => 274.81,
            "eve" => 273.01,
            "morn" => 273.11,
            "night" => 272.07
          },
          "humidity" => 82,
          "pop" => 0.64,
          "pressure" => 1008,
          "rain" => 0.38,
          "sunrise" => 1_609_487_425,
          "sunset" => 1_609_515_442,
          "temp" => %{
            "day" => 277.3,
            "eve" => 275.29,
            "max" => 277.3,
            "min" => 274.35,
            "morn" => 276.43,
            "night" => 274.35
          },
          "uvi" => 0.42,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 79,
          "wind_speed" => 1.02
        },
        %{
          "clouds" => 11,
          "dew_point" => 272.98,
          "dt" => 1_609_585_200,
          "feels_like" => %{
            "day" => 273.43,
            "eve" => 271,
            "morn" => 270.29,
            "night" => 270.4
          },
          "humidity" => 78,
          "pop" => 0.01,
          "pressure" => 1013,
          "sunrise" => 1_609_573_814,
          "sunset" => 1_609_601_907,
          "temp" => %{
            "day" => 276.49,
            "eve" => 274.06,
            "max" => 276.49,
            "min" => 273.4,
            "morn" => 273.44,
            "night" => 273.4
          },
          "uvi" => 0.44,
          "weather" => [
            %{
              "description" => "few clouds",
              "icon" => "02d",
              "id" => 801,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 179,
          "wind_speed" => 1.51
        },
        %{
          "clouds" => 0,
          "dew_point" => 272.07,
          "dt" => 1_609_671_600,
          "feels_like" => %{
            "day" => 273.49,
            "eve" => 270.13,
            "morn" => 269.95,
            "night" => 269.65
          },
          "humidity" => 81,
          "pop" => 0.14,
          "pressure" => 1015,
          "sunrise" => 1_609_660_201,
          "sunset" => 1_609_688_375,
          "temp" => %{
            "day" => 275.78,
            "eve" => 273.39,
            "max" => 275.78,
            "min" => 272.81,
            "morn" => 272.81,
            "night" => 273.03
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "clear sky",
              "icon" => "01d",
              "id" => 800,
              "main" => "Clear"
            }
          ],
          "wind_deg" => 327,
          "wind_speed" => 0.38
        },
        %{
          "clouds" => 98,
          "dew_point" => 271.98,
          "dt" => 1_609_758_000,
          "feels_like" => %{
            "day" => 271.35,
            "eve" => 270.16,
            "morn" => 269.24,
            "night" => 271.13
          },
          "humidity" => 81,
          "pop" => 0.16,
          "pressure" => 1015,
          "sunrise" => 1_609_746_584,
          "sunset" => 1_609_774_845,
          "temp" => %{
            "day" => 275.79,
            "eve" => 274.23,
            "max" => 275.79,
            "min" => 272.35,
            "morn" => 272.72,
            "night" => 274.89
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "overcast clouds",
              "icon" => "04d",
              "id" => 804,
              "main" => "Clouds"
            }
          ],
          "wind_deg" => 47,
          "wind_speed" => 3.45
        },
        %{
          "clouds" => 100,
          "dew_point" => 274.36,
          "dt" => 1_609_844_400,
          "feels_like" => %{
            "day" => 271.88,
            "eve" => 271.51,
            "morn" => 271.13,
            "night" => 271.16
          },
          "humidity" => 90,
          "pop" => 0.43,
          "pressure" => 1017,
          "rain" => 0.42,
          "sunrise" => 1_609_832_964,
          "sunset" => 1_609_861_319,
          "temp" => %{
            "day" => 275.73,
            "eve" => 274.86,
            "max" => 275.73,
            "min" => 274.49,
            "morn" => 275,
            "night" => 274.49
          },
          "uvi" => 1,
          "weather" => [
            %{
              "description" => "light rain",
              "icon" => "10d",
              "id" => 500,
              "main" => "Rain"
            }
          ],
          "wind_deg" => 45,
          "wind_speed" => 2.9
        }
      ],
      "lat" => 52.37,
      "lon" => 4.89,
      "timezone" => "Europe/Amsterdam",
      "timezone_offset" => 3600
    }
  end
end
