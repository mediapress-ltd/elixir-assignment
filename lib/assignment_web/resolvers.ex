defmodule AssignmentWeb.Resolvers do
  alias Assignment.Weather

  def current_weather_with_forecast(_, %{input: input}, _) do
    Weather.get_weather_by_geolocation(input.latitude, input.longitude)
  end

end
