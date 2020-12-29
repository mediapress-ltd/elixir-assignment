defmodule Assignment.Weather do
  @moduledoc """
  The Weather Context
  """

  require Logger

  # plug n' play weather data provider client
  # can be extended to implement a weather client behaviour
  @client Assignment.OpenweatherClient

  # plug n' play weather data formatter
  # can be extended to implement a weather data formatter behaviour
  @formatter Assignment.OpenweatherFormatter

  @doc """
  Retrieves weather information by latitude and longitude.
  """
  @spec get_weather_by_geolocation(float, float) :: map
  def get_weather_by_geolocation(lat, lon) do
    with {:ok, resp} <- @client.get_by_geolocation(lat, lon),
         {:ok, body} <- @client.get_body(resp) do
      {:ok, @formatter.format(body)}
    else
      :error ->
        Logger.error("Error getting weather. Lat: #{lat}, Lon: #{lon}")
        {:error, "An error occured while fetching weather data."}
    end
  end
end
