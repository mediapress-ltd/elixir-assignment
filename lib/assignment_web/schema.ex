defmodule AssignmentWeb.Schema do
  use Absinthe.Schema

  alias AssignmentWeb.Resolvers

  query do
    @desc "The weather forecast"
    field :weather_forecast, :weather_forecast do
      arg :input, non_null(:coordinate_input)
      resolve &Resolvers.current_weather_with_forecast/3
    end
  end

  @desc """
  The input coordinate.

  Technically to satisfy the requirement of passing a
  string for lat and lon, e.g. "52.3667", "4.8945", we
  could have chosen :string as the type for both of them.

  But we can take advantage of Absinthe validating the
  float requirement for us so I opted to use float instead.

  Hopefully it's a small change on the client. Otherwise,
  we can define our own scalar FloatString maybe.
  """
  input_object :coordinate_input do
    field :latitude, non_null(:float)
    field :longitude, non_null(:float)
  end

  @desc """
  The weather data including the current weather and a
  daily forecast.

  I thought of returning date for date and time for the
  sunrise/sunset fields. However, it might be better to
  handle format it in the clients.

  If we really have to format it from the backend, then
  we can use some custom scalars on the next iteration.
  """
  object :weather_forecast do
    field :date, :integer
    field :sunrise, :integer
    field :sunset, :integer
    field :temperature, :float
    field :feels_like, :float
    field :weather, list_of(:weather_summary)
    field :daily, list_of(:daily_forecast)
  end

  @desc """
  The daily forecast.
  """
  object :daily_forecast do
    field :date, :integer
    field :pressure, :integer
    field :humidity, :integer
    field :temperature, :temperature
    field :feels_like, :temperature
  end

  @desc """
  A quick summary of the weather conditions in
  as little words possible.
  """
  object :weather_summary do
    field :main, :string
    field :description, :string
  end

  @desc """
  The temperature object. Used as type for
  both temperature and heat_index data.

  We actually don't have values for min & max
  heat_index (i.e. feels_like). But since the
  difference between the two data structures
  are negligble, we opted for its reuse.
  """
  object :temperature do
    field :morning, :float
    field :day, :float
    field :evening, :float
    field :night, :float
    field :min, :float
    field :max, :float
  end
end
