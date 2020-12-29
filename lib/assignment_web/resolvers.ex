defmodule AssignmentWeb.Resolvers do
  alias Assignment.Weather

  def weather_forecast(_, %{input: input}, _) do
    Weather.get_forecast_by_geolocation(input.latitude, input.longitude)
  end

end
