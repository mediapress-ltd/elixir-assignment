defmodule AssignmentWeb.Schema do
  use Absinthe.Schema

  alias AssignmentWeb.Resolvers

  query do
    field :weather_forecast, :current_weather do
      arg :input, non_null(:coordinate_input)
      resolve &Resolvers.weather_forecast/3
    end
  end

  input_object :coordinate_input do
    field :latitude, non_null(:string)
    field :longitude, non_null(:string)
  end

  object :current_weather do
    field :date, :integer
    field :sunrise, :integer
    field :sunset, :integer
    field :temperature, :float
    field :feels_like, :float
    field :weather, :weather_summary
    field :daily, list_of(:forecast)
  end

  object :forecast do
    field :date, :integer
    field :pressure, :integer
    field :humidity, :integer
    field :temperature, :temperature
    field :feels_like, :temperature
  end

  object :weather_summary do
    field :main, :string
    field :description, :string
  end

  object :temperature do
    field :morning, :float
    field :day, :float
    field :evening, :float
    field :night, :float
    field :min, :float
    field :max, :float
  end
end
