defmodule Assignment.OpenWeather do
  use Tesla

  @api_key "ea749537778f58a145632f8264d5a109"
  @exclude "minutely,hourly,alerts"

  plug Tesla.Middleware.BaseUrl, "https://api.openweathermap.org/data/2.5"
  plug Tesla.Middleware.Query, [appid: @api_key, exclude: @exclude]
  plug Tesla.Middleware.DecodeJson

  def get_by_coordinates(lat, long) do
    get("/onecall", query: [lat: lat, lon: lon])
  end

  def get_body(%{status: 200, body: body}), do: {:ok, body}
  def get_body(_), do: :error
end
