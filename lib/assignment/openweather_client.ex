defmodule Assignment.OpenweatherClient do
  @moduledoc """
  Set of functions for fetching external data from OpenWeatherMap.org.
  """

  use Tesla

  @api_key Application.get_env(:assignment, :openweather_api_key)
  @exclude "minutely,hourly,alerts"

  # set the openweather base url
  plug Tesla.Middleware.BaseUrl, "https://api.openweathermap.org/data/2.5"

  # set the query params
  plug Tesla.Middleware.Query, [appid: @api_key, exclude: @exclude]

  # automatically decode json body upon succesful fetching
  plug Tesla.Middleware.DecodeJson

  @doc """
  Uses openweathermap's onecall location to fetch weather data.
  """
  @spec get_by_geolocation(float, float) :: {:ok, map}
  def get_by_geolocation(lat, lon) do
    get("/onecall", query: [lat: lat, lon: lon])
  end

  @doc """
  Gets the body from openweathermap's response if the status is 200.
  Otherwise, returns :error.
  """
  @spec get_body(map) :: {:ok, map} | :error
  def get_body(%{status: 200, body: body}), do: {:ok, body}
  def get_body(_), do: :error
end
